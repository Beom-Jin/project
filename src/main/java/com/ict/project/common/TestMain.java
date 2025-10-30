package com.ict.project.common;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;

public class TestMain {
	public static void main(String[] args) {

		RestApiComm r = new RestApiComm();
		//StringBuffer endPoint = new StringBuffer("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
		StringBuffer endPoint = new StringBuffer("https://api.kcisa.kr/openapi/API_CNV_061/request?serviceKey=62f10a79-8a2f-439d-9977-9865b02e7d4e&numOfRows=8&pageNo=1");
		String reslist = r.sendRecv(endPoint, "GET");
		
		System.out.println("reslist = " + reslist.substring(0, 200));

		Gson gsonlist = new Gson();
		// Gson으로 먼저 API 데이터 파싱
		List<MakeupAPIVO> apiList = gsonlist.fromJson(reslist.toString(), new TypeToken<List<MakeupAPIVO>>(){}.getType());

		// ModelMapper를 이용해 변환
		List<TboardVO> tboardList = MapperUtil.convertToTboardList(apiList);
		
		// 확인
		for (TboardVO t : tboardList) {
		    System.out.println(t.getB_title() + " / " + t.getB_content() + " / " + t.getB_img());
		}		
		
		// ModelMapper를 이용해 변환
		StringBuffer urlone = new StringBuffer("https://makeup-api.herokuapp.com/api/v1/products/495.json");
		String resone = r.sendRecv(urlone, "GET");
		System.out.println("resone = " + resone.substring(0, 200));
		
		Gson gsonone = new Gson();
		
		
		System.out.println("-------------------------------");
		MakeupAPIVO apiVO = gsonone.fromJson(resone, MakeupAPIVO.class);
		TboardVO vo =  MapperUtil.convertToTboard(apiVO);
		System.out.println(vo.getB_title() + " / " + vo.getB_content() + " / " + vo.getB_img());

	}
}
