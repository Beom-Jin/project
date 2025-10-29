package com.ict.project.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.TboardVO;
import com.ict.project.vo.TcommnetVO;
import com.ict.project.vo.TdetailVO;

@Repository
public class TourDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int goCreateDB(List<TboardVO> list) {
		try {
			return sessionTemplate.insert("tour.insert", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public List<TboardVO> getTourList() {
		try {
			return sessionTemplate.selectList("tour.list");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	public int getTotalCount() {
		try {
			return sessionTemplate.selectOne("tour.count");			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<TboardVO> getTourListPage(int limit, int offset) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>(); 
			map.put("limit", limit);
			map.put("offset", offset);
			return sessionTemplate.selectList("tour.listpage", map);			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	
	// ========================= 테스트용 함수 ====================================
	public TdetailVO getTourList(String area)
	{
		try {
			return sessionTemplate.selectOne("tour.testlist", area);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<TcommnetVO> getComment(String detail_board)
	{
		try {
			return sessionTemplate.selectList("tour.comment", detail_board);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int writeComment(TcommnetVO tcvo)
	{
		try {
			return sessionTemplate.insert("tour.insertcomment", tcvo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<TdetailVO> getLocalList(String local)
	{
		try {
			return sessionTemplate.selectList("tour.locallist", local);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
