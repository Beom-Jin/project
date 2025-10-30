package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.ReviewDAO;
import com.ict.project.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	@Override
	public List<ReviewVO> getReviewList() {
		List<ReviewVO> rList = reviewDAO.getReviewList();
		return rList;
	}
	
	@Override
	public ReviewVO getReviewDetail(ReviewVO reviewVO) {
		ReviewVO rVO = reviewDAO.getReviewDetail(reviewVO);
		return rVO;
	}
	
	@Override
	public int getReviewInsert(ReviewVO reviewVO) {
		int result = reviewDAO.getReviewInsert(reviewVO);
		return result;
	}
	
	@Override
	public int getReviewDelete(ReviewVO reviewVO) {
		int result = reviewDAO.getReviewDelete(reviewVO);
		return result;
	}
	
	@Override
	public int getReviewUpdate(ReviewVO reviewVO) {
		int result = reviewDAO.getReviewUpdate(reviewVO);
		return result;
	}
}
