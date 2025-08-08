package com.bluewavetel.dto;

public class FileDto {
	
	/** 파일ID */
	private int fileId;
	/** 게시물ID */
	private int boardId;
	/** 회원 ID */
	private int userUid;
	/** 파일경로 */
	private String filePath;
	/** 파일명 */
	private String fileName;
	/** 파일원본명 */
	private String fileNameOrg;
	/** 파일사이즈 */
	private int fileSize;
	/** 파일확장자 */
	private String fileExt;
	/** 파일메모 */
	private String fileNote;
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

	/**
	 * @return the fileId
	 */
	public int getFileId() {
		return fileId;
	}
	/**
	 * @param fileId the fileId to set
	 */
	public void setFileId(int fileId) {
		this.fileId = fileId;
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
	public int getUserUid() {
		return userUid;
	}
	/**
	 * @param userUid the userUid to set
	 */
	public void setUserUid(int userUid) {
		this.userUid = userUid;
	}
	/**
	 * @return the filePath
	 */
	public String getFilePath() {
		return filePath;
	}
	/**
	 * @param filePath the filePath to set
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}
	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	/**
	 * @return the fileNameOrg
	 */
	public String getFileNameOrg() {
		return fileNameOrg;
	}
	/**
	 * @param fileNameOrg the fileNameOrg to set
	 */
	public void setFileNameOrg(String fileNameOrg) {
		this.fileNameOrg = fileNameOrg;
	}
	/**
	 * @return the fileSize
	 */
	public int getFileSize() {
		return fileSize;
	}
	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	/**
	 * @return the fileExt
	 */
	public String getFileExt() {
		return fileExt;
	}
	/**
	 * @param fileExt the fileExt to set
	 */
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	/**
	 * @return the fileNote
	 */
	public String getFileNote() {
		return fileNote;
	}
	/**
	 * @param fileNote the fileNote to set
	 */
	public void setFileNote(String fileNote) {
		this.fileNote = fileNote;
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

}
