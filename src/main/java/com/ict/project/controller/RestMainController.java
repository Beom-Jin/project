package com.ict.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@RequestMapping(value="/insertTour")
	@ResponseBody
	public String getTourInsert(@ModelAttribute TboardVO vo) {
		try {
			//System.out.println("getTourInsert : " + vo.getB_content());
			int r = tourService.getTourInsert(vo);			
			//System.out.println("Insert res: " + r);
			if(r != 0)
				return "OK";
			else
				return "NG";
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//@RequestMapping(value="/updateTour")
	// 업데이트할 데이터를 가져온다 ( 1 개)
	@PostMapping(value="/updateTourPre")
	@ResponseBody
	public Map<String, Object> getTourUpdatePre(HttpServletRequest request) {
		try {
			//System.out.println("method = " + request.getMethod());
			String b_idx = request.getParameter("b_idx");
			
			TboardVO vo = tourService.getTourUpdatePre(b_idx);			
			
			Map<String, Object> map = new HashMap<>();
			
			//System.out.println("UpdatePre: " + vo.getB_content());
			
			map.put("vo", vo);
			map.put("res", "OK");
			
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping(value="/updateTour")
	@ResponseBody
	public String getTourUpdate(@ModelAttribute TboardVO vo) {
		try {
			//System.out.println("getTourUpdate :" + vo.getB_title() +" : "+ + vo.getB_idx());			
			
			int r = tourService.getTourUpdate(vo);
			
			//System.out.println("Update res: " + r);
			
			if(r != 0)
				return "OK";
			else
				return "NG";
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
