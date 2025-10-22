package com.ict.project.common;

import org.springframework.stereotype.Component;

@Component
public class Paging {
	private int nowPage = 1;
	private int nowBlock = 1;
	
	// 페이지당 게시물의 수 
	private int numPerPage = 4;
	// 한 블럭의 수 
	private int pagePerBlock = 3;
	
	// DB 게시물의 수 
	private int totalRecord = 0;
	// 전체 페이지 수 
	private int totalPage = 0;
	// 전체 블럭의 수 
	private int totalBlock = 0;

	// 한번에 가져올 게시물의 처리하는 변수(MySQL, MariaDB O, Oracle X)
	private int offset = 0;
	private int beginBlock = 0;
	private int endBlock = 0;
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getBeginBlock() {
		return beginBlock;
	}
	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
	public void setPageInfo(int count, String page) {
		// 1. DB 전체 게시물의 수 구하기
		// 2. 전체 페이지의 수
		setTotalRecord(count);		
		
		// 3. 파라미터에서 list를 거치는 것음 무조건 cPage라는 현재 페이지의 값을 전달 받아야 한다.  
		if(page == null) {
			setNowPage(1);
		}else {
			setNowPage(Integer.parseInt(page));
		}
		
		// 4. DB에서 nowpage 를 기준으로 필요한 게시물 계산 
		if(getTotalRecord() <= getNumPerPage()) {
			setTotalPage(1);
		}else {
			// 전체 레코드 수를 numPerPage로 나눈 정수값이 전체 페이지 
			int cnt = getTotalRecord() / getNumPerPage();
			
			if(getTotalRecord() % getNumPerPage() != 0 ) {
				setTotalPage(cnt + 1);
			}
			else {
				setTotalPage(cnt);
			}
		}		
		setOffset(getNumPerPage() * (getNowPage() - 1));
		
		// 5. 시작 블럭과 끝 블러 구하기 
		setBeginBlock((int)( ( (getNowPage()-1) / getPagePerBlock() ) * getPagePerBlock() + 1) );
		setEndBlock(getBeginBlock() + getPagePerBlock() - 1);
		
		// 6. 주의 사항
		// EndBlock 보정 (임의의 계산값임으로 실블럭보다 큰 경우 방생)
		if(getEndBlock() >= getTotalPage()) {
			setEndBlock(getTotalPage());
		}
		
		//System.out.println("setPageInfo");
	}
	
}
