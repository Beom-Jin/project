package com.ict.project.controller;

import java.util.List;

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
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;


@Controller
public class MainController
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
		return new ModelAndView("project/eventForm");
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
		
		List<TboardVO> list = MapperUtil.convertToTboardList(apiList);

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

	@GetMapping("/showList")
	public ModelAndView eventList()
	{
		return new ModelAndView("project/eventForm");
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
