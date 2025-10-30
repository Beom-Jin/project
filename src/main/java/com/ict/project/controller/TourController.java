package com.ict.project.controller;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ict.project.common.MapperUtil;
import com.ict.project.common.RestApiComm;
import com.ict.project.service.TourService;
import com.ict.project.vo.ItemVO;
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.ResponseVO;
import com.ict.project.vo.TboardVO;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;


@Controller
public class TourController
{
	@Autowired 
	private TourService tourService;
	
	@GetMapping("/showMain")
	public ModelAndView goMain()
	{
		return new ModelAndView("project/mainHomePage");
		
	}
	
	@GetMapping("/showMap")
	public ModelAndView goMap()
	{
		return new ModelAndView("project/map");
	}
	
	
	@GetMapping("/showDetail")
	public ModelAndView goDetail(@ModelAttribute("area") String area)
	{
		return new ModelAndView("project/detail");
	}
	
	
	@GetMapping("/showTheme")
	public ModelAndView goTheme()
	{
		return new ModelAndView("project/theme");
	}
	
	@GetMapping("/showSupport")
	public ModelAndView goSupport()
	{
		return new ModelAndView("project/support");
	}
	
	@GetMapping("/showMyPage")
	public ModelAndView goMyPage()
	{
		return new ModelAndView("project/myPage/MyPage");
	}
	
	@GetMapping("/showInformationUpdateForm")
	public ModelAndView goInformationUpdateForm() {
		return new ModelAndView("project/myPage/InformationUpdateForm");
	}
	@GetMapping("/showBookmark")
	public ModelAndView goBookmark() {
		return new ModelAndView("project/myPage/Bookmark");
	}
	@GetMapping("/showTravelReview")
	public ModelAndView goTravelReview() {
		return new ModelAndView("project/myPage/TravelReview");
	}
	@GetMapping("/showQuestion")
	public ModelAndView goQuestion() {
		return new ModelAndView("project/myPage/Question");
	}
	@GetMapping("/showTravelReviewDetail")
	public ModelAndView goTravelReviewDetail() {
		return new ModelAndView("project/myPage/TravelReviewDetail");
	}
	
	
	@GetMapping("/eventMap")
	public ModelAndView goEventMap()
	{
		return new ModelAndView("project/board/eventForm");
	}	
	
	@GetMapping("/createDB")
	public ModelAndView goCreateDB()
	{
		ModelAndView mv = new ModelAndView();
		
		// 서비스 이동여부 결정 필요 
		RestApiComm r = new RestApiComm();
		StringBuffer endPoint = new StringBuffer("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
		String reslist = r.sendRecv(endPoint, "GET");
		Gson gsonlist = new Gson();
		
		// Gson으로 먼저 API 데이터 파싱
		List<MakeupAPIVO> apiList = gsonlist.fromJson(reslist.toString(), new TypeToken<List<MakeupAPIVO>>(){}.getType());
		
		//List<TboardVO> list = MapperUtil.convertToTboardList(apiList);
		
		//TboardVO vo = MapperUtil.map(makeupApiVO, TboardVO.class);
		List<TboardVO> list = MapperUtil.mapList(apiList, TboardVO.class);
		// 확인
		for (TboardVO t : list) {
		    System.out.println(t.getB_title() + " / " + t.getB_content() + " / " + t.getB_img());
		}		
		
		return null;
		
		//int result = tourService.goCreateDB(list);
		
		//mv.addObject("list", list);		
		//mv.addObject("resilt", result);		
		//mv.setViewName("eventForm");	
		
		//return mv;
	}
	
	// 대한민국 추천 여행지 
	@GetMapping("/createDB1")
	public ModelAndView goCreateDB1()
	{
		ModelAndView mv = new ModelAndView();
		
        MapperUtil.addMapping(new PropertyMap<ItemVO, TboardVO>() {
            @Override
            protected void configure() {
                map().setB_title(source.getTitle());
                map().setB_content(source.getDescription());
                map().setB_img("");
                map().setB_url(source.getUrl());
                map().setB_theme(source.getCollectionDb());
                map().setB_time(source.getInsertDate());
                map().setB_lat("");
                map().setB_lon("");

                using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
                        .map(source.getViewCnt(), destination.getB_hits());

                using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
                        .map(source.getViewCnt(), destination.getB_like());
            }
        });
		
		// 서비스 이동여부 결정 필요 
		RestApiComm r = new RestApiComm();
		StringBuffer endPoint = new StringBuffer("https://api.kcisa.kr/openapi/API_CNV_061/request?serviceKey=62f10a79-8a2f-439d-9977-9865b02e7d4e&numOfRows=8&pageNo=1");
		String reslist = r.sendRecv(endPoint, "GET");
		System.out.println("reslist = " + reslist.substring(0, 200));
		
		String xml = reslist;  // XML 응답 문자열

		JAXBContext jaxbContext;
		ResponseVO response = null;
		try {
			jaxbContext = JAXBContext.newInstance(ResponseVO.class);
			Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
			response = (ResponseVO) unmarshaller.unmarshal(new StringReader(xml));
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<ItemVO> apiList = new ArrayList<>();  
		for (ItemVO item : response.getBody().getItems()) {
		    System.out.println(item.getTitle() + " / " + item.getInsertDate());
		    apiList.add(item);
		}		
		
		System.out.println("--------------------------------");
		
		for (ItemVO t : apiList) {
		    System.out.println(t.getTitle() + " / " + t.getInsertDate());
		}		
		
		List<TboardVO> list = MapperUtil.mapList(apiList, TboardVO.class);
		int result = tourService.goCreateDB(list);
		return null;
		
		//int result = tourService.goCreateDB(apiList);
		
		//mv.addObject("list", list);		
		//mv.addObject("resilt", result);		
		//mv.setViewName("eventForm");	
		
		//return mv;
	}
	

	@GetMapping("/showList")
	public ModelAndView eventList()
	{
		return new ModelAndView("project/board/eventForm");
	}	

	@GetMapping("/tourInsert")
	public ModelAndView tourInsert()
	{
		return new ModelAndView("project/board/insertForm");
	}	

	@GetMapping("/tourUpdate")
	public ModelAndView tourUpdate()
	{
		return new ModelAndView("project/board/updateForm");
	}	
	
	
	
}
