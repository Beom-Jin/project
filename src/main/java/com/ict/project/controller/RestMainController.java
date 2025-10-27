package com.ict.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.project.common.Paging;
import com.ict.project.service.TourService;
import com.ict.project.vo.TboardVO;

@RestController
public class RestMainController {
	@Autowired 
	private TourService tourService;

	@Autowired
	private Paging paging;
	
	@RequestMapping(value="/showTourList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTourList(HttpServletRequest request) {
		try {
			int count = tourService.getTotalCount();
			String cPage = request.getParameter("cPage");  
			String numPage = request.getParameter("numPage"); 
			String b_theme = request.getParameter("categoryData");
			//System.out.println("count : " + count + ", cPage : " + cPage + ", numPage : " + numPage + ", b_theme : " + b_theme);
			
			paging.setNumPerPage(Integer.parseInt(numPage));
			
			paging.setPageInfo(count, cPage);			
			//System.out.println("totalBlock : " + paging.getTotalBlock() + ", beginBlock : " + paging.getBeginBlock() + ", endBlock : " + paging.getEndBlock());
			//List<TboardVO> list = tourService.getTourList();	
			//List<TboardVO> list = tourService.getTourListPage(paging.getNumPerPage(), paging.getOffset());
			List<TboardVO> list = tourService.getTourListPage(paging.getNumPerPage(), paging.getOffset(), Integer.parseInt(b_theme));

			Map<String, Object> map = new HashMap<>();

			map.put("list", list);
			map.put("paging", paging);
			
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="/insertTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getTourInsert() {
		try {
			System.out.println("getTourInsert");
			
			return null;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value="/updateTour", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getTourUpdate() {
		try {
			System.out.println("getTourUpdate");
			
			return null;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
