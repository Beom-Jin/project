package com.ict.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FestivalDataController {
    private static final String SERVICEKEY = "47525481-4eea-43c2-b595-9435c4fe437c";

    public String getFestivalData() {
        BufferedReader rd = null;
        HttpURLConnection conn = null;

        try {
            // ✅ 올바른 요청 URL 구성
            StringBuffer urlBuilder = new StringBuffer("https://api.kcisa.kr/openapi/service/rest/meta4/getKCPG0504");
            urlBuilder.append("?serviceKey=").append(SERVICEKEY);
            urlBuilder.append("&numOfRows=").append("10");
            // (추가 파라미터가 있다면 여기에 더 append 하면 됨)
            // ex) urlBuilder.append("&numOfRows=10&pageNo=1");

            // ✅ 연결 생성
            URL url = new URL(urlBuilder.toString());
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/xml; charset=UTF-8");

            // ✅ 응답코드 확인
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            // ✅ 입력스트림 연결
            if (responseCode >= 200 && responseCode <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            // ✅ 결과 읽기
            StringBuffer sb = new StringBuffer();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line).append("\n");
            }

            // ✅ 콘솔 출력
            System.out.println("=== XML Response ===");
            System.out.println(sb.toString());

            return sb.toString();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rd != null) rd.close();
                if (conn != null) conn.disconnect();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return null;
    }

    // 테스트용 main
    public static void main(String[] args) {
        FestivalDataController fdc = new FestivalDataController();
        fdc.getFestivalData();
    }
}