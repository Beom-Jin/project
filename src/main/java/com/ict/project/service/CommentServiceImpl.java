package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.CommentDAO;
import com.ict.project.vo.TcommnetVO;


@Service
public class CommentServiceImpl implements CommentService
{
	@Autowired
	CommentDAO commentDAO;

	@Override
	public List<TcommnetVO> getComment(String detail_board)
	{
		try {
			return commentDAO.getComment(detail_board);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int writeComment(TcommnetVO tcvo)
	{
		try {
			return commentDAO.writeComment(tcvo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
