package com.ict.project.service;

import com.ict.project.vo.MemberVO;

public interface MemberService {
    int joinMember(MemberVO mvo);
    MemberVO loginMember(String m_id, String m_pw);
    boolean checkIdDuplicate(String m_id);
    
    // SNS 로그인용 추가
    MemberVO findByPhoneNumber(MemberVO mvo);
    int updateKakaoInfo(MemberVO mvo);
    int updateNaverInfo(MemberVO mvo);
    int insertKakaoInfo(MemberVO mvo);
    int insertNaverInfo(MemberVO mvo);
    MemberVO getMemberById(String m_id);
    MemberVO findIdByEmail(String m_name, String m_email);
    MemberVO findIdByPhone(String m_name, String m_phone);
    int getInformationUpdate(MemberVO mvo);
}