package com.bluewavetel.portal;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bluewavetel.common.CommonSvi;
import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.PageDto;
import com.bluewavetel.dto.UserDto;
import com.bluewavetel.dto.common.TypeDto;
import com.bluewavetel.portal.board.BoardSvi;
import com.bluewavetel.portal.login.LoginSvi;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PortalCtr {
	
	@Autowired
	private CommonSvi commonSvi;
	
	@Autowired
	private BoardSvi boardSvi;

	@Autowired
	private LoginSvi loginSvi;
	
	@GetMapping("/")
	public ModelAndView home(HttpServletRequest request, HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		BoardDto board = new BoardDto();
		board.setMainYn("Y");
		
		List<BoardDto> inspectionList = new ArrayList<>();
		board.setCategoryTypeCd(1);
		inspectionList = boardSvi.selectBoardMain(board); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		List<BoardDto> analyzerList = new ArrayList<>();
		board.setCategoryTypeCd(2);
		analyzerList = boardSvi.selectBoardMain(board); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		List<BoardDto> sensorList = new ArrayList<>();
		board.setCategoryTypeCd(3);
		sensorList = boardSvi.selectBoardMain(board); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		List<BoardDto> etcList = new ArrayList<>();
		board.setCategoryTypeCd(4);
		etcList = boardSvi.selectBoardMain(board); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		List<BoardDto> noticeList = new ArrayList<>();
		noticeList = boardSvi.selectBoardNew("C", 2); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		List<BoardDto> boardList = new ArrayList<>();
		boardList = boardSvi.selectBoardNew("D", 2); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */

		mv.addObject("inspectionList", inspectionList);
		mv.addObject("analyzerList", analyzerList);
		mv.addObject("sensorList", sensorList);
		mv.addObject("etcList", etcList);
		
		mv.addObject("noticeList", noticeList);
		mv.addObject("boardList", boardList);
		
		keepLocale(session, locale);
		
		mv.setViewName("/main");
		
        return mv;
	}
	
	@GetMapping("/company")
	public String greeting() {
        return "/company/philosophy";
	}
	
	@GetMapping("/vision")
	public String vision() {
        return "/company/vision";
	}
	
	@GetMapping("/principle")
	public String principle() {
        return "/company/principle";
	}
	
	@GetMapping("/history")
	public String history() {
        return "/company/history";
	}
	
	@GetMapping("/certified")
	public String certified() {
        return "/company/certified";
	}
	
	@GetMapping("/product")
	public ModelAndView product(@RequestParam(name = "openTabName", required = false) String openTabName, HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		if(openTabName != null) {
			pageDto.setCategory(openTabName);
			mv.addObject("openTabName", openTabName);
		}
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(9); //페이지 변경 시에는 javascript sub.js loadBoardList에 설정
		pageDto.setBoardTypeCd("A"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> productList = new ArrayList<>();
		productList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("productList", productList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/product");
		
        return mv;
	}
	
	@GetMapping("/case")
	public ModelAndView explanation(@RequestParam(name = "openTabName", required = false) String openTabName, HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		if(openTabName != null) {
			pageDto.setCategory(openTabName);
			mv.addObject("openTabName", openTabName);
		}
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(6);
		pageDto.setBoardTypeCd("B"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> productList = new ArrayList<>();
		productList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("productList", productList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/case");
		
        return mv;
	}
	
	@GetMapping("/support")
	public ModelAndView support(HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(10);
		pageDto.setBoardTypeCd("C"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> noticeList = new ArrayList<>();
		noticeList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("noticeList", noticeList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/support/notice");
		
        return mv;
	}
	
	@GetMapping("/notice")
	public ModelAndView notice(HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(10);
		pageDto.setBoardTypeCd("C"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> noticeList = new ArrayList<>();
		noticeList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("noticeList", noticeList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/support/notice");
		
        return mv;
	}
	
	@GetMapping("/inquiryWrite")
	public ModelAndView inquiry(HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		// 카테고리 리스트 제공
		TypeDto categoryTypeDto = new TypeDto();
		categoryTypeDto.setCategory("CATEGORY");
		List<TypeDto> categoryList = commonSvi.retrieveTypeList(categoryTypeDto);
		
		//Model에 세팅
		mv.addObject("categoryList", categoryList);
		
		String userId = (String) session.getAttribute("userId");
		
		if(userId != null) {
			UserDto user = loginSvi.getUserById(userId);
			if(!user.getUserName().isEmpty()) {
				mv.addObject("user", user);
			}
		}
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/support/inquiryWrite");
		
        return mv;
	}
	
	@GetMapping("/inquiryAdmin")
	public ModelAndView inquiryAdmin(HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(10);
		pageDto.setBoardTypeCd("E"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> inquiryList = new ArrayList<>();
		inquiryList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("inquiryList", inquiryList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/support/inquiryAdmin");
		
        return mv;
	}
	
	@GetMapping("/board")
	public ModelAndView board(HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(10);
		pageDto.setBoardTypeCd("D"); /* A:제품소개, B:적용사례, C:공지사항, D:자료실, E:제품문의 */
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> boardList = new ArrayList<>();
		boardList = boardSvi.selectBoardList(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("boardList", boardList);
		
		keepLocale(session, locale);
		
		//return할 View
		mv.setViewName("/support/board");
		
        return mv;
	}
	
	@GetMapping("/map")
	public String map(HttpSession session, Locale locale) {
		
		keepLocale(session, locale);
		
        return "/support/map";
	}
	
	@GetMapping("/useterms")
	public String useterms(HttpSession session, Locale locale) {
		
		keepLocale(session, locale);
		
        return "/terms/useterms";
	}
	
	@GetMapping("/personal")
	public String personal(HttpSession session, Locale locale) {
		
		keepLocale(session, locale);
		
        return "/terms/personal";
	}
	
	@GetMapping("/searchTag")
	public ModelAndView searchTag(HttpSession session, Locale locale, @RequestParam String searchKeyword) {
		ModelAndView mv = new ModelAndView();
		
		PageDto pageDto = new PageDto();
		String encodedKeyword = "";
		
        try { //hex 문자열 오류 방지
            encodedKeyword = URLEncoder.encode(searchKeyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
		// 초기 페이지 설정
		pageDto.setPageNo(1);
		pageDto.setPageSize(10);
		pageDto.setSearchKeyword(encodedKeyword);
		
		pageDto = boardSvi.selectBoardListTagCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> boardList = new ArrayList<>();
		boardList = boardSvi.selectBoardListTag(pageDto);

		mv.addObject("pageInfo", pageDto);
		mv.addObject("searchKeyword", encodedKeyword);
		mv.addObject("boardList", boardList);
		
		keepLocale(session, locale);
		//return할 View
		mv.setViewName("/searchTag");
		
		return mv;
	}
	
	public void keepLocale(HttpSession session, Locale locale) {
		
		// 크롬에서 ko_KR 형태, Edge에서는 ko
		String localeLanguage = locale.getLanguage();
	
	//	System.out.println("system locale : " + locale);
	//	System.out.println("setting locale : " + localeLanguage);
	
		if(localeLanguage != null) {
			//엣지 브라우저에서 ko 로 locale 기본 제공하므로 변경
			if(localeLanguage.equals("ko")) {
				session.setAttribute("locale", "ko_KR");
			} else if(localeLanguage.equals("en")) {
				session.setAttribute("locale", "en_US");
			} else {
				session.setAttribute("locale", locale);
			}
		} else {
			session.setAttribute("locale", "ko_KR");
		}
	}
}
