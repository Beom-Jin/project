package com.ict.project.repository;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ict.project.vo.MemberVO;

@Repository
public class MemberDAO {
    
    @Autowired
    private SqlSessionTemplate sessionTemplate;
    
    public int insertMember(MemberVO mvo) {
        try {
            return sessionTemplate.insert("member.insert", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public MemberVO getMemberById(String m_id) {
        try {
            return sessionTemplate.selectOne("member.selectById", m_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // SNS 로그인용 추가
    public MemberVO getMemberByPhone(MemberVO mvo) {
        try {
            return sessionTemplate.selectOne("member.selectByPhone", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public int updateKakaoInfo(MemberVO mvo) {
        try {
            return sessionTemplate.update("member.updateKakaoInfo", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int updateNaverInfo(MemberVO mvo) {
        try {
            return sessionTemplate.update("member.updateNaverInfo", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int insertKakaoMember(MemberVO mvo) {
        try {
            return sessionTemplate.insert("member.insertKakao", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int insertNaverMember(MemberVO mvo) {
        try {
            return sessionTemplate.insert("member.insertNaver", mvo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public MemberVO findIdByEmail(String m_name, String m_email) {
        try {
            Map<String, String> params = new HashMap<>();
            params.put("m_name", m_name);
            params.put("m_email", m_email);
            return sessionTemplate.selectOne("member.findIdByEmail", params);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public MemberVO findIdByPhone(String m_name, String m_phone) {
        try {
            Map<String, String> params = new HashMap<>();
            params.put("m_name", m_name);
            params.put("m_phone", m_phone);
            return sessionTemplate.selectOne("member.findIdByPhone", params);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public int getInformationUpdate(MemberVO mvo) {
    	try {
			return sessionTemplate.update("member.getInformationUpdate", mvo);
		} catch (Exception e) {
			e.printStackTrace();
            return 0;
		}
    }
    
}