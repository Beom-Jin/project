package com.ict.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxPublicDataController {
	
	// ✅ thema1: 가족 여행 (기존 API Key 사용)
	@RequestMapping(value = "/api/familyTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getFamilyTourSpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		// 기존에 사용하던 API Key
		final String FAMILY_TOUR_SERVICE_KEY = "62f10a79-8a2f-439d-9977-9865b02e7d4e";
		
		try {
			// API_CNV_061은 한국콘텐츠진흥원 공통 관광정보 API를 가정합니다.
			StringBuffer urlBuilder = new StringBuffer("https://api.kcisa.kr/openapi/API_CNV_061/request");
			urlBuilder.append("?").append("serviceKey=").append(FAMILY_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("8");
			urlBuilder.append("&").append("pageNo=").append("1");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			
			int responseCode = conn.getResponseCode();
			System.out.println("가족여행 API 응답 코드: " + responseCode);
			
			if(responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
			}
			
			StringBuffer sb = new StringBuffer();
			String msg;
			while((msg = rd.readLine()) != null) {
				sb.append(msg).append("\n");
			}
			
			String result = sb.toString();
			System.out.println("가족여행 API 응답 데이터: " + result);
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가족여행 API 호출 실패, 더미 데이터 반환");
			return getDummyFamilyData();
		} finally {
			try {
				if(rd != null) rd.close();
				if(conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	// ✅ thema2: 반려동물 동반 여행지 (수정된 부분)
	@RequestMapping(value = "/api/petTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPetFriendlySpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		// 새로운 반려동물 API Key
		final String PET_FRIENDLY_SERVICE_KEY = "3ce8f9ba-c91e-4810-9800-8474a671a045";
		
		try {
			// ✅ 반려동물 전용 API 주소로 변경
			StringBuffer urlBuilder = new StringBuffer("https://api.kcisa.kr/openapi/API_TOU_050/request");
			urlBuilder.append("?").append("serviceKey=").append(PET_FRIENDLY_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("8");
			urlBuilder.append("&").append("pageNo=").append("1");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			
			int responseCode = conn.getResponseCode();
			System.out.println("반려동물 API 응답 코드: " + responseCode);
			
			if(responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
			}
			
			StringBuffer sb = new StringBuffer();
			String msg;
			while((msg = rd.readLine()) != null) {
				sb.append(msg).append("\n");
			}
			
			String result = sb.toString();
			System.out.println("반려동물 API 응답 데이터: " + result);
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("반려동물 API 호출 실패, 더미 데이터 반환");
			return getDummyPetData();
		} finally {
			try {
				if(rd != null) rd.close();
				if(conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	// ==================== 더미 데이터 ====================
	
	private String getDummyFamilyData() {
		return "{"
			+ "\"response\": {"
			+ "  \"body\": {"
			+ "    \"items\": {"
			+ "      \"item\": ["
			+ "        {\"title\": \"에버랜드\", \"addr1\": \"경기도 용인시 처인구 포곡읍\", \"firstimage\": \"https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"롯데월드\", \"addr1\": \"서울특별시 송파구 올림픽로\", \"firstimage\": \"https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"서울대공원\", \"addr1\": \"경기도 과천시 대공원광장로\", \"firstimage\": \"https://images.unsplash.com/photo-1519681393784-d120267933ba?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"아쿠아플라넷\", \"addr1\": \"경기도 고양시 일산서구\", \"firstimage\": \"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"키즈카페\", \"addr1\": \"서울특별시 강남구 테헤란로\", \"firstimage\": \"https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"어린이대공원\", \"addr1\": \"서울특별시 광진구 능동로\", \"firstimage\": \"https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"아쿠아리움\", \"addr1\": \"서울특별시 강남구 영동대로\", \"firstimage\": \"https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"남이섬\", \"addr1\": \"강원도 춘천시 남산면\", \"firstimage\": \"https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=400&h=300&fit=crop\"}"
			+ "      ]"
			+ "    }"
			+ "  }"
			+ "}"
			+ "}";
	}
	
	private String getDummyPetData() {
		return "{"
			+ "\"response\": {"
			+ "  \"body\": {"
			+ "    \"items\": {"
			+ "      \"item\": ["
			+ "        {\"title\": \"애견동반 카페\", \"addr1\": \"서울특별시 강남구 청담동\", \"firstimage\": \"https://images.unsplash.com/photo-1450778869180-41d0601e046e?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"반려동물 공원\", \"addr1\": \"경기도 용인시 처인구\", \"firstimage\": \"https://images.unsplash.com/photo-1415369629372-26f2fe60c467?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"펫 카페\", \"addr1\": \"서울특별시 마포구 홍대입구\", \"firstimage\": \"https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"애견 놀이터\", \"addr1\": \"경기도 성남시 분당구\", \"firstimage\": \"https://images.unsplash.com/photo-1444212477490-ca407925329e?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"반려동물 해변\", \"addr1\": \"강원도 강릉시 주문진읍\", \"firstimage\": \"https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"펫 리조트\", \"addr1\": \"강원도 평창군 대관령면\", \"firstimage\": \"https://images.unsplash.com/photo-1534361960057-19889db9621e?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"애견동반 숙소\", \"addr1\": \"제주도 제주시 애월읍\", \"firstimage\": \"https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"반려동물 카페\", \"addr1\": \"부산광역시 해운대구 중동\", \"firstimage\": \"https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=400&h=300&fit=crop\"}"
			+ "      ]"
			+ "    }"
			+ "  }"
			+ "}"
			+ "}";
	}
	
	private String getDummyCampingData() {
		return "{"
			+ "\"response\": {"
			+ "  \"body\": {"
			+ "    \"items\": {"
			+ "      \"item\": ["
			+ "        {\"title\": \"오토캠핑장\", \"addr1\": \"강원도 평창군 대화면\", \"firstimage\": \"https://images.unsplash.com/photo-1478131143081-80f7f84ca84d?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"글램핑장\", \"addr1\": \"경기도 가평군 청평면\", \"firstimage\": \"https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"캠핑장\", \"addr1\": \"전라남도 담양군 용면\", \"firstimage\": \"https://images.unsplash.com/photo-1487730116645-74489c95b41b?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"야영장\", \"addr1\": \"경상북도 영주시 부석면\", \"firstimage\": \"https://images.unsplash.com/photo-1445308394109-4ec2920981b1?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"카라반\", \"addr1\": \"충청남도 태안군 안면읍\", \"firstimage\": \"https://images.unsplash.com/photo-1523987355523-c7b5b0dd90a7?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"캠핑리조트\", \"addr1\": \"강원도 홍천군 내면\", \"firstimage\": \"https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"백패킹\", \"addr1\": \"경기도 양평군 옥천면\", \"firstimage\": \"https://images.unsplash.com/photo-1478131143081-80f7f84ca84d?w=400&h=300&fit=crop\"},"
			+ "        {\"title\": \"오토캠핑\", \"addr1\": \"제주도 제주시 한경면\", \"firstimage\": \"https://images.unsplash.com/photo-1487730116645-74489c95b41b?w=400&h=300&fit=crop\"}"
			+ "      ]"
			+ "    }"
			+ "  }"
			+ "}"
			+ "}";
	}
}
