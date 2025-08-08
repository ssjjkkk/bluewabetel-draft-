package com.bluewavetel.dto;

public class PageDto {

	/** 게시물 성격(A:뉴스, B:여행문화 */
	private String boardTypeCd;
	
	/** 카테고리 */
	private String category;
	
	/** 카테고리 국문 */
	private String categoryNm;
	
	/** 전체 게시글 카운트 */
	private int totalListCount;
	
	/** 페이지별 게시글 갯수 */
	private int pageSize;
	
	/** 현재 페이지 */
	private int pageNo;
	
	/** 페이지 오프셋 */
	private int offset;
	
	/** 전체 페이지 카운트 */
	private int totalPageCount;
	
	/** 검색어 */
	private String searchKeyword;

	public String getBoardTypeCd() {
		return boardTypeCd;
	}

	public void setBoardTypeCd(String boardTypeCd) {
		this.boardTypeCd = boardTypeCd;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public int gettotalListCount() {
		return totalListCount;
	}

	public void settotalListCount(int totalListCount) {
		this.totalListCount = totalListCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	/**
	 * @return the searchKeyword
	 */
	public String getSearchKeyword() {
		return searchKeyword;
	}

	/**
	 * @param searchKeyword the searchKeyword to set
	 */
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

}
