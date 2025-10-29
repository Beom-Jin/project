package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.QuestionDAO;
import com.ict.project.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private QuestionDAO questionDAO;
	@Override
	public List<QuestionVO> getQuestionList() {
		List<QuestionVO> qList = questionDAO.getQuestionList();
		return qList;
	}
	
	@Override
	public QuestionVO getQuestionDetail(QuestionVO questionVO) {
		QuestionVO qVO = questionDAO.getQuestionDetail(questionVO);
		return qVO;
	}
	
	@Override
	public int getQuestionInsert(QuestionVO questionVO) {
		int result = questionDAO.getQuestionInsert(questionVO);
		return result;
	}
	
	@Override
	public int getQuestionDelete(QuestionVO questionVO) {
		int result = questionDAO.getQuestionDelete(questionVO);
		return result;
	}
	
	@Override
	public int getQuestionUpdate(QuestionVO questionVO) {
		int result = questionDAO.getQuestionUpdate(questionVO);
		return result;
	}
}
