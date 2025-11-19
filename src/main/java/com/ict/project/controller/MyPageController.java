package com.ict.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.service.QuestionService;
import com.ict.project.service.ReviewService;
import com.ict.project.vo.QuestionVO;
import com.ict.project.vo.ReviewVO;

@Controller
public class MyPageController {

	@GetMapping("/showMyPage")
	public ModelAndView goMyPage() {
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

	// 여행 후기 관련
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/showTravelReview")
	public ModelAndView goTravelReview() {
		ModelAndView mv = new ModelAndView();
		List<ReviewVO> rList = reviewService.getReviewList();
		mv.addObject("rList", rList);
		mv.setViewName("project/myPage/TravelReview");
		return mv;
	}

	@RequestMapping("/showTravelReviewDetail")
	public ModelAndView goTravelReviewDetail(ReviewVO reviewVO) {
		ModelAndView mv = new ModelAndView();
		ReviewVO rVO = reviewService.getReviewDetail(reviewVO);
		mv.addObject("rVO", rVO);
		mv.setViewName("project/myPage/TravelReviewDetail");
		return mv;
	}

	@GetMapping("/TravelReviewWriteForm")
	public ModelAndView goTravelReviewWriteForm() {
		return new ModelAndView("project/myPage/TravelReviewWriteForm");
	}

	@GetMapping("/TravelReviewWriteOk")
	public ModelAndView goTravelReviewWriteOk(ReviewVO reviewVO) {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.getReviewInsert(reviewVO);
		mv.setViewName("redirect:/showTravelReview");
		return mv;
	}

	@RequestMapping("/TravelReviewDelete")
	public ModelAndView goTravelReviewDelete(ReviewVO reviewVO) {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.getReviewDelete(reviewVO);
		mv.setViewName("redirect:/showTravelReview");
		return mv;
	}

	@PostMapping("/TravelReviewUpdateForm")
	public ModelAndView goTravelReviewUpdateForm(ReviewVO reviewVO) {
		ModelAndView mv = new ModelAndView();
		ReviewVO rVO = reviewService.getReviewDetail(reviewVO);
		mv.addObject("rVO", rVO);
		mv.setViewName("project/myPage/TravelReviewUpdateForm");
		return mv;
	}

	@PostMapping("/TravelReviewUpdateOk")
	public ModelAndView goTravelReviewUpdateOk(ReviewVO reviewVO) {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.getReviewUpdate(reviewVO);
		mv.setViewName("redirect:/showTravelReviewDetail?r_idx=" + reviewVO.getR_idx());
		return mv;
	}

	
	// 질문 내역 관련
	
	@Autowired
	private QuestionService questionService;

	@RequestMapping("/showQuestionList")
	public ModelAndView goQuestionList() {
		ModelAndView mv = new ModelAndView();
		List<QuestionVO> qList = questionService.getQuestionList();
		mv.addObject("qList", qList);
		mv.setViewName("project/myPage/Question");
		return mv;
	}

	@RequestMapping("/showQuestionDetail")
	public ModelAndView goQuestionDetail(QuestionVO questionVO) {
		ModelAndView mv = new ModelAndView();
		QuestionVO qVO = questionService.getQuestionDetail(questionVO);
		mv.addObject("qVO", qVO);
		System.out.println(qVO);
		mv.setViewName("project/myPage/QuestionDetail");
		return mv;
	}

	@GetMapping("/QuestionWriteForm")
	public ModelAndView goQuestionWriteForm() {
		return new ModelAndView("project/myPage/QuestionWriteForm");
	}

	@GetMapping("/QuestionWriteOk")
	public ModelAndView goQuestionWriteOk(QuestionVO questionVO) {
		ModelAndView mv = new ModelAndView();
		int result = questionService.getQuestionInsert(questionVO);
		mv.setViewName("redirect:/showQuestionList");
		return mv;
	}

	@RequestMapping("/QuestionDelete")
	public ModelAndView goQuestionDelete(QuestionVO questionVO) {
		ModelAndView mv = new ModelAndView();
		int result = questionService.getQuestionDelete(questionVO);
		mv.setViewName("redirect:/showQuestionList");
		return mv;
	}

	@PostMapping("/QuestionUpdateForm")
	public ModelAndView goQuestionUpdateForm(QuestionVO questionVO) {
		ModelAndView mv = new ModelAndView();
		QuestionVO qVO = questionService.getQuestionDetail(questionVO);
		mv.addObject("qVO", qVO);
		mv.setViewName("project/myPage/QuestionUpdateForm");
		return mv;
	}

	@PostMapping("/QuestionUpdateOk")
	public ModelAndView goQuestionUpdateOk(QuestionVO questionVO) {
		ModelAndView mv = new ModelAndView();
		int result = questionService.getQuestionUpdate(questionVO);
		mv.setViewName("redirect:/showQuestionDetail?q_idx=" + questionVO.getQ_idx());
		return mv;
	}
}
