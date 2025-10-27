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
	
	@GetMapping("/writeComments")
	public ModelAndView goWriteComments()
	{
		return new ModelAndView("project/writeComments");
		
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

	@GetMapping("/LoginForm")
	public String showLoginForm() {
		return "project/loginForm";
	}
	

	@GetMapping("/RegistrationForm")
	public String showRegistrationForm() {
		return "project/registrationForm";
	}
	
	

	@GetMapping("/showthema")
	public ModelAndView gothema()
	{
		return new ModelAndView("project/thema");
	}
	

	@GetMapping("/gotitle")
	public ModelAndView gotitle()
	{
		return new ModelAndView("project/mainHomePage");
	}
	

	@GetMapping("/gothema")
	public ModelAndView gotothema()
	{
		return new ModelAndView("project/thema");
	}
	
	@GetMapping("/gofestival")
	public ModelAndView gofestival()
	{
		return new ModelAndView("project/festival");
	}
	
	
	@GetMapping("/findidorpassword")
	public ModelAndView findidorpassword()
	{
		return new ModelAndView("project/findidpassword");
	}
	
	

	@GetMapping("/membersJoinForm")
	public ModelAndView domembersJoinForm()
	{
		return new ModelAndView("project/registrationForm");
	}
	
	@GetMapping("/thema1")
	public ModelAndView goThemadetail()
	{
		return new ModelAndView("project/thema1");
	}
	
	@GetMapping("/thema2")
	public ModelAndView goThemadetail1()
	{
		return new ModelAndView("project/thema2");
	}
	
	
	@GetMapping("/thema3")
	public ModelAndView goThemadetail2()
	{
		return new ModelAndView("project/thema3");
	}
	
	@GetMapping("/thema4")
	public ModelAndView goThemadetail3()
	{
		return new ModelAndView("project/thema4");
	}
	
	@GetMapping("/thema5")
	public ModelAndView goThemadetail4()
	{
		return new ModelAndView("project/thema5");
	}
	
	@GetMapping("/thema6")
	public ModelAndView goThemadetail5()
	{
		return new ModelAndView("project/thema6");
	}
	
	@GetMapping("/thema7")
	public ModelAndView goThemadetail6()
	{
		return new ModelAndView("project/thema7");
	}
	

	@GetMapping("/showSupport")
	public ModelAndView goSupport()
	{
		return new ModelAndView("project/support");
	}
	@GetMapping("/showNotice")
	public ModelAndView goNotice()
	{
		return new ModelAndView("project/notice");
	}
	@GetMapping("/showFAQ")
	public ModelAndView goFAQ() 
	{
		return new ModelAndView("project/faq");
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
	public ModelAndView goBookmark()
	{
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
	
	@GetMapping("/supCategory")
	public ModelAndView goCategory() {
		return new ModelAndView("project/supCategory");
	}
	
	@GetMapping("/supTravel")
	public ModelAndView goTravel() {
		return new ModelAndView("project/supTravel");
	}
	
	@GetMapping("/supCustomer")
	public ModelAndView goCustomer() {
		return new ModelAndView("project/supCustomer");
	}
	
	@GetMapping("/supMember")
	public ModelAndView goMember() {
		return new ModelAndView("project/supMember");
	}
	
	@GetMapping("/supThema")
	public ModelAndView goThema() {
		return new ModelAndView("project/supThema");
	}
	
	
	
	
	
	@GetMapping("/mainHomePage")
	public ModelAndView goHomePage() {
		return new ModelAndView("project/mainHomePage");
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
	public ModelAndView eventList()	{
		
		System.out.println("Controller showList");
		return new ModelAndView("project/eventForm");
	}	
	

}
