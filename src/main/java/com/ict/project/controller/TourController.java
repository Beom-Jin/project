package com.ict.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
<<<<<<< HEAD
import org.springframework.web.servlet.ModelAndView;
=======
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ict.project.common.MapperUtil;
import com.ict.project.common.RestApiComm;
<<<<<<< HEAD
import com.ict.project.service.TourService;
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;
=======
import com.ict.project.service.CommentService;
import com.ict.project.service.DetailService;
import com.ict.project.service.TourService;
import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;
import com.ict.project.vo.TcommnetVO;
import com.ict.project.vo.TdetailVO;
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff


@Controller
public class TourController
{
<<<<<<< HEAD
	@Autowired 
	private TourService tourService;
=======
//	@Autowired 
//	private TourService tourService;
	
	@Autowired
	private DetailService detailService;
	
	@Autowired
	private CommentService commentService;
	
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
	
	@GetMapping("/showMain")
	public ModelAndView goMain()
	{
		return new ModelAndView("project/mainHomePage");
<<<<<<< HEAD
		
	}
	
	@GetMapping("/writeComments")
	public ModelAndView goWriteComments()
=======
	}
	
	
	@PostMapping("/writeComments")
	public ModelAndView goWriteComments(@ModelAttribute("area") String area)
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
	{
		return new ModelAndView("project/writeComments");
		
	}
	
	@GetMapping("/showMap")
	public ModelAndView goMap()
	{
		return new ModelAndView("project/map");
	}
	
<<<<<<< HEAD
	
	@GetMapping("/showDetail")
	public ModelAndView goDetail(@ModelAttribute("area") String area)
	{
		return new ModelAndView("project/detail");
=======
	@GetMapping("/getLocalList")
	public ModelAndView getLocalList(String local)
	{
		try {
			ModelAndView mv = new ModelAndView();
			List<TdetailVO> list = detailService.getLocalList(local);	
			mv.addObject("list", list);
			mv.setViewName("project/localList");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/showDetail") 
	public ModelAndView testShowDetail(String area)
	{
		try {
			ModelAndView mv = new ModelAndView();
			TdetailVO tvo = detailService.getTourList(area);
			List<TcommnetVO> comList = commentService.getComment(tvo.getD_title());
			mv.addObject("tvo", tvo);
			mv.addObject("comList", comList);
			mv.setViewName("project/detail");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@PostMapping("/comWriteOk")
	public ModelAndView WriteComment(TcommnetVO tcvo, @ModelAttribute("area") String area)
	{
		try {
			ModelAndView mv = new ModelAndView();
			int result = commentService.writeComment(tcvo);
			mv.setViewName("redirect:/showDetail");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
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
	

	@GetMapping("/findpassword")
	public ModelAndView findpassword()
	{
		return new ModelAndView("project/myPage/findpassword");
	}
	
	
	
	@GetMapping("/getid")
	public ModelAndView getid()
	{
		return new ModelAndView("project/findid");
	}
	
	
<<<<<<< HEAD
	
	
	

	@GetMapping("/membersJoinForm")
	public ModelAndView domembersJoinForm()
	{
		return new ModelAndView("project/registrationForm");
	}
=======
	// ✅ 중복 매핑 제거: /membersJoinForm은 MemberController에서 처리
	// @GetMapping("/membersJoinForm")  <- 삭제됨
	// public ModelAndView domembersJoinForm()
	// {
	//     return new ModelAndView("project/registrationForm");
	// }
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
	
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
<<<<<<< HEAD
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
=======
	
	
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
	
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
	
	
	

<<<<<<< HEAD
}
=======
}
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
