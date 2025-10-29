package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> getQuestionList();
	public QuestionVO getQuestionDetail(QuestionVO questionVO);
	public int getQuestionInsert(QuestionVO questionVO);
	public int getQuestionDelete(QuestionVO questionVO);
	public int getQuestionUpdate(QuestionVO questionVO);
}
