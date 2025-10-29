package com.ict.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.security.cert.X509Certificate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ThemeTourController {
	
	// 테마관광 API 서비스 키
	private static final String THEME_TOUR_SERVICE_KEY = "1548001a-6480-428c-9bed-42bf8c109ad6";
	private static final String BASE_URL = "https://apis.data.go.kr/B551011/KorService1";
	
	// ✅ SSL 인증서 검증 우회 설정
	static {
		disableSSLVerification();
	}
	
	private static void disableSSLVerification() {
		try {
			TrustManager[] trustAllCerts = new TrustManager[] {
				new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() { return null; }
					public void checkClientTrusted(X509Certificate[] certs, String authType) { }
					public void checkServerTrusted(X509Certificate[] certs, String authType) { }
				}
			};
			
			SSLContext sc = SSLContext.getInstance("SSL");
			sc.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			HttpsURLConnection.setDefaultHostnameVerifier((hostname, session) -> true);
			
			System.out.println("✅ SSL 인증서 검증 우회 설정 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ✅ 지역기반 관광정보 조회
	 */
	@RequestMapping(value = "/api/themeTour/areaList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAreaBasedList() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder(BASE_URL + "/areaBasedList1");
			urlBuilder.append("?").append("serviceKey=").append(THEME_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("10");
			urlBuilder.append("&").append("pageNo=").append("1");
			urlBuilder.append("&").append("MobileOS=").append("ETC");
			urlBuilder.append("&").append("MobileApp=").append("AppTest");
			urlBuilder.append("&").append("_type=").append("json");
			urlBuilder.append("&").append("listYN=").append("Y");
			urlBuilder.append("&").append("arrange=").append("A");
			
			System.out.println("🌐 요청 URL: " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			int responseCode = conn.getResponseCode();
			System.out.println("📡 지역기반 관광정보 API 응답 코드: " + responseCode);
			
			if (responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			String result = sb.toString();
			
			if (responseCode != 200) {
				System.out.println("❌ 에러 응답: " + result);
				return getDummyAreaData();
			}
			
			System.out.println("✅ API 호출 성공!");
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("❌ API 호출 실패, 더미 데이터 반환");
			return getDummyAreaData();
		} finally {
			try {
				if (rd != null) rd.close();
				if (conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**
	 * ✅ 관광지만 조회 (contentTypeId=12)
	 */
	@RequestMapping(value = "/api/themeTour/touristSpots", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getTouristSpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder(BASE_URL + "/areaBasedList1");
			urlBuilder.append("?").append("serviceKey=").append(THEME_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("10");
			urlBuilder.append("&").append("pageNo=").append("1");
			urlBuilder.append("&").append("MobileOS=").append("ETC");
			urlBuilder.append("&").append("MobileApp=").append("AppTest");
			urlBuilder.append("&").append("_type=").append("json");
			urlBuilder.append("&").append("contentTypeId=").append("12");
			urlBuilder.append("&").append("listYN=").append("Y");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			int responseCode = conn.getResponseCode();
			System.out.println("📡 관광지 정보 API 응답 코드: " + responseCode);
			
			if (responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			String result = sb.toString();
			
			if (responseCode != 200) {
				System.out.println("❌ 에러 응답: " + result);
				return getDummyTouristData();
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return getDummyTouristData();
		} finally {
			try {
				if (rd != null) rd.close();
				if (conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**
	 * ✅ 축제/행사 정보 조회
	 */
	@RequestMapping(value = "/api/themeTour/festivals", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getFestivals() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder(BASE_URL + "/searchFestival1");
			urlBuilder.append("?").append("serviceKey=").append(THEME_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("10");
			urlBuilder.append("&").append("pageNo=").append("1");
			urlBuilder.append("&").append("MobileOS=").append("ETC");
			urlBuilder.append("&").append("MobileApp=").append("AppTest");
			urlBuilder.append("&").append("_type=").append("json");
			urlBuilder.append("&").append("listYN=").append("Y");
			urlBuilder.append("&").append("eventStartDate=").append("20251001");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			int responseCode = conn.getResponseCode();
			System.out.println("📡 축제 정보 API 응답 코드: " + responseCode);
			
			if (responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			String result = sb.toString();
			
			if (responseCode != 200) {
				System.out.println("❌ 에러 응답: " + result);
				return getDummyFestivalData();
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return getDummyFestivalData();
		} finally {
			try {
				if (rd != null) rd.close();
				if (conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**
	 * ✅ 서울 지역 관광지 조회
	 */
	@RequestMapping(value = "/api/themeTour/seoul", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSeoulTourSpots() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder(BASE_URL + "/areaBasedList1");
			urlBuilder.append("?").append("serviceKey=").append(THEME_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("10");
			urlBuilder.append("&").append("pageNo=").append("1");
			urlBuilder.append("&").append("MobileOS=").append("ETC");
			urlBuilder.append("&").append("MobileApp=").append("AppTest");
			urlBuilder.append("&").append("_type=").append("json");
			urlBuilder.append("&").append("areaCode=").append("1");
			urlBuilder.append("&").append("contentTypeId=").append("12");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			int responseCode = conn.getResponseCode();
			System.out.println("📡 서울 관광지 API 응답 코드: " + responseCode);
			
			if (responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			String result = sb.toString();
			
			if (responseCode != 200) {
				System.out.println("❌ 에러 응답: " + result);
				return getDummySeoulData();
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return getDummySeoulData();
		} finally {
			try {
				if (rd != null) rd.close();
				if (conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**
	 * ✅ 음식점 정보 조회
	 */
	@RequestMapping(value = "/api/themeTour/restaurants", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getRestaurants() {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			StringBuilder urlBuilder = new StringBuilder(BASE_URL + "/areaBasedList1");
			urlBuilder.append("?").append("serviceKey=").append(THEME_TOUR_SERVICE_KEY);
			urlBuilder.append("&").append("numOfRows=").append("10");
			urlBuilder.append("&").append("pageNo=").append("1");
			urlBuilder.append("&").append("MobileOS=").append("ETC");
			urlBuilder.append("&").append("MobileApp=").append("AppTest");
			urlBuilder.append("&").append("_type=").append("json");
			urlBuilder.append("&").append("contentTypeId=").append("39");
			
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			
			int responseCode = conn.getResponseCode();
			System.out.println("📡 음식점 정보 API 응답 코드: " + responseCode);
			
			if (responseCode >= 200 && responseCode <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			String result = sb.toString();
			
			if (responseCode != 200) {
				System.out.println("❌ 에러 응답: " + result);
				return getDummyRestaurantData();
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return getDummyRestaurantData();
		} finally {
			try {
				if (rd != null) rd.close();
				if (conn != null) conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	// ==================== 더미 데이터 ====================
	
	private String getDummyAreaData() {
		return "{\"response\":{\"header\":{\"resultCode\":\"0000\",\"resultMsg\":\"OK\"},\"body\":{\"items\":{\"item\":["
			+ "{\"title\":\"경복궁\",\"addr1\":\"서울특별시 종로구 사직로 161\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"},"
			+ "{\"title\":\"남산타워\",\"addr1\":\"서울특별시 용산구 남산공원길 105\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"},"
			+ "{\"title\":\"한옥마을\",\"addr1\":\"서울특별시 종로구 계동길 37\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"}"
			+ "]},\"numOfRows\":10,\"pageNo\":1,\"totalCount\":100}}}";
	}
	
	private String getDummyTouristData() {
		return "{\"response\":{\"header\":{\"resultCode\":\"0000\",\"resultMsg\":\"OK\"},\"body\":{\"items\":{\"item\":["
			+ "{\"title\":\"제주 한라산\",\"addr1\":\"제주특별자치도 제주시 1100로 2070-61\",\"firstimage\":\"https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400\"},"
			+ "{\"title\":\"부산 해운대\",\"addr1\":\"부산광역시 해운대구 우동\",\"firstimage\":\"https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400\"},"
			+ "{\"title\":\"경주 불국사\",\"addr1\":\"경상북도 경주시 불국로 385\",\"firstimage\":\"https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400\"}"
			+ "]},\"numOfRows\":10,\"pageNo\":1,\"totalCount\":50}}}";
	}
	
	private String getDummyFestivalData() {
		return "{\"response\":{\"header\":{\"resultCode\":\"0000\",\"resultMsg\":\"OK\"},\"body\":{\"items\":{\"item\":["
			+ "{\"title\":\"서울 빛초롱축제\",\"addr1\":\"서울특별시 종로구 청계천로\",\"eventstartdate\":\"20251101\",\"eventenddate\":\"20251130\"},"
			+ "{\"title\":\"부산 불꽃축제\",\"addr1\":\"부산광역시 수영구 광안해변로\",\"eventstartdate\":\"20251015\",\"eventenddate\":\"20251015\"},"
			+ "{\"title\":\"전주 한지축제\",\"addr1\":\"전라북도 전주시 완산구 전주천동로\",\"eventstartdate\":\"20251010\",\"eventenddate\":\"20251013\"}"
			+ "]},\"numOfRows\":10,\"pageNo\":1,\"totalCount\":30}}}";
	}
	
	private String getDummySeoulData() {
		return "{\"response\":{\"header\":{\"resultCode\":\"0000\",\"resultMsg\":\"OK\"},\"body\":{\"items\":{\"item\":["
			+ "{\"title\":\"청계천\",\"addr1\":\"서울특별시 종로구 청계천로\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"},"
			+ "{\"title\":\"명동거리\",\"addr1\":\"서울특별시 중구 명동길\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"},"
			+ "{\"title\":\"홍대입구\",\"addr1\":\"서울특별시 마포구 양화로\",\"firstimage\":\"https://images.unsplash.com/photo-1583421338473-f9900b0c83cb?w=400\"}"
			+ "]},\"numOfRows\":10,\"pageNo\":1,\"totalCount\":80}}}";
	}
	
	private String getDummyRestaurantData() {
		return "{\"response\":{\"header\":{\"resultCode\":\"0000\",\"resultMsg\":\"OK\"},\"body\":{\"items\":{\"item\":["
			+ "{\"title\":\"광장시장 먹거리\",\"addr1\":\"서울특별시 종로구 창경궁로\",\"firstimage\":\"https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400\"},"
			+ "{\"title\":\"남대문 칼국수\",\"addr1\":\"서울특별시 중구 남대문시장길\",\"firstimage\":\"https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400\"},"
			+ "{\"title\":\"이태원 맛집거리\",\"addr1\":\"서울특별시 용산구 이태원로\",\"firstimage\":\"https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400\"}"
			+ "]},\"numOfRows\":10,\"pageNo\":1,\"totalCount\":120}}}";
	}
}