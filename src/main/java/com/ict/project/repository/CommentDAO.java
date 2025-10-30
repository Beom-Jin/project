package com.ict.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.TcommnetVO;

@Repository
public class CommentDAO
{
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	
	public List<TcommnetVO> getComment(String detail_board)
	{
		try {
			return sessionTemplate.selectList("comment.getcomment", detail_board);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int writeComment(TcommnetVO tcvo)
	{
		try {
			return sessionTemplate.insert("comment.insertcomment", tcvo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
