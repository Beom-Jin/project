package com.ict.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.service.EmailService;
import com.ict.project.service.MemberService;
import com.ict.project.vo.MemberVO;

import jakarta.mail.MessagingException;

@Controller
public class MemberController {
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private EmailService emailService;
    
    @GetMapping("/membersLoginForm")
    public ModelAndView showLoginForm() {
        return new ModelAndView("project/loginForm");
    }
    
    @GetMapping("/membersJoinForm")
    public ModelAndView showJoinForm() {
        return new ModelAndView("project/registrationForm");
    }
    
    @PostMapping("/checkId")
    @ResponseBody
    public String checkDuplicateId(@RequestParam("m_id") String m_id) {
        try {
            boolean isDuplicate = memberService.checkIdDuplicate(m_id);
            return isDuplicate ? "duplicate" : "available";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    
    @PostMapping("/membersJoin")
    public ModelAndView joinMember(MemberVO mvo) {
        ModelAndView mv = new ModelAndView();
        try {
            int result = memberService.joinMember(mvo);
            if (result > 0) {
                mv.addObject("message", "회원가입이 완료되었습니다.");
                mv.addObject("redirect", "/membersLoginForm");
            } else {
                mv.addObject("message", "회원가입에 실패했습니다.");
                mv.addObject("redirect", "/membersJoinForm");
            }
            mv.setViewName("project/result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("message", "오류가 발생했습니다.");
            mv.addObject("redirect", "/membersJoinForm");
            mv.setViewName("project/result");
        }
        return mv;
    }
    
    @PostMapping("/sendCodeForFindId")
    @ResponseBody
    public String sendCodeForFindId(@RequestParam("email") String email, 
                                     @RequestParam("name") String name, 
                                     HttpSession session) {
        try {
            MemberVO mvo = memberService.findIdByEmail(name, email);
            
            if (mvo == null) {
                return "notfound";
            }
            
            String code = emailService.sendAuthMail(email);
            session.setAttribute("findIdAuthCode", code);
            session.setAttribute("findIdAuthTime", System.currentTimeMillis());
            session.setAttribute("findIdEmail", email);
            session.setAttribute("findIdName", name);
            
            return "success";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "fail";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @PostMapping("/verifyCodeForFindId")
    @ResponseBody
    public String verifyCodeForFindId(@RequestParam("code") String code, 
                                       HttpSession session) {
        try {
            String saveCode = (String)session.getAttribute("findIdAuthCode");
            Long saveTime = (Long)session.getAttribute("findIdAuthTime");
            
            if (saveCode == null || saveTime == null) {
                return "nosession";
            }
            
            if((System.currentTimeMillis() - saveTime) > (60*5*1000)){
                return "expired";
            }
            
            if(saveCode.equals(code)) {
                String email = (String)session.getAttribute("findIdEmail");
                String name = (String)session.getAttribute("findIdName");
                
                MemberVO mvo = memberService.findIdByEmail(name, email);
                
                if (mvo != null) {
                    session.removeAttribute("findIdAuthCode");
                    session.removeAttribute("findIdAuthTime");
                    
                    return "match:" + mvo.getM_id();
                }
                
                return "notfound";
            }
            
            return "mismatch";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @GetMapping("/findresult")
    public ModelAndView findResult(@RequestParam(value="foundId", required=false) String foundId) {
        ModelAndView mv = new ModelAndView();
        if (foundId != null) {
            mv.addObject("foundId", foundId);
        }
        mv.setViewName("project/findresult");
        return mv;
    }
    
    @PostMapping("/membersLogin")
    public ModelAndView loginMember(@RequestParam("m_id") String m_id, 
                                    @RequestParam("m_pw") String m_pw,
                                    HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO mvo = memberService.loginMember(m_id, m_pw);
            
            if (mvo != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loginchk", "ok");
                session.setAttribute("m_id", mvo.getM_id());
                session.setAttribute("m_name", mvo.getM_name());
                session.setAttribute("m_idx", mvo.getM_idx());
                session.setAttribute("memberInfo", mvo); 
                
                mv.addObject("message", mvo.getM_name() + "님 환영합니다!");
                mv.addObject("redirect", "/showMain");
            } else {
                mv.addObject("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
                mv.addObject("redirect", "/membersLoginForm");
            }
            mv.setViewName("project/result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("message", "로그인 중 오류가 발생했습니다.");
            mv.addObject("redirect", "/membersLoginForm");
            mv.setViewName("project/result");
        }
        return mv;
    }
    
    @GetMapping("/membersLogout")
    public ModelAndView logout(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            mv.addObject("message", "로그아웃 되었습니다.");
            mv.addObject("redirect", "/showMain");
            mv.setViewName("project/result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("message", "오류가 발생했습니다.");
            mv.addObject("redirect", "/showMain");
            mv.setViewName("project/result");
        }
        return mv;
    }
    
    @PostMapping("/checkIdExists")
    public ModelAndView checkIdExists(@RequestParam("m_id") String m_id) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO mvo = memberService.getMemberById(m_id);
            
            if (mvo != null) {
                mv.addObject("m_id", m_id);
                mv.setViewName("project/myPage/findpassword");
            } else {
                mv.addObject("error", "notfound");
                mv.setViewName("project/findidpassword");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("error", "notfound");
            mv.setViewName("project/findidpassword");
        }
        return mv;
    }

    @PostMapping("/resetPassword")
    public ModelAndView resetPassword(@RequestParam("m_id") String m_id,
                                       @RequestParam("m_name") String m_name,
                                       @RequestParam("m_email") String m_email) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO mvo = memberService.getMemberById(m_id);
            
            if (mvo != null && mvo.getM_name().equals(m_name) && mvo.getM_email().equals(m_email)) {
                mv.addObject("message", "본인 확인이 완료되었습니다. 임시 비밀번호를 이메일로 전송했습니다.");
                mv.addObject("redirect", "/membersLoginForm");
            } else {
                mv.addObject("message", "입력하신 정보가 일치하지 않습니다.");
                mv.addObject("redirect", "/findidorpassword");
            }
            mv.setViewName("project/result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("message", "오류가 발생했습니다.");
            mv.addObject("redirect", "/findidorpassword");
            mv.setViewName("project/result");
        }
        return mv;
    }
    
    @PostMapping("/findIdByEmail")
    public ModelAndView findIdByEmail(@RequestParam("m_name") String m_name,
                                       @RequestParam("m_email") String m_email) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO mvo = memberService.findIdByEmail(m_name, m_email);
            
            if (mvo != null) {
                mv.addObject("foundId", mvo.getM_id());
            }
            mv.setViewName("project/findid_result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("project/findid_result");
        }
        return mv;
    }

    @PostMapping("/findIdByPhone")
    public ModelAndView findIdByPhone(@RequestParam("m_name_phone") String m_name,
                                       @RequestParam("m_phone") String m_phone) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO mvo = memberService.findIdByPhone(m_name, m_phone);
            
            if (mvo != null) {
                mv.addObject("foundId", mvo.getM_id());
            }
            mv.setViewName("project/findid_result");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("project/findid_result");
        }
        return mv;
    }
}