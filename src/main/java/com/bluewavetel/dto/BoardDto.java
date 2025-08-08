package com.bluewavetel.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {
	
	private int number;
	
	/** 게시물ID */
	private int boardId;
	/** 회원식별ID */
	private String userUid;
	/** 게시물유형 */
	private String boardTypeCd;
	/** 게시물유형명 */
	private String boardTypeNm;
	/** 카테고리 */
	private int categoryTypeCd;
	/** 카테고리명 */
	private String categoryTypeNm;
	/** 카테고리영명 */
	private String categoryTypeEngNm;
	/** 제목 */
	private String title;
	/** 제목(영문) */
	private String titleEng;
	/** 부제목 */
	private String subTitle;
	/** 내용 */
	private String content;
	/** 내용텍스트 */
	private String contentTxt;
	/** 내용 */
	private String contentEng;
	/** 내용텍스트 */
	private String contentEngTxt;
	/** 대표이미지경로 */
	private String thumnailImg;
	/** 관련URL1 */
	private String url1;
	/** 관련URL2 */
	private String url2;
	/** 키워드 */
	private String keyword;
	/** 조회수 */
	private int viewCnt;
	/** 스크랩수 */
	private int scrapCnt;
	/** 메인노출여부 */
	private String mainYn;
	
	/** 제품 설명 */
	private String productDesc;
	/** 제품 설명 */
	private String productDescEng;
	
	/** 작성자이름 */
	private String writer;
	/** 작성자연락처 */
	private String writerPhone;
	/** 작성자이메일 */
	private String writerMail;
	/** 작성자회사명 */
	private String writerCompany;
	/** 삭제여부 */
	private String delYn;
	/** 최초등록자 */
	private String regUserUid;
	/** 최초등록일시 */
	private String regTime;
	/** 최종수정자 */
	private String modiUserUid;
	/** 최종수정일시 */
	private String modiTime;
	
	/** 썸네일 이미지 파일 */
	private MultipartFile thumbnailImgFile;
	
	/** 첨부파일1 */
	private MultipartFile attachFile0;
	
	/** 첨부파일2 */
	private MultipartFile attachFile1;
	
	/** 첨부파일3 */
	private MultipartFile attachFile2;
	
	/** 페이지네이션 정보 */
	private PageDto pageInfo;
	
	/**
	 * @return the number
	 */
	public int getNumber() {
		return number;
	}
	/**
	 * @param number the number to set
	 */
	public void setNumber(int number) {
		this.number = number;
	}

	/**
	 * @return the boardId
	 */
	public int getBoardId() {
		return boardId;
	}
	/**
	 * @param boardId the boardId to set
	 */
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	/**
	 * @return the userUid
	 */
	public String getUserUid() {
		return userUid;
	}
	/**
	 * @param userUid the userUid to set
	 */
	public void setUserUid(String userUid) {
		this.userUid = userUid;
	}
	/**
	 * @return the boardTypeCd
	 */
	public String getBoardTypeCd() {
		return boardTypeCd;
	}
	/**
	 * @param boardTypeCd the boardTypeCd to set
	 */
	public void setBoardTypeCd(String boardTypeCd) {
		this.boardTypeCd = boardTypeCd;
	}
	/**
	 * @return the boardTypeNm
	 */
	public String getBoardTypeNm() {
		return boardTypeNm;
	}
	/**
	 * @param boardTypeNm the boardTypeNm to set
	 */
	public void setBoardTypeNm(String boardTypeNm) {
		this.boardTypeNm = boardTypeNm;
	}
	/**
	 * @return the categoryTypeCd
	 */
	public int getCategoryTypeCd() {
		return categoryTypeCd;
	}
	/**
	 * @param categoryTypeCd the categoryTypeCd to set
	 */
	public void setCategoryTypeCd(int categoryTypeCd) {
		this.categoryTypeCd = categoryTypeCd;
	}
	/**
	 * @return the categoryTypeNm
	 */
	public String getCategoryTypeNm() {
		return categoryTypeNm;
	}
	/**
	 * @param categoryTypeNm the categoryTypeNm to set
	 */
	public void setCategoryTypeNm(String categoryTypeNm) {
		this.categoryTypeNm = categoryTypeNm;
	}
	/**
	 * @return the categoryTypeEngNm
	 */
	public String getCategoryTypeEngNm() {
		return categoryTypeEngNm;
	}
	/**
	 * @param categoryTypeEngNm the categoryTypeEngNm to set
	 */
	public void setCategoryTypeEngNm(String categoryTypeEngNm) {
		this.categoryTypeEngNm = categoryTypeEngNm;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the titleEng
	 */
	public String getTitleEng() {
		return titleEng;
	}
	/**
	 * @param titleEng the titleEng to set
	 */
	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}
	/**
	 * @return the subTitle
	 */
	public String getSubTitle() {
		return subTitle;
	}
	/**
	 * @param subTitle the subTitle to set
	 */
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the contentTxt
	 */
	public String getContentTxt() {
		return contentTxt;
	}
	/**
	 * @param contentTxt the contentTxt to set
	 */
	public void setContentTxt(String contentTxt) {
		this.contentTxt = contentTxt;
	}
	/**
	 * @return the thumnailImg
	 */
	public String getThumnailImg() {
		return thumnailImg;
	}
	/**
	 * @param thumnailImg the thumnailImg to set
	 */
	public void setThumnailImg(String thumnailImg) {
		this.thumnailImg = thumnailImg;
	}
	/**
	 * @return the url1
	 */
	public String getUrl1() {
		return url1;
	}
	/**
	 * @param url1 the url1 to set
	 */
	public void setUrl1(String url1) {
		this.url1 = url1;
	}
	/**
	 * @return the url2
	 */
	public String getUrl2() {
		return url2;
	}
	/**
	 * @param url2 the url2 to set
	 */
	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}
	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	/**
	 * @return the viewCnt
	 */
	public int getViewCnt() {
		return viewCnt;
	}
	/**
	 * @param viewCnt the viewCnt to set
	 */
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	/**
	 * @return the scrapCnt
	 */
	public int getScrapCnt() {
		return scrapCnt;
	}
	/**
	 * @param scrapCnt the scrapCnt to set
	 */
	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}
	/**
	 * @return the mainYn
	 */
	public String getMainYn() {
		return mainYn;
	}
	/**
	 * @param mainYn the mainYn to set
	 */
	public void setMainYn(String mainYn) {
		this.mainYn = mainYn;
	}
	/**
	 * @return the productDesc
	 */
	public String getProductDesc() {
		return productDesc;
	}
	/**
	 * @param productDesc the productDesc to set
	 */
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	/**
	 * @return the productDescEng
	 */
	public String getProductDescEng() {
		return productDescEng;
	}
	/**
	 * @param productDescEng the productDescEng to set
	 */
	public void setProductDescEng(String productDescEng) {
		this.productDescEng = productDescEng;
	}
	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}
	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}
	/**
	 * @return the writerPhone
	 */
	public String getWriterPhone() {
		return writerPhone;
	}
	/**
	 * @param writerPhone the writerPhone to set
	 */
	public void setWriterPhone(String writerPhone) {
		this.writerPhone = writerPhone;
	}
	/**
	 * @return the writerMail
	 */
	public String getWriterMail() {
		return writerMail;
	}
	/**
	 * @param writerMail the writerMail to set
	 */
	public void setWriterMail(String writerMail) {
		this.writerMail = writerMail;
	}
	/**
	 * @return the writerCompany
	 */
	public String getWriterCompany() {
		return writerCompany;
	}
	/**
	 * @param writerCompany the writerCompany to set
	 */
	public void setWriterCompany(String writerCompany) {
		this.writerCompany = writerCompany;
	}
	/**
	 * @return the delYn
	 */
	public String getDelYn() {
		return delYn;
	}
	/**
	 * @param delYn the delYn to set
	 */
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	/**
	 * @return the regUserUid
	 */
	public String getRegUserUid() {
		return regUserUid;
	}
	/**
	 * @param regUserUid the regUserUid to set
	 */
	public void setRegUserUid(String regUserUid) {
		this.regUserUid = regUserUid;
	}
	/**
	 * @return the regTime
	 */
	public String getRegTime() {
		return regTime;
	}
	/**
	 * @param regTime the regTime to set
	 */
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	/**
	 * @return the modiUserUid
	 */
	public String getModiUserUid() {
		return modiUserUid;
	}
	/**
	 * @param modiUserUid the modiUserUid to set
	 */
	public void setModiUserUid(String modiUserUid) {
		this.modiUserUid = modiUserUid;
	}
	/**
	 * @return the modiTime
	 */
	public String getModiTime() {
		return modiTime;
	}
	/**
	 * @param modiTime the modiTime to set
	 */
	public void setModiTime(String modiTime) {
		this.modiTime = modiTime;
	}
	/**
	 * @return the pageInfo
	 */
	public PageDto getPageInfo() {
		return pageInfo;
	}
	/**
	 * @param pageInfo the pageInfo to set
	 */
	public void setPageInfo(PageDto pageInfo) {
		this.pageInfo = pageInfo;
	}
	/**
	 * @return the thumbnailImgFile
	 */
	public MultipartFile getThumbnailImgFile() {
		return thumbnailImgFile;
	}
	/**
	 * @param thumbnailImgFile the thumbnailImgFile to set
	 */
	public void setThumbnailImgFile(MultipartFile thumbnailImgFile) {
		this.thumbnailImgFile = thumbnailImgFile;
	}
	/**
	 * @return the attachFile0
	 */
	public MultipartFile getAttachFile0() {
		return attachFile0;
	}
	/**
	 * @param attachFile0 the attachFile0 to set
	 */
	public void setAttachFile0(MultipartFile attachFile0) {
		this.attachFile0 = attachFile0;
	}
	/**
	 * @return the attachFile1
	 */
	public MultipartFile getAttachFile1() {
		return attachFile1;
	}
	/**
	 * @param attachFile1 the attachFile1 to set
	 */
	public void setAttachFile1(MultipartFile attachFile1) {
		this.attachFile1 = attachFile1;
	}
	/**
	 * @return the attachFile2
	 */
	public MultipartFile getAttachFile2() {
		return attachFile2;
	}
	/**
	 * @param attachFile2 the attachFile2 to set
	 */
	public void setAttachFile2(MultipartFile attachFile2) {
		this.attachFile2 = attachFile2;
	}
	/**
	 * @return the contentEng
	 */
	public String getContentEng() {
		return contentEng;
	}
	/**
	 * @param contentEng the contentEng to set
	 */
	public void setContentEng(String contentEng) {
		this.contentEng = contentEng;
	}
	/**
	 * @return the contentEngTxt
	 */
	public String getContentEngTxt() {
		return contentEngTxt;
	}
	/**
	 * @param contentEngTxt the contentEngTxt to set
	 */
	public void setContentEngTxt(String contentEngTxt) {
		this.contentEngTxt = contentEngTxt;
	}

}
