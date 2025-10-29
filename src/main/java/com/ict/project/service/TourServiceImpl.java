package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.TourDAO;
import com.ict.project.vo.TboardVO;
import com.ict.project.vo.TcommnetVO;
import com.ict.project.vo.TdetailVO;

@Service
public class TourServiceImpl implements TourService{
	
	@Autowired
	private TourDAO tourDAO;
	
	@Override
	public int goCreateDB(List<TboardVO> list) {
		try {
			return tourDAO.goCreateDB(list);			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<TboardVO> getTourList() {
		try {
			return tourDAO.getTourList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public int getTotalCount() {
		try {
			return tourDAO.getTotalCount();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<TboardVO> getTourListPage(int limit, int offset) {
		try {
			return tourDAO.getTourListPage(limit, offset);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	
	
	
	
	
	// ========================= 테스트용 함수 ====================================
	@Override
	public TdetailVO getTourList(String area)	// detail화면 내용불러오는
	{
		try {		
			String text;
			
			TdetailVO tvo = tourDAO.getTourList(area);
			text = tvo.getD_content();
			tvo.setD_content(text.replace("\n", "<br>"));
			return tvo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TcommnetVO> getComment(String detail_board)	// 댓글 불러오는
	{
		try {
			return tourDAO.getComment(detail_board);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int writeComment(TcommnetVO tcvo)	// 댓글 쓰기 이후 저장
	{
		try {
			return tourDAO.writeComment(tcvo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public List<TdetailVO> getLocalList(String local)	// 맵->지역별 리스트 불러올때
	{
		try {
			return tourDAO.getLocalList(local);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
