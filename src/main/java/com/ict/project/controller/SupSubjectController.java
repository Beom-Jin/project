package com.ict.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/supSubject")
public class SupSubjectController {
	
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

    // ---------------- 상단 메뉴 ----------------
    @GetMapping("/supThema")
    public ModelAndView goThema() {
        return new ModelAndView("project/supThema"); 
    }

    @GetMapping("/supTravel")
    public ModelAndView goTravel() {
        return new ModelAndView("project/supTravel"); 
    }

    @GetMapping("/supCategory")
    public ModelAndView goCategory() {
        return new ModelAndView("project/supCategory"); 
    }

    @GetMapping("/supCustomer")
    public ModelAndView goCustomer() {
        return new ModelAndView("project/supCustomer"); 
    }

    @GetMapping("/supMember")
    public ModelAndView goMember() {
        return new ModelAndView("project/supMember"); 
    }


    // ---------------- 서브 메뉴 ----------------
    @GetMapping("/supForeign")
    public ModelAndView goForeign() {
        return new ModelAndView("project/supSubject/supForeign");
    }

    @GetMapping("/supMedical")
    public ModelAndView goMedical() {
        return new ModelAndView("project/supSubject/supMedical");
    }

    @GetMapping("/supPicLoc")
    public ModelAndView goPicLoc() {
        return new ModelAndView("project/supSubject/supPicLoc");
    }

    @GetMapping("/supAccom")
    public ModelAndView goAccom() {
        return new ModelAndView("project/supSubject/supAccom");
    }

    @GetMapping("/supPet")
    public ModelAndView goPet() {
        return new ModelAndView("project/supSubject/supPet");
    }

    @GetMapping("/supEvent")
    public ModelAndView goEvent() {
        return new ModelAndView("project/supSubject/supEvent");
    }

    @GetMapping("/supCamping")
    public ModelAndView goCamping() {
        return new ModelAndView("project/supSubject/supCamping");
    }

    @GetMapping("/supLocation")
    public ModelAndView goLocation() {
        return new ModelAndView("project/supSubject/supLocation");
    }

    @GetMapping("/supUserList")
    public ModelAndView goUserList() {
        return new ModelAndView("project/supSubject/supUserList");
    }

    @GetMapping("/supUserAuto")
    public ModelAndView goUserAuto() {
        return new ModelAndView("project/supSubject/supUserAuto");
    }

    @GetMapping("/supQNA")
    public ModelAndView goQNA() {
        return new ModelAndView("project/supSubject/supQNA");
    }

    @GetMapping("/supFestival")
    public ModelAndView goFestival() {
        return new ModelAndView("project/supSubject/supFestival");
    }

    @GetMapping("/supNotice")
    public ModelAndView goNotice() {
        return new ModelAndView("project/supSubject/supNotice");
    }

    @GetMapping("/mainHomePage")
	public ModelAndView goHomePage() {
		return new ModelAndView("project/mainHomePage");
	}
}
