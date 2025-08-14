package com.bluewavetel.portal.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bluewavetel.common.CommonSvi;
import com.bluewavetel.config.RecaptchaConfig;
import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.FileDto;
import com.bluewavetel.dto.PageDto;
import com.bluewavetel.dto.common.TypeDto;
import com.bluewavetel.portal.login.LoginSvi;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardCtr {
	
	@Autowired
	private CommonSvi commonSvi;
	
	@Autowired
	private BoardSvi boardSvi;
	
	@Autowired
	private LoginSvi loginSvi;
	
    @Value("${file.dir}")
    private String fileDir;
    
	@GetMapping("/loadBoardList")
	@ResponseBody
	public List<BoardDto> loadBoardList(@RequestParam int pageNo, @RequestParam int pageSize, @RequestParam String boardType, @RequestParam String category, @RequestParam String searchKeyword) {
		
		PageDto pageDto = new PageDto();
		
		pageDto.setPageNo(pageNo);
		pageDto.setPageSize(pageSize);
		pageDto.setBoardTypeCd(boardType);
		pageDto.setSearchKeyword(searchKeyword);
		if(!category.equals("All")) {
			pageDto.setCategory(category);
		}
		
		pageDto = boardSvi.selectBoardListCnt(pageDto);
		
		// 모든 뉴스
		List<BoardDto> newsList = new ArrayList<>();
		newsList = boardSvi.selectBoardList(pageDto);

        return newsList;
	}
	
	@GetMapping("/boardView")
	public ModelAndView boardView(@RequestParam String boardId, HttpSession session, Locale locale) {
		
		ModelAndView mv = new ModelAndView();
		BoardDto board = new BoardDto();
		BoardDto prevBoard = new BoardDto();
		BoardDto nextBoard = new BoardDto();
		
		List<String> keywordList = new ArrayList<>();
		List<FileDto> attachList = new ArrayList<>();
		
		if(!boardId.isEmpty()) {
			
			int cnt = boardSvi.updateViewCnt(boardId);
			
			if (cnt > 0) {
				//System.out.println("========== boardId :" + boardId +" viewCnt +1 ==========");
			}
			
			board = boardSvi.selectBoardById(boardId);
			
			if(board != null) {
				if(board.getKeyword() != null) {
					// 키워드 리스트 제공
					String boardKeyword = board.getKeyword();
					keywordList = commonSvi.splitTextByComma(boardKeyword);
					
					//System.out.println("========== Keyword :" + boardKeyword + " ==========");
				}
					
				// 첨부파일 리스트
				attachList = boardSvi.selectBoardFileList(board.getBoardId());
			} else {
				mv.setViewName("/error/404");
				return mv;
			}
			
			//이전글
			prevBoard = boardSvi.selectPreviousBoard(board);
			//다음글
			nextBoard = boardSvi.selectNextBoard(board);
			
		}

		// 메뉴 리스트 제공
		TypeDto boardTypeDto = new TypeDto();
		boardTypeDto.setCategory("BOARD");
		List<TypeDto> menuList = commonSvi.retrieveTypeList(boardTypeDto);
		
		// 카테고리 리스트 제공
		TypeDto categoryTypeDto = new TypeDto();
		categoryTypeDto.setCategory("CATEGORY");
		List<TypeDto> categoryList = commonSvi.retrieveTypeList(categoryTypeDto);
		
		//Model에 세팅
		mv.addObject("menuList", menuList);
		mv.addObject("categoryList", categoryList);
		
		mv.addObject("board", board);
		mv.addObject("keywordList", keywordList);
		mv.addObject("attachList", attachList);
		
		mv.addObject("prevBoard", prevBoard);
		mv.addObject("nextBoard", nextBoard);
		
		// 게시판 타입에 따른 보내줄 화면 결정
		String returnBoardType = board.getBoardTypeCd();
		
		//System.out.println("========== BoardType : " + returnBoardType + " ==========");

		//return할 View
		if("A".equals(returnBoardType)) {
			mv.setViewName("/board/productView");
		} else if ("B".equals(returnBoardType)) {
			mv.setViewName("/board/r&dView");
		} else if ("C".equals(returnBoardType)) {
			mv.setViewName("/board/newsView");
		} else if ("D".equals(returnBoardType)) {
			mv.setViewName("/board/supportView");
		} else if ("E".equals(returnBoardType)) {
			mv.setViewName("/board/inquiryView");
		} else {
			mv.setViewName("/board/boardView");
		}
		
		loginSvi.keepSession(session);
		
		if(locale != null) {
			session.setAttribute("locale", locale);
		}
		
        return mv;
	}
	
	@GetMapping("/boardWrite")
	public ModelAndView boardWriteRedirect(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// 메뉴 리스트 제공
		TypeDto boardTypeDto = new TypeDto();
		boardTypeDto.setCategory("BOARD");
		List<TypeDto> menuList = commonSvi.retrieveTypeList(boardTypeDto);
		
		// 카테고리 리스트 제공
		TypeDto categoryTypeDto = new TypeDto();
		categoryTypeDto.setCategory("CATEGORY");
		List<TypeDto> categoryList = commonSvi.retrieveTypeList(categoryTypeDto);
		
		//Model에 세팅
		mv.addObject("menuList", menuList);
		mv.addObject("categoryList", categoryList);
		
		//return할 View
		mv.setViewName("/board/boardWrite");
		
		loginSvi.keepSession(session);
		
        return mv;
	}
	
    @Value("${recaptcha.secretKey}")
    private String secretKey;
	
	@PostMapping("/boardWrite.do")
	@ResponseBody
	public String boardWrite(@ModelAttribute("boardDto") BoardDto boardDto,
							@RequestParam(name = "g-recaptcha-response", required = false) String recaptchaResponse) throws Exception {
		
		String result = "";

		//온라인 문의인 경우, rechaptcha 확인
		if(boardDto.getBoardTypeCd().equals("E")) {
	        //  [S]리캡차 검증
	        try {
	            RecaptchaConfig.setSecretKey(secretKey);
	            Boolean verify = RecaptchaConfig.verify(recaptchaResponse);

	        // 검증 실패 시
	            if(!verify){
	            	return "false";
	            }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
		}
		
		
		//제품 소개 또는 뉴스 메뉴인 경우 썸네일 처리
		if(boardDto.getBoardTypeCd().equals("A") || (boardDto.getBoardTypeCd().equals("C") && boardDto.getCategoryTypeCd() == 6)) {
			// 썸네일 이미지 파일이 있으면
			if(boardDto.getThumbnailImgFile().getSize() > 0) {
				String thumbnailImgSrc = thumbImageUpload(boardDto.getThumbnailImgFile());
				boardDto.setThumnailImg(thumbnailImgSrc);
			// 없으면 본문에서 추출 
			} else {
				boardDto.setThumnailImg(commonSvi.getThumbnailImgSrc(boardDto.getContent()));
			}
		}
		
		int boardId = boardSvi.insertBoard(boardDto);
		
		if( boardId > 0 ) {
			
			uploadFile(boardDto.getAttachFile0(), boardId, boardDto.getUserUid());
			
			if(boardDto.getAttachFile1() != null) {
				uploadFile(boardDto.getAttachFile1(), boardId, boardDto.getUserUid());
			}
			if(boardDto.getAttachFile2() != null) {
				uploadFile(boardDto.getAttachFile2(), boardId, boardDto.getUserUid());
			}
			
			result = String.valueOf(boardId);

			
			//온라인 문의인 경우, 메일 보내기
			if(boardDto.getBoardTypeCd().equals("E")) {
			
				BoardDto uploadBoard = new BoardDto();
				
				uploadBoard = boardSvi.selectBoardById(result);
				
				commonSvi.sendEmail(uploadBoard);
			}
			
		} else {
			result = "fail"; //실패
		}
		
        return result;
	}
	
	@GetMapping("/boardModify")
	public ModelAndView boardModifyRedirect(@RequestParam String boardId, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		BoardDto board = new BoardDto();
		
		if(!boardId.isEmpty()) {
			board = boardSvi.selectBoardById(boardId);
		}
		
		List<FileDto> attachList = new ArrayList<>();
		
		if(board != null) {
			// 첨부파일 리스트
			attachList = boardSvi.selectBoardFileList(board.getBoardId());
		}
		
		// 메뉴 리스트 제공
		TypeDto boardTypeDto = new TypeDto();
		boardTypeDto.setCategory("BOARD");
		List<TypeDto> menuList = commonSvi.retrieveTypeList(boardTypeDto);
		
		// 카테고리 리스트 제공
		TypeDto categoryTypeDto = new TypeDto();
		categoryTypeDto.setCategory("CATEGORY");
		List<TypeDto> categoryList = commonSvi.retrieveTypeList(categoryTypeDto);
		
		//Model에 세팅
		mv.addObject("menuList", menuList);
		mv.addObject("categoryList", categoryList);
		
		mv.addObject("board", board);
		mv.addObject("attachList", attachList);
		
		//return할 View
		mv.setViewName("/board/boardWrite");
		
		loginSvi.keepSession(session);
		
        return mv;
	}
	
	@PostMapping("/boardModify.do")
	@ResponseBody
	public String boardModify(@ModelAttribute("boardDto") BoardDto boardDto) throws Exception {
		
		String result = "";
		
		// 이전 게시글 정보 조회 
		BoardDto oldBoard = new BoardDto();
		String oldThumb = "";
		
		if(boardDto.getBoardId() > 0) {
			oldBoard = boardSvi.selectBoardById(String.valueOf(boardDto.getBoardId()));
			
			//이전 게시글에서 썸네일 정보 가져오기
			if(oldBoard != null) {
				oldThumb = oldBoard.getThumnailImg();
			}
		}
		
		// 변경하려는 썸네일 이미지 파일이 있으면
		if(boardDto.getThumbnailImgFile().getSize() > 0) {
			String thumbnailImgSrc = thumbImageUpload(boardDto.getThumbnailImgFile());
			boardDto.setThumnailImg(thumbnailImgSrc);
		// 없으면 기존 썸네일 여부를 판단해서 유지하거나, 본문에서 추출 
		} else {
			if(oldThumb == null || (oldThumb != null && oldThumb.equals(""))) {
				boardDto.setThumnailImg(commonSvi.getThumbnailImgSrc(boardDto.getContent()));
			} else if (oldThumb != null) {
				boardDto.setThumnailImg(oldThumb);
			}
		}
		
		int boardId = boardSvi.updateBoard(boardDto);
		
		if( boardId > 0) { //아이디와 비밀번호가 일치하는 데이터가 존재하면
			
			uploadFile(boardDto.getAttachFile0(), boardId, boardDto.getUserUid());
			
			if(boardDto.getAttachFile1() != null) {
				uploadFile(boardDto.getAttachFile1(), boardId, boardDto.getUserUid());
			}
			if(boardDto.getAttachFile2() != null) {
				uploadFile(boardDto.getAttachFile2(), boardId, boardDto.getUserUid());
			}
			
			result = String.valueOf(boardId);
		} else {
			result = "fail"; //실패
		}
		
        return result;
	}
	
	@PostMapping("/boardDelete.do")
	@ResponseBody
	public String boardDelete(@ModelAttribute("boardDto") BoardDto boardDto) throws Exception {
		
		String result = "";
		
		int cnt = boardSvi.deleteBoard(boardDto);
		
		if( cnt > 0) { //아이디와 비밀번호가 일치하는 데이터가 존재하면
			result = "success";
		} else {
			result = "fail"; //실패
		}
		
        return result;
	}
	
	@PostMapping("/imgUpload.do")
	@ResponseBody
    public void imageUpload(HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		
	        // 랜덤 문자 생성
	        UUID uid = UUID.randomUUID();
	        // 날짜 폴더 하위 생성
	        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
	        
	        OutputStream out = null;
	        PrintWriter printWriter = null;
	        
	        //인코딩
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	        
	        try{
	            //파일 이름 가져오기
	            String fileName = upload.getOriginalFilename();
	            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	            
	            byte[] bytes = upload.getBytes();
	            
	            //이미지 경로 생성
	            String path = fileDir + "/ckImage/" + date + "/"; // fileDir는 전역 변수로 이미지 경로 설정
	            System.out.println("file path : "+ path);
	            String ckUploadPath = path + uid + "." + fileExt;
	            File folder = new File(path);
	            
	            //해당 디렉토리 확인
	            if(!folder.exists()){
	                try{
	                    folder.mkdirs(); // 폴더 생성
	                }catch(Exception e){
	                    e.getStackTrace();
	                }
	            }
	            
	            out = new FileOutputStream(new File(ckUploadPath));
	            out.write(bytes);
	            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	            
	            printWriter = response.getWriter();
	            String fileUrl = "/loadImage?date=" + date + "&uid=" + uid  + "." + fileExt;  // 작성화면
	            
	          // 업로드시 메시지 출력
	          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	          printWriter.flush();
	            
	        }catch(IOException e){
	            e.printStackTrace();
	        } finally {
	          try {
		           if(out != null) { out.close(); }
		           if(printWriter != null) { printWriter.close(); }
	          } catch(IOException e) { e.printStackTrace(); }
	        }
	        
	        return;
    }
	
	/**
     * cKeditor 서버로 전송된 이미지 뿌려주기
     * @param uid
     * @param fileName
     * @param request
     * @return
     * @throws ServletException
     * @throws IOException
     */
    //
    @GetMapping("/loadImage")
    public void ckImgSubmit(@RequestParam(value="date") String date
    						, @RequestParam(value="uid") String uid
                            , HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		        //서버에 저장된 이미지 경로
		        String path = fileDir + "/ckImage/" + date + "/";;
		    
		        String sDirPath = path + uid;
		    
		        File imgFile = new File(sDirPath);
		        
	            byte[] buf = new byte[1024];
	            int readByte = 0;
	            int length = 0;
	            byte[] imgBuf = null;
	            
	            FileInputStream fileInputStream = null;
	            ByteArrayOutputStream outputStream = null;
	            ServletOutputStream out = null;
	            
	            try{
			        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
			        if(!imgFile.isFile()){
			        	imgFile = new File(fileDir + "/noImage.png");
			        }
			        
	                fileInputStream = new FileInputStream(imgFile);
	                outputStream = new ByteArrayOutputStream();
	                out = response.getOutputStream();
	                
	                while((readByte = fileInputStream.read(buf)) != -1){
	                    outputStream.write(buf, 0, readByte);
	                }
	                
	                imgBuf = outputStream.toByteArray();
	                length = imgBuf.length;
	                out.write(imgBuf, 0, length);
	                out.flush();
	                
	            }catch(IOException e){
	                // 예외 처리 로직 추가
	                e.printStackTrace();
	            }finally {
	                // 자원 정리를 위한 try-catch 블록
	                try {
	                    if (outputStream != null) outputStream.close();
	                    if (fileInputStream != null) fileInputStream.close();
	                    if (out != null) out.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
    }

    public String thumbImageUpload(MultipartFile upload) throws Exception {
		
		String fileUrl = "";
		
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        // 날짜 폴더 하위 생성
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = fileDir + "/ckImage/" + date + "/"; // fileDir는 전역 변수로 이미지 경로 설정
            String ckUploadPath = path + uid + "." + fileExt;
            System.out.println("==============file path : "+ ckUploadPath +"===========");
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            fileUrl = "/loadImage?date=" + date + "&uid=" + uid + "." + fileExt;  // 작성화면
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
	           if(out != null) { out.close(); }
          } catch(IOException e) { e.printStackTrace(); }
        }
        
        return fileUrl;
}
    

    public boolean uploadFile(MultipartFile upload, int boardId, String userUid) throws Exception {
    	
    	boolean result = false;

        String savaFilePath = "";

        int fileSize = (int) upload.getSize();
        
        // 허용된 MIME 유형 목록
        List<String> allowedMimeTypes = Arrays.asList(
            "image/jpeg", "image/png", "application/pdf", 
            "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation",
            "text/plain", "text/csv"
        );
        
        String mimeType = upload.getContentType();

        if (fileSize > 0 && allowedMimeTypes.contains(mimeType)) {

            String filePath = "";
            
	        // 랜덤 문자 생성
	        UUID randomFileName = UUID.randomUUID();
	        // 날짜 폴더 하위 생성
	        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
	        
            // 파일 업로드 경로 + 현재 년월(월별관리)
            filePath = fileDir + "/attachFile/" + date + "/";

            String realFileName = upload.getOriginalFilename();
            String fileExt = realFileName.substring(realFileName.lastIndexOf(".") + 1).toLowerCase();
            String saveFileName = randomFileName + "." + fileExt;
            String saveFilePath = filePath + File.separator + saveFileName;
            System.out.println("==============file path : "+ saveFilePath +"===========");

            File folder = new File(filePath);

            if (!folder.exists()) {
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            OutputStream out = null;
            
            try{
	        	byte[] bytes = upload.getBytes();
	            File saveFile = new File(saveFilePath);
	
	            // saveFile이 File이면 true, 아니면 false
	            // 파일명이 중복일 경우 파일명(1).확장자, 파일명(2).확장자 와 같은 형태로 생성한다.
	            if (saveFile.isFile()) {
	                boolean _exist = true;
	
	                int index = 0;
	
	                // 동일한 파일명이 존재하지 않을때까지 반복한다.
	                while (_exist) {
	                    index++;
	
	                    saveFileName = randomFileName + "(" + index + ")." + fileExt;
	
	                    String dictFile = filePath + File.separator + saveFileName;
	
	                    _exist = new File(dictFile).isFile();
	
	                    if (!_exist) {
	                        savaFilePath = dictFile;
	                    }
	                }
	
	            } 
                // 생성한 파일 객체를 업로드 처리하지 않으면 임시파일에 저장된 파일이 자동적으로 삭제되기 때문에 transferTo(File f) 메서드를 이용해서 업로드처리한다.
            	//upload.transferTo(saveFile);
            	
            	out = new FileOutputStream(new File(saveFilePath));
                out.write(bytes);
                out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	            
            }catch(IOException e){
                e.printStackTrace();
            } finally {
              try {
    	           if(out != null) { out.close(); }
              } catch(IOException e) { e.printStackTrace(); }
            }

            FileDto boardFile = new FileDto();
		            boardFile.setBoardId(boardId);
		            boardFile.setFileNameOrg(realFileName);
		            boardFile.setFileName(saveFileName);
		            boardFile.setFileSize(fileSize);
		            boardFile.setFileExt(fileExt);
		            boardFile.setFilePath(filePath);
		            boardFile.setRegUserUid(userUid);
		            boardFile.setModiUserUid(userUid);
		            boardFile.setDelYn("N");

            result = boardSvi.saveFile(boardFile);
        }
            
        return result;
    }
    
    @GetMapping("/file/download")
    public void downloadFile(@RequestParam() int fileId, HttpServletResponse response) throws Exception {
    	
            // 파일정보를 조회한다.
            FileDto fileInfo = boardSvi.findFileById(fileId);

            if (fileInfo == null) throw new FileNotFoundException("파일 정보를 찾을수 없습니다.");

            // 경로와 파일명으로 파일 객체를 생성한다.
            File dFile = new File(fileInfo.getFilePath(), fileInfo.getFileName());

            // 파일 길이를 가져온다.
            int fSize = (int) dFile.length();

            // 파일이 존재하면
            if (fSize > 0) {
                // 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
                String encodedFilename = "attachment; filename*=" + "UTF-8" + "''" + URLEncoder.encode(fileInfo.getFileNameOrg(), "UTF-8");

                // ContentType 설정
                response.setContentType("application/octet-stream; charset=utf-8");

                // Header 설정
                response.setHeader("Content-Disposition", encodedFilename);

                // ContentLength 설정
                response.setContentLengthLong(fSize);

                BufferedInputStream in = null;
                BufferedOutputStream out = null;

                /* BufferedInputStream
                 * 
                java.io의 가장 기본 파일 입출력 클래스
                입력 스트림(통로)을 생성해줌
                사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
                속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
                */
                in = new BufferedInputStream(new FileInputStream(dFile));

                /* BufferedOutputStream
                 * 
                java.io의 가장 기본이 되는 파일 입출력 클래스
                출력 스트림(통로)을 생성해줌
                사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
                속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
                */
                out = new BufferedOutputStream(response.getOutputStream());

                try {
                    byte[] buffer = new byte[4096];
                    int bytesRead = 0;

                    /*
				    모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동)
				    int read() : 1byte씩 내용을 읽어 정수로 반환
				    int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장
				    int read(byte[] b. int off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
				    */
                    while ((bytesRead = in .read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }

                    // 버퍼에 남은 내용이 있다면, 모두 파일에 출력					
                    out.flush();
                } finally {
                    /*
                    현재 열려 in,out 스트림을 닫음
                    메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
                     */
                    in .close();
                    out.close();
                }
            } else {
                throw new FileNotFoundException("파일을 찾을수 없습니다.");
            }
    }

    @PostMapping("/file/delete.do")
    @ResponseBody
    public boolean updateFileDelYn(Model model, @RequestParam("deleteFileIdArr") String deleteFileIdArr) throws Exception {
    	
    	boolean result = false;
    	
    	List<String> deleteFileList = commonSvi.splitTextByComma(deleteFileIdArr);
    	
    	for (String deleteFileId : deleteFileList) {
    		result = boardSvi.deleteFile(Integer.parseInt(deleteFileId));
    	}
    	
        return result;
    }


}


