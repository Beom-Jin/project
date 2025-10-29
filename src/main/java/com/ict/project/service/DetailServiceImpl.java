package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.repository.DetailDAO;
import com.ict.project.vo.TdetailVO;

@Service
public class DetailServiceImpl implements DetailService
{
	@Autowired
	DetailDAO detailDAO;

	@Override
	public TdetailVO getTourList(String area)
	{
		try {		
			String text;
			
			TdetailVO tvo = detailDAO.getTourList(area);
			text = tvo.getD_content();
			tvo.setD_content(text.replace("\n", "<br>"));
			return tvo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TdetailVO> getLocalList(String local)
	{
		try {
			return detailDAO.getLocalList(local);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
