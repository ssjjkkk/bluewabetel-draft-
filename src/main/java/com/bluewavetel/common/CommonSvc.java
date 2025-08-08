package com.bluewavetel.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.bluewavetel.dao.CommonDao;
import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.common.TypeDto;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Repository
public class CommonSvc implements CommonSvi {

    @Autowired
    @Qualifier("commonDAO")
    private CommonDao commonDao;

    @Autowired
    private JavaMailSender mailSender;
	
    /**
     * @return 
     * @Description 부서 리스트 조회
     * @Param 부서 조회 조건(조직식별자, 조직명, 조직전화번호, 조직장식별자, 상위조직식별자, 조직Depth)
     */
    /*
	@Override
	public List<PartDto> retrievePartList(PartDto partDto) {
		
		List<PartDto> partList = new ArrayList<>();
		partList = commonDao.selectList("CommonMapper_selectPartInfo", partDto);
		
		return partList;
	}
	*/
	
    /**
     * @Description 공통유형 리스트 조회
     * @Param 유형 조회 조건(유형코드, 유형명, 유형서열, 사용여부)
     */
	@Override
	public List<TypeDto> retrieveTypeList(TypeDto typeDto) {
		
		List<TypeDto> typeList = new ArrayList<>();
		typeList = commonDao.selectList("CommonMapper_selectTypeInfo", typeDto);
		
		// 조회된 유형리스트가 있으면 로그에 제공
//		if( typeList.size() > 0) {
//	    	System.out.println("=================================== LOG : " + typeDto.getCategory() + " typeList START ====================================");
//				for (int i = 0; i < typeList.size(); i++) {
//					System.out.println(typeDto.getCategory() + ":" + typeList.get(i).getTypeCd() + "/" + typeList.get(i).getTypeName());
//				}
//	    	System.out.println("=================================== LOG : " + typeDto.getCategory() + " typeList END ======================================");
//		}
		
		return typeList;
	}

    /**
     * @Description 문자열 암호화(SHA256)
     * @Param 암호화할 문자열
     * @throws NoSuchAlgorithmException 
     */
	@Override
	public String encryptString(String string) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(string.getBytes());
		String hex = String.format("%064x", new BigInteger(1, md.digest()));
		
		return hex;
	}
	
	@Override
	public List<String> splitTextByComma(String text) {
		
		// 쉼표로 문자열을 분리하여 배열로 변환
        String[] splitArray = null;
        
        if(text != null) {
        	splitArray = text.split(",");
        }
		
		List<String> returnList = Arrays.asList(splitArray);

		return returnList;
	}
	
	@Override
	public String htmlContentToText(String htmlContent) {
		
		String contentToText = "";
		
    	if(htmlContent != null) {
    		
    		/* Content 내용 텍스트로 변환 - HTML 태그, 엔티티(&nbsp;, &#160;) 제거*/
    		contentToText = htmlContent.replaceAll("<[^>]*>", "").replaceAll("&nbsp;", " ").replaceAll("&[a-zA-Z]{1,6};", "").replaceAll("&#[0-9]{1,6};", "");
    	}
    	
    	return contentToText;
	}
	

	@Override
	public String getThumbnailImgSrc(String htmlContent) {
		
		String src = "";
		
    	if(!htmlContent.isEmpty()) {
    		
    		/* 첫 Img태그를 Thumbnail Img 컬럼에 저장 */
    		// img 태그의 src 속성을 찾기 위한 정규 표현식
            Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
            Matcher matcher = pattern.matcher(htmlContent);
            
            // 모든 img 태그의 src 속성 값 찾기
            while (matcher.find()) {
                src = matcher.group(1); // 첫 번째 그룹에 해당하는 src 속성 값
                System.out.println("썸네일 이미지 경로: " + src);
            }
    	}
    	
    	return src;
	}
	
	@Override
    public void sendEmail(BoardDto board) throws MessagingException {
		
		MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        
        // 수신할 메일 주소
        helper.setTo("sjk1523648@gmail.com");
    	helper.setFrom("sjk1523648@gmail.com");  // 문의자 이메일 주소
    	
        helper.setSubject("[온라인문의] " + board.getTitle());
        
        helper.setText("<p>홈페이지를 통하여 접수된 문의입니다.</p>"
        + "<p style='text-decoration:underline;'><a href='http://aisys.gabia.io/boardView?boardId=" + board.getBoardId() + "'>☞ 등록된 문의 보러가기</a></p><br/>"
        + "<p>문의분야 : " + board.getCategoryTypeNm() + "</p><br/>"
        + "<p>문의자 : " + board.getWriter() + "</p>"
        + "<p>회사명 : " + board.getWriterCompany() + "</p>"
        + "<p>연락처 : " + board.getWriterPhone() + "</p>"
        + "<p>이메일 : " + board.getWriterMail() + "</p><br/>"
        + "<p>제목 : " + board.getTitle() + "</p><br/>"
        + "<p>내용 : <br/></p><textarea rows='15' cols='150' style='border:transparent;'>" + board.getContent() + "</textarea><br/>"
        + "<p style='color:gray;'>* 첨부파일이 있는 경우, 홈페이지에서 확인 가능합니다.</p>"
        , true);

        mailSender.send(message);
        
        System.out.println("================== 온라인 문의 접수 메일 전송 ===================");
    }
	
	
}
