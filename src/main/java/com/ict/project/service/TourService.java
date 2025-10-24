package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.TboardVO;

public interface TourService {
	public int goCreateDB(List<TboardVO> list);	
	public List<TboardVO> getTourList(); 	
	
	int getTotalCount();
	public List<TboardVO> getTourListPage(int limit, int offset, int b_theme);
	
	
}
