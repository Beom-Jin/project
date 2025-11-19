package com.ict.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxPublicDataController {
	
	@RequestMapping(value = "/api/familyTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getFamilyTourSpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		final String FAMILY_TOUR_SERVICE_KEY = "62f10a79-8a2f-439d-9977-9865b02e7d4e";
		
		try {
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
	
	@RequestMapping(value = "/api/petTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPetFriendlySpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		final String PET_FRIENDLY_SERVICE_KEY = "3ce8f9ba-c91e-4810-9800-8474a671a045";
		
		try {
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
	
	private String getDummyFamilyData() {
		return "{"
			+ "\"response\": {"
			+ "  \"body\": {"
			+ "    \"items\": {"
			+ "      \"item\": ["
			+ "        {"
			+ "          \"title\": \"에버랜드\","
			+ "          \"addr1\": \"경기도 용인시 처인구 포곡읍\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"031-320-5000\","
			+ "          \"opentime\": \"10:00 - 22:00\","
			+ "          \"overview\": \"국내 최대 규모의 테마파크로 사계절 내내 다양한 축제와 공연이 펼쳐집니다. 가족 모두가 즐길 수 있는 40여 가지의 어트랙션과 동물원, 아름다운 정원이 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"롯데월드\","
			+ "          \"addr1\": \"서울특별시 송파구 올림픽로 240\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-411-2000\","
			+ "          \"opentime\": \"09:30 - 22:00\","
			+ "          \"overview\": \"실내외 테마파크와 쇼핑몰, 민속박물관이 함께 있는 복합 엔터테인먼트 공간입니다. 날씨에 관계없이 즐길 수 있는 실내 시설이 특징입니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"서울대공원\","
			+ "          \"addr1\": \"경기도 과천시 대공원광장로 102\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1519681393784-d120267933ba?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-500-7338\","
			+ "          \"opentime\": \"09:00 - 18:00\","
			+ "          \"overview\": \"동물원, 식물원, 테마가든이 있는 자연친화적 공원입니다. 리프트를 타고 이동하며 넓은 부지의 동물원을 관람할 수 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"아쿠아플라넷 일산\","
			+ "          \"addr1\": \"경기도 고양시 일산서구 한류월드로 282\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"031-960-8500\","
			+ "          \"opentime\": \"10:00 - 19:00\","
			+ "          \"overview\": \"280여 종의 다양한 해양생물을 관람할 수 있는 대형 수족관입니다. 아이들의 해양생물 체험학습에 최적화된 공간입니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"키즈카페 점프\","
			+ "          \"addr1\": \"서울특별시 강남구 테헤란로 152\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-554-0001\","
			+ "          \"opentime\": \"10:00 - 20:00\","
			+ "          \"overview\": \"트램펄린과 다양한 놀이기구가 있는 대형 키즈카페입니다. 아이들이 안전하게 뛰어놀 수 있는 공간으로 부모들의 휴식 공간도 마련되어 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"어린이대공원\","
			+ "          \"addr1\": \"서울특별시 광진구 능동로 216\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-450-9311\","
			+ "          \"opentime\": \"05:00 - 22:00\","
			+ "          \"overview\": \"놀이동산, 동물원, 식물원이 한곳에 모여있는 어린이 전용 공원입니다. 무료 입장이 가능하며 다양한 체험 프로그램이 운영됩니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"코엑스 아쿠아리움\","
			+ "          \"addr1\": \"서울특별시 강남구 영동대로 513\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-6002-6200\","
			+ "          \"opentime\": \"10:00 - 20:00\","
			+ "          \"overview\": \"도심 속 대형 수족관으로 650여 종 4만여 마리의 해양생물을 만날 수 있습니다. 터치풀 체험과 먹이주기 체험이 인기입니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"남이섬\","
			+ "          \"addr1\": \"강원도 춘천시 남산면 남이섬길 1\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"031-580-8114\","
			+ "          \"opentime\": \"07:30 - 21:40\","
			+ "          \"overview\": \"메타세쿼이아 길과 아름다운 자연경관이 있는 관광명소입니다. 가족과 함께 자전거를 타거나 산책하며 여유로운 시간을 보낼 수 있습니다.\""
			+ "        }"
			+ "      ]"
			+ "    }"
			+ "  }"
			+ "}"
			+ "}";
	}
	
	private String getDummyPetData() {
		return "{"
			+ "\"response\": {"
			+ "  \"body\": {"
			+ "    \"items\": {"
			+ "      \"item\": ["
			+ "        {"
			+ "          \"title\": \"애견동반 카페\","
			+ "          \"addr1\": \"서울특별시 강남구 청담동 123\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1450778869180-41d0601e046e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-541-1234\","
			+ "          \"opentime\": \"11:00 - 22:00\","
			+ "          \"overview\": \"반려동물과 함께 편안하게 휴식을 취할 수 있는 애견동반 카페입니다. 넓은 실내 공간과 야외 테라스가 마련되어 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"반려동물 공원\","
			+ "          \"addr1\": \"경기도 용인시 처인구 포곡읍\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1415369629372-26f2fe60c467?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"031-324-5678\","
			+ "          \"opentime\": \"06:00 - 20:00\","
			+ "          \"overview\": \"반려동물 전용 놀이터와 산책로가 있는 공원입니다. 소형견과 대형견 구역이 분리되어 있어 안전합니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"펫 카페\","
			+ "          \"addr1\": \"서울특별시 마포구 홍익로 45\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"02-333-4567\","
			+ "          \"opentime\": \"12:00 - 23:00\","
			+ "          \"overview\": \"반려동물을 위한 메뉴와 공간이 따로 마련된 카페입니다. 반려동물 미용 서비스도 제공합니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"애견 놀이터\","
			+ "          \"addr1\": \"경기도 성남시 분당구 정자동\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1444212477490-ca407925329e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"031-708-8901\","
			+ "          \"opentime\": \"10:00 - 19:00\","
			+ "          \"overview\": \"반려견을 위한 다양한 놀이시설과 훈련 공간이 있습니다. 전문 훈련사의 교육 프로그램도 운영됩니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"반려동물 해변\","
			+ "          \"addr1\": \"강원도 강릉시 주문진읍 해안로 1234\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"033-640-5555\","
			+ "          \"opentime\": \"00:00 - 24:00\","
			+ "          \"overview\": \"반려동물과 함께 바다를 즐길 수 있는 해변입니다. 여름철 개장 기간에는 반려동물 전용 수영장도 운영됩니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"펫 리조트\","
			+ "          \"addr1\": \"강원도 평창군 대관령면 횡계리\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1534361960057-19889db9621e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"033-335-6789\","
			+ "          \"opentime\": \"체크인 15:00 / 체크아웃 11:00\","
			+ "          \"overview\": \"반려동물과 함께 숙박할 수 있는 리조트입니다. 애견 전용 수영장과 산책로가 마련되어 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"애견동반 숙소\","
			+ "          \"addr1\": \"제주도 제주시 애월읍 고내리\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"064-799-1234\","
			+ "          \"opentime\": \"체크인 14:00 / 체크아웃 11:00\","
			+ "          \"overview\": \"제주도의 아름다운 자연 속에서 반려동물과 함께 휴식을 취할 수 있는 펜션입니다. 개별 마당이 있어 자유롭게 놀 수 있습니다.\""
			+ "        },"
			+ "        {"
			+ "          \"title\": \"반려동물 카페\","
			+ "          \"addr1\": \"부산광역시 해운대구 중동 1234\","
			+ "          \"firstimage\": \"https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=400&h=300&fit=crop\","
			+ "          \"tel\": \"051-742-5678\","
			+ "          \"opentime\": \"10:00 - 21:00\","
			+ "          \"overview\": \"바다가 보이는 루프탑이 있는 애견 카페입니다. 반려동물을 위한 간식과 장난감을 판매합니다.\""
			+ "        }"
			+ "      ]"
			+ "    }"
			+ "  }"
			+ "}"
			+ "}";
	}
}