package com.ict.project.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.TboardVO;

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
	

}
