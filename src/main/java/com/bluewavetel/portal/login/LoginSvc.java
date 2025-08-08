package com.bluewavetel.portal.login;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.bluewavetel.common.CommonSvi;
import com.bluewavetel.dao.CommonDao;
import com.bluewavetel.dto.UserDto;

import jakarta.servlet.http.HttpSession;

@Repository
public class LoginSvc implements LoginSvi {
	
    @Autowired
    @Qualifier("commonDAO")
    private CommonDao commonDao;
    
    @Autowired
    private CommonSvi commonSvi;
	
    @Override
	public int loginChk(UserDto userDto) throws NoSuchAlgorithmException {
    	
    	if(!"".equals(userDto.getUserPw()) && userDto.getUserPw() != null){
        	//비밀번호 암호화(SHA256)
        	String bfPw = userDto.getUserPw();
        	String afPw = commonSvi.encryptString(bfPw);
        	userDto.setUserPw(afPw);
    	}
    	
		return commonDao.select("LoginMapper_checkUserLogin", userDto);		
	}
    
    @Override
	public int join(UserDto userDto) throws NoSuchAlgorithmException {
    	
    	// USER_UID 채번
    	String userUid = commonDao.select("LoginMapper_selectNewUserUid");
    	userDto.setUserUid(userUid);
    	
    	//비밀번호 암호화(SHA256)
    	String bfPw = userDto.getUserPw();
    	String afPw = commonSvi.encryptString(bfPw);
    	userDto.setUserPw(afPw);
    	
		return commonDao.insert("LoginMapper_userJoin", userDto);
	}

	@Override
	public UserDto getUserById(String userId) {
		
		UserDto user = commonDao.select("LoginMapper_selectUserById", userId);
		
		return user;
	}

	@Override
	public int updateUser(UserDto userDto) throws NoSuchAlgorithmException {
    	
    	//비밀번호 암호화(SHA256)
    	String bfPw = userDto.getUserPw();
    	
    	if(bfPw != null) {
        	String afPw = commonSvi.encryptString(bfPw);
        	userDto.setUserPw(afPw);
    	}

		int cnt = commonDao.update("LoginMapper_updateUserInfo", userDto);
		
		return cnt;
	}

	@Override
	public List<UserDto> getUserList() {
		
		List<UserDto> userlist = commonDao.selectList("LoginMapper_selectUserList");
		
		return userlist;
	}
	
	@Override
    public void keepSession(HttpSession session){
		
		String userId = (String) session.getAttribute("userId");
		
		if(userId != null) {
			UserDto user = (UserDto) session.getAttribute("user");
			
			if(user == null) {
				user = getUserById(userId);
				if(!user.getUserName().isEmpty()) {
					session.setAttribute("user", user);
				}
			}
		}
    }
}
