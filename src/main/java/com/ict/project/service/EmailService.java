package com.ict.project.service;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private static final SecureRandom RANDOM = new SecureRandom();
    
    // 숫자 6자리 인증 코드 생성
    public String createCode() {
        return String.valueOf(100000 + RANDOM.nextInt(900000));
    }
    
    private Session createSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", EmailUtil.get("mail.smtp.host"));
        props.put("mail.smtp.port", EmailUtil.get("mail.smtp.port"));
        props.put("mail.smtp.auth", EmailUtil.get("mail.smtp.auth"));
        props.put("mail.smtp.starttls.enable", EmailUtil.get("mail.smtp.starttls.enable"));
        
        // ✅ Gmail용 SSL 설정 추가
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.connectiontimeout", "10000");
        props.put("mail.smtp.timeout", "10000");
        props.put("mail.smtp.writetimeout", "10000");
        
        return Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                    EmailUtil.get("mail.smtp.username"),
                    EmailUtil.get("mail.smtp.password")
                );
            }
        });
    }
    
    public void sendHtmlMail(String toEmail, String subject, String htmlContent) throws MessagingException {
        Session session = createSession();
        MimeMessage message = new MimeMessage(session);
        
        try {
            message.setFrom(new InternetAddress(
                EmailUtil.get("mail.smtp.username"),
                EmailUtil.get("mail.sender.name"),
                StandardCharsets.UTF_8.name()
            ));
        } catch (java.io.UnsupportedEncodingException e) {
            message.setFrom(new InternetAddress(EmailUtil.get("mail.smtp.username")));
        }
        
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject(subject, StandardCharsets.UTF_8.name());
        message.setSentDate(new Date());
        message.setContent(htmlContent, "text/html; charset=UTF-8");
        
        Transport.send(message);
    }
    
    public String sendAuthMail(String toEmail) throws MessagingException {
        String code = createCode();
        String html = new StringBuilder()
            .append("<h3>VisitKorea 아이디 찾기</h3>")
            .append("<p><b>5분 이내</b>에 아래 코드를 입력하세요.</p>")
            .append("<div style='font-size:20px; font-weight:bold; ")
            .append("padding:8px 12px; border:1px solid #ddd; display:inline-block;'>")
            .append(code)
            .append("</div>")
            .toString();
        
        sendHtmlMail(toEmail, "[VisitKorea] 아이디 찾기 인증번호", html);
        return code;
    }
}
