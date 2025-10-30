package com.ict.project.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import com.google.gson.Gson;
import com.ict.project.vo.NaverUserVO;

public class NaverLoginUtil {
    private static final String CLIENT_ID = "n4mbOLpaA5uQlZ15nhlp";
    private static final String GRANT_TYPE = "authorization_code";
    private static final String CLIENT_SECRET = "c5P9YveynM";
    
    // Access Token 받기
    public static String getAccessToken(String code, String state) {
        try {
            String reqURL = "https://nid.naver.com/oauth2.0/token";

            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            String param = "grant_type=authorization_code" 
                    + "&client_id=" + CLIENT_ID 
                    + "&code=" + code
                    + "&client_secret=" + CLIENT_SECRET 
                    + "&state=" + state;

            try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())) {
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
    public static NaverUserVO getUserInfo(String accessToken) {
        try {
            String reqURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuffer sb = new StringBuffer();
            String msg;
            while((msg=br.readLine()) != null) {
                sb.append(msg);
            }
            
            Gson gson = new Gson();
            NaverUserVO naverUserVO = gson.fromJson(sb.toString(), NaverUserVO.class);
            
            return naverUserVO;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static class AccessTokenResponse {
        private String access_token;

        public String getAccess_token() {
            return access_token;
        }

        public void setAccess_token(String access_token) {
            this.access_token = access_token;
        }
    }
}