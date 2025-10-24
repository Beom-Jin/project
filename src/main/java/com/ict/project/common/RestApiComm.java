package com.ict.project.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

import com.google.gson.Gson;

public class RestApiComm {
	
    private final Gson gson = new Gson();

    /**
     * 1️⃣ 기본 GET/DELETE 요청 (응답을 String으로 반환)
     */
    public String sendRecv(StringBuffer endPoint, String method) {
        return sendHttpRequest(endPoint, method, null);
    }

    /**
     * 2️⃣ POST/PUT 등 Body(JSON) 포함 요청 (응답을 String으로 반환)
     */
    public String sendRecvBody(StringBuffer endPoint, String method, String bodyJson) {
        return sendHttpRequest(endPoint, method, bodyJson);
    }

    /**
     * 3️⃣ 응답을 특정 객체(Class<T>)로 변환
     */
    public <T> T sendRecvObj(StringBuffer endPoint, String method, Class<T> clazz) {
        String res = sendHttpRequest(endPoint, method, null);
        return gson.fromJson(res, clazz);
    }

    /**
     * 4️⃣ 응답을 List<T> 형태로 변환 (TypeToken 사용)
     */
    public <T> List<T> sendRecvList(StringBuffer endPoint, String method, Type typeOfT) {
        String res = sendHttpRequest(endPoint, method, null);
        return gson.fromJson(res, typeOfT);
    }

    /**
     * 내부 공통 HTTP 요청 처리
     */
    private String sendHttpRequest(StringBuffer endPoint, String method, String bodyJson) {
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        StringBuilder response = new StringBuilder();

        try {
            URL url = new URL(endPoint.toString());
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod(method);
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setDoInput(true);

            // POST / PUT 등 Body가 필요한 경우
            if (bodyJson != null && (method.equalsIgnoreCase("POST") || method.equalsIgnoreCase("PUT"))) {
                conn.setDoOutput(true);
                try (OutputStream os = conn.getOutputStream()) {
                    os.write(bodyJson.getBytes(StandardCharsets.UTF_8));
                    os.flush();
                }
            }

            int responseCode = conn.getResponseCode();
            reader = new BufferedReader(new InputStreamReader(
                    (responseCode >= 200 && responseCode < 300)
                            ? conn.getInputStream()
                            : conn.getErrorStream(),
                    StandardCharsets.UTF_8));

            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\":\"" + e.getMessage() + "\"}";
        } finally {
            try {
                if (reader != null) reader.close();
                if (conn != null) conn.disconnect();
            } catch (Exception ignored) {}
        }
        return response.toString();
    }
}
