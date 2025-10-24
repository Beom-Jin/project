package com.ict.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController
{
	
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
	
<<<<<<< HEAD
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
	
	
	
=======
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
>>>>>>> 1b6b8653903709dc1c8ccaf1d2a2a5270f951665
}
