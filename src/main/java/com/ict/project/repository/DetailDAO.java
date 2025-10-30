package com.ict.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.TdetailVO;

@Repository
public class DetailDAO
{
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	
	public TdetailVO getTourList(String area)
	{
		try {
			return sessionTemplate.selectOne("detail.detaillist", area);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<TdetailVO> getLocalList(String local)
	{
		try {
			return sessionTemplate.selectList("detail.locallist", local);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
