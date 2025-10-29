package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.TdetailVO;
import com.ict.project.vo.TboardVO;
import com.ict.project.vo.TcommnetVO;

public interface TourService {
	public int goCreateDB(List<TboardVO> list);	
	public List<TboardVO> getTourList(); 	
	
	int getTotalCount();
	public List<TboardVO> getTourListPage(int limit, int offset);
	
	// ========================= 테스트용 함수 ====================================
	public TdetailVO getTourList(String area); 	
	public List<TcommnetVO> getComment(String detail_board);
	public int writeComment(TcommnetVO tcvo);
	public List<TdetailVO> getLocalList(String local);
	
}
