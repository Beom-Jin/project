package com.ict.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List<ReviewVO> getReviewList() {
		return sessionTemplate.selectList("review.list");
	}

	public ReviewVO getReviewDetail(ReviewVO reviewVO) {
		return sessionTemplate.selectOne("review.detail", reviewVO);
	}
	
	public int getReviewInsert(ReviewVO reviewVO) {
		return sessionTemplate.insert("review.insert", reviewVO);
	}
	
	public int getReviewDelete(ReviewVO reviewVO) {
		return sessionTemplate.update("review.delete", reviewVO);
	}
	public int getReviewUpdate(ReviewVO reviewVO) {
		return sessionTemplate.update("review.update", reviewVO);
	}
}
