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
	//public List<TboardVO> getTourList(HttpServletRequest request) {
	public Map<String, Object> getTourList(HttpServletRequest request) {
		try {
			int count = tourService.getTotalCount();
			String cPage = request.getParameter("cPage");
			
			paging.setPageInfo(count, cPage);
			System.out.println("count : " + count + ", cPage : " + cPage);
			//List<TboardVO> list = tourService.getTourList();	
			List<TboardVO> list = tourService.getTourListPage(paging.getNumPerPage(), paging.getOffset());

			Map<String, Object> map = new HashMap<>();

			map.put("list", list);
			map.put("paging", paging);
			
//			int i = 0;
//			for (TboardVO k : list) {
//				System.out.println("getB_content : " + list.get(i).getB_content());
//				i++;
//			}					
			return map; 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
