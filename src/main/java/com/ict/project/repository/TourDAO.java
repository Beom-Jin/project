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
	
	public List<TboardVO> getTourListPage(int limit, int offset, int b_theme) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>(); 
			map.put("limit", limit);
			map.put("offset", offset);
			map.put("b_theme", b_theme);
			System.out.println();
			if(b_theme == 1)
				return sessionTemplate.selectList("tour.listpage", map);
			else
				return sessionTemplate.selectList("tour.listpageThema", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	public int getTourInsert(TboardVO vo) {
		try {
			return sessionTemplate.insert("tour.insertVO", vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public TboardVO getTourUpdatePre(String b_idx) {
		try {
			System.out.println("b_idx : " + b_idx);
			return sessionTemplate.selectOne("tour.detail", Integer.valueOf(b_idx));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	public int getTourUpdate(TboardVO vo) {
		try {
			System.out.println("b_idx : " + vo.getB_idx());
			return sessionTemplate.update("tour.update", vo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
