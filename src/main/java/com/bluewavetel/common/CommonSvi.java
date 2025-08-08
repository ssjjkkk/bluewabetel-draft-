package com.bluewavetel.common;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.common.TypeDto;

import jakarta.mail.MessagingException;

public interface CommonSvi {
	/** 부서 리스트 조회 */
	/*List<PartDto> retrievePartList(PartDto partDto);*/
	/** 공통유형 리스트 조회 */
	List<TypeDto> retrieveTypeList(TypeDto typeDto);
	/** 문자열 암호화 
	 * @throws NoSuchAlgorithmException */
	String encryptString(String string) throws NoSuchAlgorithmException;
	
	/** 콤마(,)로 문자열 분리 */
	List<String> splitTextByComma(String text);
	
	/** htmlContents에서 문자열만 분리 */
	public String htmlContentToText(String htmlContent);
	
	/** htmlContents에서 대표 이미지만 분리 */
	public String getThumbnailImgSrc(String htmlContent);
	
	public void sendEmail(BoardDto board) throws MessagingException;
}
