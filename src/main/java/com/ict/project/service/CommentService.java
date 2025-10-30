package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.TcommnetVO;

public interface CommentService
{
	public List<TcommnetVO> getComment(String detail_board);
	public int writeComment(TcommnetVO tcvo);
}
