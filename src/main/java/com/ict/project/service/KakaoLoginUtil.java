package com.ict.project.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import com.google.gson.Gson;
import com.ict.project.vo.KakaoUserVO;

public class KakaoLoginUtil {
    
    private static final String CLIENT_ID = "c2ffaab66fa1da745f7177871cb07570";
    private static final String REDIRECT_URI = "http://localhost:8090/kakaologin";
    private static final String CLIENT_SECRET = "Isvklf42t9tTTApGknb7ePxfAilzkIPg";

    // Access Token 받기
    public static String getAccessToken(String code) {
        try {
            String reqURL = "https://kauth.kakao.com/oauth/token";
            
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            
            String param = "grant_type=authorization_code"
                    + "&client_id=" + CLIENT_ID
                    + "&redirect_uri=" + REDIRECT_URI
                    + "&code=" + code
                    + "&client_secret=" + CLIENT_SECRET;
            
            try(OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())){
                writer.write(param);
                writer.flush();
            }
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuffer sb = new StringBuffer();
            String msg;
            while ((msg = br.readLine()) != null) {
                sb.append(msg);
            }
            
            Gson gson = new Gson();
            AccessTokenResponse tokenResponse = gson.fromJson(sb.toString(), AccessTokenResponse.class);
            
            return tokenResponse.getAccess_token();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // 사용자 정보 받기
    public static KakaoUserVO getUserInfo(String accessToken){
        try {
            String reqURL = "https://kapi.kakao.com/v2/user/me";
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuffer sb = new StringBuffer();
            String msg;
            while((msg=br.readLine()) != null) {
                sb.append(msg);
            }
            
            Gson gson = new Gson();
            KakaoUserVO kakaoUserVO = gson.fromJson(sb.toString(), KakaoUserVO.class);
            
            return kakaoUserVO;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    private static class AccessTokenResponse{
        private String access_token;

        public String getAccess_token() {
            return access_token;
        }

        public void setAccess_token(String access_token) {
            this.access_token = access_token;
        }
    }
}