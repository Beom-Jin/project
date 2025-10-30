package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.TourDAO;
import com.ict.project.vo.TboardVO;

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
	public List<TboardVO> getTourListPage(int limit, int offset, int b_theme) {
		try {
			return tourDAO.getTourListPage(limit, offset, b_theme);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public int getTourInsert(TboardVO vo) {
		try {
			return tourDAO.getTourInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public TboardVO getTourUpdatePre(String b_idx) {
		try {
			return tourDAO.getTourUpdatePre(b_idx);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public int getTourUpdate(TboardVO vo) {
		try {
			return tourDAO.getTourUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	

}
