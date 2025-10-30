package com.ict.project.vo;

public class MemberVO {
    private int m_idx;
    private String m_name, m_email, m_id, m_pw, m_tel, m_gender, m_int;
    private String m_hobby1, m_hobby2, m_hobby3, m_hobby4, m_auth;
    private int m_age;
    
    // SNS 로그인용 추가 필드
    private String sns_provider;  // "kakao" 또는 "naver"
    private String sns_email_kakao;
    private String sns_email_naver;
    private String sns_id;  // SNS 고유 ID
    private String m_phone;  // 전화번호 (SNS 검증용)

    // 기존 getter/setter
    public int getM_idx() { return m_idx; }
    public void setM_idx(int m_idx) { this.m_idx = m_idx; }
    
    public String getM_name() { return m_name; }
    public void setM_name(String m_name) { this.m_name = m_name; }
    
    public String getM_email() { return m_email; }
    public void setM_email(String m_email) { this.m_email = m_email; }
    
    public String getM_id() { return m_id; }
    public void setM_id(String m_id) { this.m_id = m_id; }
    
    public String getM_pw() { return m_pw; }
    public void setM_pw(String m_pw) { this.m_pw = m_pw; }
    
    public String getM_tel() { return m_tel; }
    public void setM_tel(String m_tel) { this.m_tel = m_tel; }
    
    public String getM_gender() { return m_gender; }
    public void setM_gender(String m_gender) { this.m_gender = m_gender; }
    
    public int getM_age() { return m_age; }
    public void setM_age(int m_age) { this.m_age = m_age; }
    
    public String getM_int() { return m_int; }
    public void setM_int(String m_int) { this.m_int = m_int; }
    
    public String getM_hobby1() { return m_hobby1; }
    public void setM_hobby1(String m_hobby1) { this.m_hobby1 = m_hobby1; }
    
    public String getM_hobby2() { return m_hobby2; }
    public void setM_hobby2(String m_hobby2) { this.m_hobby2 = m_hobby2; }
    
    public String getM_hobby3() { return m_hobby3; }
    public void setM_hobby3(String m_hobby3) { this.m_hobby3 = m_hobby3; }
    
    public String getM_hobby4() { return m_hobby4; }
    public void setM_hobby4(String m_hobby4) { this.m_hobby4 = m_hobby4; }
    
    public String getM_auth() { return m_auth; }
    public void setM_auth(String m_auth) { this.m_auth = m_auth; }

    // SNS 로그인용 getter/setter
    public String getSns_provider() { return sns_provider; }
    public void setSns_provider(String sns_provider) { this.sns_provider = sns_provider; }
    
    public String getSns_email_kakao() { return sns_email_kakao; }
    public void setSns_email_kakao(String sns_email_kakao) { this.sns_email_kakao = sns_email_kakao; }
    
    public String getSns_email_naver() { return sns_email_naver; }
    public void setSns_email_naver(String sns_email_naver) { this.sns_email_naver = sns_email_naver; }
    
    public String getSns_id() { return sns_id; }
    public void setSns_id(String sns_id) { this.sns_id = sns_id; }
    
    public String getM_phone() { return m_phone; }
    public void setM_phone(String m_phone) { this.m_phone = m_phone; }
}