package com.bluewavetel.portal.login;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluewavetel.common.CommonSvi;
import com.bluewavetel.dto.UserDto;
import com.bluewavetel.dto.common.TypeDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginCtr {
	
	@Autowired
	private CommonSvi commonSvi;
	
	@Autowired
	private LoginSvi loginSvi;
	

	@GetMapping("/login")
	public String login(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		
		if(userId != null) {
			
			UserDto user = (UserDto) session.getAttribute("user");
			
			if(user == null) {
				user = loginSvi.getUserById(userId);
				if(!user.getUserName().isEmpty()) {
					session.setAttribute("user", user);
				}
			}
			//로그인 된 상태
			return "redirect:/";
		}
		
        return "/login/login";
	}
	
	@PostMapping("/login.do")
	@ResponseBody
	public String login(@ModelAttribute("userDto") UserDto userDto, HttpSession session) throws NoSuchAlgorithmException {
		
		String result = "";
		
		int Cnt = loginSvi.loginChk(userDto);
		
		if( Cnt > 0) { //아이디와 비밀번호가 일치하는 데이터가 존재하면
			result = "success"; //성공
			
			UserDto user = loginSvi.getUserById(userDto.getUserId());
			
			session.setAttribute("user", user);
			session.setAttribute("userId", userDto.getUserId());
			//session.setAttribute("userTypeCd", user.getUserTypeCd());
			
			//내장 tomcat 사용하지 않는 경우, 별도로 세션만료 시간 설정(초단위)
			//session.setMaxInactiveInterval(600);
			
		} else {
			result = "fail"; //실패
		}
		
        return result;
	}
	
	@PostMapping("/logout")
	@ResponseBody
	public String logout(@Param("id") String id, HttpSession session) {
		
		String result = "";
		try {
			// 세션의 아이디와 로그아웃하려는 아이디가 같으면
			if(session.getAttribute("userId").equals(id)) {
				session.removeAttribute("userId");
				//session.removeAttribute("userTypeCd");
				session.removeAttribute("user");
				result = "success";
			}else {
				result = "fail";
			}
		} catch (Exception e) {
			return "sessionout";
		}
		
		return result;
	}
	
    /**
     * @ScrnNm 회원가입 페이지
     * @Description 회원가입 페이지로 이동한다
     * @Param 부서/직위/직책코드 기본정보 가지고 이동 
     */
	@GetMapping("/join")
	public ModelAndView join() {
		
		ModelAndView mv = new ModelAndView();
			
		//return할 View
		mv.setViewName("/login/join");
		
        return mv;
	}
	
    /**
     * @throws NoSuchAlgorithmException 
     * @ScrnNm 회원가입 페이지
     * @Description 회원가입
     * @Param 회원가입 페이지에서 입력한 회원가입 정보
     */
	@PostMapping("/join/join.do")
	@ResponseBody
	public int join(@ModelAttribute("UserDto") UserDto userDto) throws NoSuchAlgorithmException {
		
		int result = loginSvi.join(userDto);
		
        return result;
	}
	
    /**
     * @throws NoSuchAlgorithmException 
     * @ScrnNm 회원가입 페이지
     * @Description 아이디 중복 체크
     * @Param 가입시도하고자 하는 아이디 정보
     */
	@PostMapping("/join/idchk.do")
	@ResponseBody
	public int idchk(@ModelAttribute("UserDto") UserDto userDto) throws NoSuchAlgorithmException {
		
		int result = loginSvi.loginChk(userDto);
		
        return result;
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		String userId = "";
		
		try {
			userId = (String) session.getAttribute("userId");
		} catch (Exception e) {
			mv.setViewName("/error/sessionout");
			
			return mv;
		}
		
		if(userId != null) {
			UserDto user = loginSvi.getUserById(userId);
			if(!user.getUserName().isEmpty()) {
				mv.addObject("user", user);
			}
			
			mv.setViewName("/login/mypage");
		} else {
			mv.setViewName("/login/login");
		}
			
        return mv;
	}
	
	@PostMapping("/mypage/update.do")
	@ResponseBody
	public int update(@ModelAttribute("UserDto") UserDto userDto) throws NoSuchAlgorithmException {
		
		int result = loginSvi.updateUser(userDto);
		
        return result;
	}
	
	@GetMapping("/userlist")
	public ModelAndView userlist(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
	
		int userTypeCd = 0;
		
		try {
			UserDto user = (UserDto) session.getAttribute("user");
			userTypeCd = user.getUserTypeCd();
		} catch (Exception e) {
			mv.setViewName("/error/sessionout");
			
			return mv;
		}
		
		if(userTypeCd == 9) {
			List<UserDto> userlist = loginSvi.getUserList();
			
			if(userlist.size() > 0) {
				mv.addObject("userlist", userlist);
			}
			
			// 사용자 등급 리스트 제공
			TypeDto userTypeDto = new TypeDto();
			userTypeDto.setCategory("USER");
			List<TypeDto> userTypeList = commonSvi.retrieveTypeList(userTypeDto);
			
			mv.addObject("userTypeList", userTypeList);
			
			mv.setViewName("/login/userlist");
		} else {
			mv.setViewName("/login/login");
		}
			
        return mv;
	}
	
	@PostMapping("/userlist/update.do")
	@ResponseBody
	public int userlistUpdate(@RequestBody List<UserDto> userlist, HttpSession session) throws NoSuchAlgorithmException {
		
		int userTypeCd = 0;
		int result = 0;
		
		try {
			UserDto user = (UserDto) session.getAttribute("user");
			userTypeCd = user.getUserTypeCd();
		} catch (Exception e) {
			return result;
		}
		
		if(userTypeCd == 9) {
		
			if(userlist.size() > 0) {
				for(UserDto user : userlist) {
					result = loginSvi.updateUser(user);
				}
			}
		}
		
		return result;
	}
}
