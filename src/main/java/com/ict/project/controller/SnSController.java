package com.ict.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ict.project.service.KakaoLoginUtil;
import com.ict.project.service.NaverLoginUtil;
import com.ict.project.service.MemberService;
import com.ict.project.vo.KakaoUserVO;
import com.ict.project.vo.NaverUserVO;
import com.ict.project.vo.MemberVO;

@Controller
public class SnSController {
    
    @Autowired
    private MemberService memberService;
    
    // 카카오 로그인 리다이렉트
    @GetMapping("/kakaologin")
    public ModelAndView getKakaoLogin(HttpServletRequest request, HttpSession session) {
        try {
            String code = request.getParameter("code");
            String accessToken = KakaoLoginUtil.getAccessToken(code);
            KakaoUserVO kakaoUserVO = KakaoLoginUtil.getUserInfo(accessToken);
            
            // ✅ 무조건 sns_join.jsp로 이동
            session.setAttribute("kakaoUserVO", kakaoUserVO);
            return new ModelAndView("project/sns_join");
            
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("project/error");
        }
    }
    
    // 네이버 로그인 리다이렉트
    @GetMapping("/naverlogin")
    public ModelAndView getNaverLogin(HttpServletRequest request, HttpSession session) {
        try {
            String code = request.getParameter("code");
            String state = request.getParameter("state");
            
            String accessToken = NaverLoginUtil.getAccessToken(code, state);
            NaverUserVO naverUserVO = NaverLoginUtil.getUserInfo(accessToken);
            
            // ✅ 무조건 sns_join.jsp로 이동
            session.setAttribute("naverUserVO", naverUserVO);
            return new ModelAndView("project/sns_join");
            
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("project/error");
        }
    }
    
    // SNS 회원가입/로그인 처리
    @PostMapping("/sns_join_ok")
    public ModelAndView getSnsJoin(MemberVO memberVO, HttpSession session) {
        
        if(session.getAttribute("kakaoUserVO") != null) {
            // 카카오 처리
            KakaoUserVO kakaoUserVO = (KakaoUserVO)session.getAttribute("kakaoUserVO");
            String mobile = kakaoUserVO.getKakao_account().getPhone_number();
            String phone = mobile.replaceAll("\\+82\\s?","0").trim();
            
            if(memberVO.getM_phone().equals(phone)) {
                // 전화번호로 기존 회원 검색
                MemberVO mvo = new MemberVO();
                mvo.setM_phone(phone);
                MemberVO existingMember = memberService.findByPhoneNumber(mvo);
                
                if(existingMember != null) {
                    // 기존 회원 - 카카오 정보 업데이트 후 로그인
                    existingMember.setSns_provider("kakao");
                    existingMember.setSns_email_kakao(kakaoUserVO.getKakao_account().getEmail());
                    existingMember.setSns_id(kakaoUserVO.getId());
                    
                    memberService.updateKakaoInfo(existingMember);
                    
                    session.setAttribute("memberVO", existingMember);
                    session.setAttribute("loginchk", "ok");
                    session.setAttribute("m_name", existingMember.getM_name());
                    session.setAttribute("m_id", existingMember.getM_id());
                    session.setAttribute("m_idx", existingMember.getM_idx());
                    
                    return new ModelAndView("redirect:/showMain");
                } else {
                    // 신규 회원 - 회원가입
                    MemberVO newMember = new MemberVO();
                    newMember.setM_id("kakao_" + kakaoUserVO.getId());
                    newMember.setM_name(kakaoUserVO.getKakao_account().getName());
                    newMember.setM_phone(memberVO.getM_phone());
                    newMember.setSns_email_kakao(kakaoUserVO.getKakao_account().getEmail());
                    newMember.setSns_provider("kakao");
                    newMember.setSns_id(kakaoUserVO.getId());
                    newMember.setM_auth("user");
                    
                    memberService.insertKakaoInfo(newMember);
                    
                    session.setAttribute("memberVO", newMember);
                    session.setAttribute("loginchk", "ok");
                    session.setAttribute("m_name", newMember.getM_name());
                    session.setAttribute("m_id", newMember.getM_id());
                    session.setAttribute("m_idx", newMember.getM_idx());
                    
                    return new ModelAndView("redirect:/showMain");
                }
            }
            
        } else if(session.getAttribute("naverUserVO") != null) {
            // 네이버 처리
            NaverUserVO naverUserVO = (NaverUserVO)session.getAttribute("naverUserVO");
            String phone = naverUserVO.getResponse().getMobile();
            
            if(memberVO.getM_phone().equals(phone)) {
                // 전화번호로 기존 회원 검색
                MemberVO mvo = new MemberVO();
                mvo.setM_phone(phone);
                MemberVO existingMember = memberService.findByPhoneNumber(mvo);
                
                if(existingMember != null) {
                    // 기존 회원 - 네이버 정보 업데이트 후 로그인
                    existingMember.setSns_email_naver(naverUserVO.getResponse().getEmail());
                    existingMember.setSns_provider("naver");
                    existingMember.setSns_id(naverUserVO.getResponse().getId());
                    
                    memberService.updateNaverInfo(existingMember);
                    
                    session.setAttribute("memberVO", existingMember);
                    session.setAttribute("loginchk", "ok");
                    session.setAttribute("m_name", existingMember.getM_name());
                    session.setAttribute("m_id", existingMember.getM_id());
                    session.setAttribute("m_idx", existingMember.getM_idx());
                    
                    return new ModelAndView("redirect:/showMain");
                } else {
                    // 신규 회원 - 회원가입
                    MemberVO newMember = new MemberVO();
                    newMember.setM_id("naver_" + naverUserVO.getResponse().getId());
                    newMember.setM_name(naverUserVO.getResponse().getName());
                    newMember.setM_phone(naverUserVO.getResponse().getMobile());
                    newMember.setSns_email_naver(naverUserVO.getResponse().getEmail());
                    newMember.setSns_provider("naver");
                    newMember.setSns_id(naverUserVO.getResponse().getId());
                    newMember.setM_auth("user");
                    
                    memberService.insertNaverInfo(newMember);
                    
                    session.setAttribute("memberVO", newMember);
                    session.setAttribute("loginchk", "ok");
                    session.setAttribute("m_name", newMember.getM_name());
                    session.setAttribute("m_id", newMember.getM_id());
                    session.setAttribute("m_idx", newMember.getM_idx());
                    
                    return new ModelAndView("redirect:/showMain");
                }
            }
        }
        
        return new ModelAndView("project/sns_join");
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}