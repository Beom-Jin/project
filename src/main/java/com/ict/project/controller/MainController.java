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
}
