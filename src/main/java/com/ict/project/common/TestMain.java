package com.ict.project.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.PropertyMap;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;

public class TestMain {

	public static void main(String[] args) {

		MapperUtil.addMapping(new PropertyMap<MakeupAPIVO, TboardVO>() {			
			@Override
			protected void configure() {
				map().setB_title(source.getBrand());
				map().setB_content(source.getName());
				map().setB_img(source.getImage_link());
				map().setB_url(source.getWebsite_link());
				map().setB_theme(source.getCategory());
				map().setB_lat(source.getCreated_at());
				map().setB_lon(source.getUpdated_at());
				map().setB_time(source.getUpdated_at());

				using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
						.map(source.getRating(), destination.getB_like());

				using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
						.map(source.getRating(), destination.getB_hits());
			}
		});

		RestApiComm r = new RestApiComm();
		StringBuffer endPoint = new StringBuffer("https://api.kcisa.kr/openapi/API_CNV_061/request?serviceKey=62f10a79-8a2f-439d-9977-9865b02e7d4e&numOfRows=8&pageNo=1");

		String reslist = r.sendRecv(endPoint, "GET");
		System.out.println("reslist = " + reslist.substring(0, Math.min(200, reslist.length())));

		Gson gsonlist = new Gson();
		List<MakeupAPIVO> apiList = gsonlist.fromJson(reslist, new TypeToken<List<MakeupAPIVO>>() {
		}.getType());
		apiList = Optional.ofNullable(apiList).orElse(new ArrayList<>());

		if (apiList.isEmpty()) {
			System.out.println("조회된 데이터가 없습니다.");
		} else {
			// 3️⃣ 리스트 변환
			List<TboardVO> list = MapperUtil.mapList(apiList, TboardVO.class);

			// 4️⃣ 출력
			list.forEach(t -> System.out.println(t.getB_title() + " / " + t.getB_content() + " / " + t.getB_img()));
		}

		// 5️⃣ 단일 API 호출
		StringBuffer urlone = new StringBuffer("https://makeup-api.herokuapp.com/api/v1/products/495.json");
		String resone = r.sendRecv(urlone, "GET");
		System.out.println("resone = " + resone.substring(0, Math.min(200, resone.length())));

		// 6️⃣ JSON → 단일 VO 변환
		Gson gsonone = new Gson();
		MakeupAPIVO apiVO = gsonone.fromJson(resone, MakeupAPIVO.class);

		if (apiVO != null) {
			TboardVO vo = MapperUtil.map(apiVO, TboardVO.class);
			System.out.println(vo.getB_title() + " / " + vo.getB_content() + " / " + vo.getB_img());
		} else {
			System.out.println("단일 데이터 변환 실패");
		}
	}

}
