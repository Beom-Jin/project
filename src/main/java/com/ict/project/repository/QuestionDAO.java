package com.ict.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.vo.QuestionVO;

@Repository
public class QuestionDAO {
	@Autowired
	private SqlSessionTemplate sessionTempate;
	
	public List<QuestionVO> getQuestionList() {
		return sessionTempate.selectList("question.list");
	}
	
	public QuestionVO getQuestionDetail(QuestionVO questionVO) {
		return sessionTempate.selectOne("question.detail", questionVO);
	}
	
	public int getQuestionInsert(QuestionVO questionVO) {
		return sessionTempate.insert("question.insert", questionVO);
	}
	
	public int getQuestionDelete(QuestionVO questionVO) {
		return sessionTempate.update("question.delete", questionVO);
	}
	public int getQuestionUpdate(QuestionVO questionVO) {
		return sessionTempate.update("question.update", questionVO);
	}
}
