<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <link rel="stylesheet" type="text/css" href="./css/board.css">
    <script type="text/javascript" src="./js/board/boardView.js"></script>
</head>
<%@ include file="/WEB-INF/views/layout/subheader_support.jsp" %>
    <div class="container board board_header">
        <div class="board_title">
            <c:out value="[${board.categoryTypeNm}] ${board.title}" />
            <div class="board_info" style="flex-direction:column;">
                <div>
                    <input type="text" id="modiTime" name="modiTime" value="<c:out value='${board.regTime}' />" disabled style="width:100%;">
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full board">

            <span class="title_md margin-0">문의자 정보</span>
            <div class="board_group">
                <div class="width-50 flex-row">
                    <span class="inquiry_title">이름</span>
                    <input type="text" disabled value="<c:out value='${board.writer}'/>" style="width: 100%;">
                </div>
                <div class="width-50 flex-row">
                    <span class="inquiry_title">연락처</span>
                        <input type="text" disabled value="<c:out value='${board.writerPhone}'/>" style="width: 100%;">
                </div>
                <div class="width-50 flex-row">
                    <span class="inquiry_title">회사명</span>
                    <input type="text" disabled value="<c:out value='${board.writerCompany}'/>" style="width: 100%;">
                </div>
                <div class="width-50 flex-row">
                    <span class="inquiry_title">이메일</span>
                        <input type="text" disabled value="<c:out value='${board.writerMail}'/>" style="width: 100%;">
                </div>
            </div>
            
            <input type="hidden" id="boardTypeCd" value="${board.boardTypeCd}"/>
            <div class="board_content">
                ${board.content}
            </div>

            <div class="board_bottom">
                <c:if test="${not empty attachList}">
                    <span class="title_md margin-0"><spring:message code="common.attchFile"/></span>
                    <div class="fileList">
                        <c:forEach items="${attachList }" var="attchFile" varStatus="i">
                            <div class="file">
                                <a class="btn btn-dark" href="/file/download?fileId=${attchFile.fileId}">
                                    <span><i class="fa-solid fa-file-lines"></i>${attchFile.fileNameOrg}</span>
                                    <c:if test="${attchFile.fileExt == 'png' || attchFile.fileExt == 'jpg' || attchFile.fileExt == 'jpeg' || attchFile.fileExt == 'gif' || attchFile.fileExt == 'bmp'}">
                                        <img alt="image file" class="img-thumbnail" src="/file/download?fileId=${attchFile.fileId}">
                                    </c:if>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            
                <c:if test="${not empty user && user.userTypeCd eq '9'}">
                    <div class="board_button">
                        <form id="boardForm" name="boardForm" method="POST" enctype="multipart/form-data">
                            <input type="hidden" id="boardId" name="boardId"value="${board.boardId}"/>
                            <input type="hidden" id="userUid" name="userUid"value="${board.userUid}"/>
                        </form>
                        <input type="button" id="boardDelBtn" class="delBtn" value="<spring:message code='common.del'/>"/>
                    </div>
                </c:if>
            </div>

            <div class="prevNextBoard">
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    <div class="prevBoard">
                        <span class="prevNextTitle">이전 글</span>
                        <c:choose>
                            <c:when test="${not empty prevBoard.boardId}">
                                <a class="prevTitle" href="/boardView?boardId=${prevBoard.boardId}">${prevBoard.title}</a>
                            </c:when>
                            <c:otherwise>
                                <span class="prevNoTitle">이전 글이 없습니다</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="nextBoard">
                        <span class="prevNextTitle">다음 글</span>
                        <c:choose>
                            <c:when test="${not empty nextBoard.boardId}">
                                <a class="nextTitle" href="/boardView?boardId=${nextBoard.boardId}">${nextBoard.title}</a>
                            </c:when>
                            <c:otherwise>
                                <span class="nextNoTitle">다음 글이 없습니다</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <div class="prevBoard">
                        <span class="prevNextTitle">PREV</span>
                        <c:choose>
                            <c:when test="${not empty prevBoard.boardId}">
                                <a class="prevTitle" href="/boardView?boardId=${prevBoard.boardId}">
                                    <c:choose>
                                        <c:when test="${not empty board.titleEng}">
                                            ${prevBoard.titleEng}
                                        </c:when>
                                        <c:otherwise>
                                            ${prevBoard.title}
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <span class="prevNoTitle">There's no previous post</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="nextBoard">
                        <span class="prevNextTitle">NEXT</span>
                        <c:choose>
                            <c:when test="${not empty nextBoard.boardId}">
                                <a class="nextTitle" href="/boardView?boardId=${nextBoard.boardId}">
                                    <c:choose>
                                        <c:when test="${not empty board.titleEng}">
                                            ${nextBoard.titleEng}
                                        </c:when>
                                        <c:otherwise>
                                            ${nextBoard.title}
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <span class="nextNoTitle">There's no next post</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
                <div class="board_icon_area"><a href="/inquiryAdmin"><img src="/img/icon_list.png"></a></div>
            </div>

        </div>
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>