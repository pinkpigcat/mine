package com.itwillbs.domain;

public class PageBean {
	
	private int count; // 전체 페이지 수 저장
	private int pageSize; //현제 화면ㅇ ㅔ보여줄 페이지 갯수 10개
	private String pageNum; //현재 페이지 넘버
	private int currentPage; //현제페이지를 가져와서 int형으로 바꿔서 저장할 변수
	private int startRow; // 1페이지면 총 글 1~10가져오고 2페이지면 11~20 여기서 시작 로우 
	private int endRow;   //현재페이지에서 끝 ROW            //startRow endRow는 dao에서 각 페이지별 10개씩 짤라서 가져오기위함
	private int pageCount; //<이전>1 2 3...<다음> 전체페이지가 50이고 보여줄 밑블럭이 10이라면 pageCount=5가 되는것
	private int pageBlock; //페이지마다 몇개씩 보여줄것인가 == 10개 고정 pageSize랑 헷갈리지 말기
	private int startPage; //((currentPage-1)/pageBlock)*pageBlock+1; <이전> 1(startPage) 2 3 4 ...10(endPage) <이후>
	private int endPage;   //endPage=startPage+pageBlock-1;
//	startPage 1   pageBlock 10  =>  endPage=10
//  startPage 11   pageBlock 10  => endPage=20
//  startPage 21   pageBlock 10  => endPage=30
	
	
	
	public int getCount() {
		return count;
		
	}
	
	
	public void setCount(int count) {
		this.count = count;
		//list.jsp 에서 count를 호출하기때문에 페이지를 부를때마다 자동호출
		init();
		
	}
	
	public void init() {
		
		pageCount=count/pageSize+(count%pageSize==0?0:1);
		pageBlock=10;
		startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage=pageCount;
		}
		//현재 페이지 넘버가 endPage보다 크면 현재 페이지를 endPage로 강제
		if (currentPage>endPage) {
			currentPage=endPage;
		}
		
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
}
