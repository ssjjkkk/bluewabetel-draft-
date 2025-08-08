<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/board.css">
    <script type="text/javascript" src="./js/board/inquiryWrite.js"></script>
    <!-- CK Editor 4-->
    <script type="text/javascript" src="./js/ckeditor4/ckeditor.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_support.jsp" %>
    <div class="sub-hero" style="background-image:url('/img/bg_header.png')"></div>
    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full board-write">
            <form id="boardForm" name="boardForm" action="/boardWrite.do" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="boardTypeCd" name="boardTypeCd" value="E">

                <span class="title_md margin-0" style="margin-top:70px !important;"><spring:message code="ask.title.category"/><span class="essential_mark">*</span></span>
                <div class="board_group">
                    <input type="hidden" id="categoryTypeCd" name="categoryTypeCd"/>
                    <c:forEach items="${categoryList }" var="category" varStatus="i">
                        <input type="radio" id="categoryTypeCheck${i.count}" name="categoryType" value="${category.typeCd}"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <label for="categoryTypeCheck${i.count}">${category.typeName}</label>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <label for="categoryTypeCheck${i.count}">${category.typeEngName}</label>
                        </c:if>
                    </c:forEach>
                </div>

                <span class="title_md margin-0"><spring:message code="ask.title.person"/></span>
                <div class="board_group">
                    <div class="width-50 flex-row">
                        <span class="inquiry_title"><spring:message code="common.name"/></span>
                        <input type="text" id="writer" name="writer" placeholder="이름을 입력해주세요" value=""/>
                    </div>
                    <div class="width-50 flex-row">
                        <span class="inquiry_title"><spring:message code="common.phone"/><span class="essential_mark">*</span></span>
                        <input class="phone-input" type="text" id="writerPhone" name="writerPhone" placeholder="연락처를 입력해주세요" value=""/>
                    </div>
                    <div class="width-50 flex-row">
                        <span class="inquiry_title"><spring:message code="common.duty"/></span>
                        <input type="text" id="writerCompany" name="writerCompany" placeholder="회사명을 입력해주세요" value=""/>
                    </div>
                    <div class="width-50 flex-row">
                        <span class="inquiry_title"><spring:message code="common.email"/><span class="essential_mark">*</span></span>
                        <input type="text" id="writerMail" name="writerMail" placeholder="이메일을 입력해주세요" value=""/>
                    </div>
                </div>
                
                <span class="title_md margin-0"><spring:message code="ask.title.content"/></span>
                <div class="board_group">
                    <div class="width-100 flex-row">
                        <span class="inquiry_title"><spring:message code="common.title"/><span class="essential_mark">*</span></span>
                        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="${board.title}"/>
                    </div>
                    <div class="width-100 flex-row">
                        <span class="inquiry_title title_md"><spring:message code="common.content"/></span>
                        <div class="width-100 flex-row">
                            <textarea name="content" id="content" style="width:100%;" rows="10" placeholder="문의 내용을 입력해주세요"></textarea>
                        </div>
                    </div>
                    <div class="width-100 flex-row">
                        <span class="inquiry_title title_md"><spring:message code="common.attchFile"/></span>

                        <div id="fileDiv">
                            <div class="multipleFile">
                                <input type="file" class="file-input" id="attachFile0" name="attachFile0" accept="image/*,application/pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="board_info">
                    <div>
                        <input type="hidden" id="userUid" name="userUid" value="999999">
                        <input type="hidden" id="mainYn" name="mainYn" value="N">
                        <input type="hidden" id="modiTime" name="modiTime" class="board_date" value="">
                    </div>
                </div>

                <article class="terms_wrap">
                    <label class="terms2">
                        <div class="term_check confirm_message">
                            <div class="check-box-zone" style="margin-bottom: 10px;">
                                <input type="checkbox" value="true" name="agree2" id="agree2" required="">
                                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                                    <label for="agree2" class="agree-text"><a href="/personal" target="_blank">개인정보 수집 및 이용</a>에 동의합니다.</label><br/>
                                    <span style="color:#aaa;font-size:15px;">본 사이트는 개인정보에 대하여 문의 접수 및 회신 용도로만 사용합니다..</span>
                                </c:if>
                                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                                    <label for="agree2" class="agree-text">I agree to <a href="/personal" target="_blank" style="text-decoration:underline;">collect and use personal information.</a></label><br/>
                                    <span style="color:#aaa;font-size:15px;">This site is only used for receiving and responding to inquiries about personal information.</span>
                                </c:if>
                            </div>
                        </div>
                    </label>
                    <div style="display:inline-flex;margin-top:20px;">
                        <script src="https://www.google.com/recaptcha/api.js"></script>
                        <div id="grecaptcha" class="g-recaptcha" data-sitekey="6LdLrvcpAAAAALiAt24NiuQDt3Hw22pU-NMfgSTf"></div>
                    </div>
                </article>
                
                <input type="hidden" id="delYn" name="delYn" value="N"/>
                <span class="board_button"><input type="submit" id="boardNewBtn" class="bigLoginBtn" value="<spring:message code='ask.button'/>"></span>
        </form>

        </div>
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>