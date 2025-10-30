package com.ict.project.service;

import java.util.List;

import com.ict.project.vo.TdetailVO;

public interface DetailService
{
	public TdetailVO getTourList(String area); 	
	public List<TdetailVO> getLocalList(String local);
}
