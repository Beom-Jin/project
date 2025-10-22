package com.ict.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController
{
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
}
