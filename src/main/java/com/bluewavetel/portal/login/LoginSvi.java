package com.bluewavetel.portal.login;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.bluewavetel.dto.UserDto;

import jakarta.servlet.http.HttpSession;

public interface LoginSvi {
	/** 로그인 
	 * @throws NoSuchAlgorithmException */
	int loginChk(UserDto userVo) throws NoSuchAlgorithmException;
	
	//logout
	
	/** 회원가입 */
	int join(UserDto userDto) throws NoSuchAlgorithmException;

	// 사용자 불러오기
	UserDto getUserById(String userId);

	// 사용자 정보 업데이트
	int updateUser(UserDto userDto) throws NoSuchAlgorithmException;

	// 전체 회원정보 불러오기
	List<UserDto> getUserList();

	// 세션 회원정보 유지
	void keepSession(HttpSession session);
}
