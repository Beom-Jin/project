package com.ict.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ict.project.repository.MemberDAO;
import com.ict.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    private MemberDAO memberDAO;
    
    @Override
    public int joinMember(MemberVO mvo) {
        try {
            return memberDAO.insertMember(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    @Override
    public MemberVO loginMember(String m_id, String m_pw) {
        try {
            MemberVO mvo = memberDAO.getMemberById(m_id);
            if (mvo != null && mvo.getM_pw().equals(m_pw)) {
                return mvo;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public boolean checkIdDuplicate(String m_id) {
        try {
            MemberVO mvo = memberDAO.getMemberById(m_id);
            return mvo != null;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public MemberVO findByPhoneNumber(MemberVO mvo) {
        try {
            return memberDAO.getMemberByPhone(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public int updateKakaoInfo(MemberVO mvo) {
        try {
            return memberDAO.updateKakaoInfo(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    @Override
    public int updateNaverInfo(MemberVO mvo) {
        try {
            return memberDAO.updateNaverInfo(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    @Override
    public int insertKakaoInfo(MemberVO mvo) {
        try {
            return memberDAO.insertKakaoMember(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    @Override
    public int insertNaverInfo(MemberVO mvo) {
        try {
            return memberDAO.insertNaverMember(mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    
    @Override
    public MemberVO getMemberById(String m_id) {
        try {
            return memberDAO.getMemberById(m_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public MemberVO findIdByEmail(String m_name, String m_email) {
        try {
            return memberDAO.findIdByEmail(m_name, m_email);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public MemberVO findIdByPhone(String m_name, String m_phone) {
        try {
            return memberDAO.findIdByPhone(m_name, m_phone);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
}