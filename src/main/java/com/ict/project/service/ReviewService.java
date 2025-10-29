package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> getReviewList();
	public ReviewVO getReviewDetail(ReviewVO reviewVO);
	public int getReviewInsert(ReviewVO reviewVO);
	public int getReviewDelete(ReviewVO reviewVO);
	public int getReviewUpdate(ReviewVO reviewVO);
}
