<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <link rel="stylesheet" type="text/css" href="./css/board.css">
    <script type="text/javascript" src="./js/board/boardView.js"></script>
</head>

    <div style="height: 90px;"></div>
    <section class="sub_header product">
        <h1 id="h1-product"><spring:message code="Product"/></h1>
        <div class="breadcrumb">
            <ul>
                <li>
                    <a href="/">
                        <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9.93489 0L0.5 8.13759H2.97666V16H7.30098H8.28378H8.51966V10.4177H11.3501V16H11.586H13.355H16.8931V8.13759H19.3698L9.93489 0Z" fill="white"/>
                        </svg>
                    </a>
                </li>
                <li><a href="/product?openTabName=antenna"><spring:message code="product"/></a></li>
                <li id="bc-${board.categoryTypeNm}"><a style="color:white;" href="/product?openTabName=${board.categoryTypeNm}"><spring:message code="${board.categoryTypeNm}"/></a></li>
            </ul>
        </div>
    </section>
    <div class="product_view_wrapper">
        <section class="sub_header_under">
            <nav>
                <ul>
                    <li id="li-antenna"><a href="/product?openTabName=antenna"><spring:message code="Antenna"/></a></li>
                    <li id="li-gps"><a href="/product?openTabName=gps"><spring:message code="GPS"/></a></li>
                    <li id="li-electronic-warfare"><a href="/product?openTabName=electronic-warfare"><spring:message code="Electronic Warfare"/></a></li>
                    <li id="li-oem"><a href="/product?openTabName=oem"><spring:message code="OEM"/></a></li>
                    <li id="li-rf-modules"><a href="/product?openTabName=rf-modules"><spring:message code="RF Modules"/></a></li>
                </ul>
            </nav>
        </section>
        <script type="text/javascript">
            $('#li-'+ '${board.categoryTypeNm}').addClass('active');
        </script>

        <div class="bg_white_comp">
        <div class="container board board_header">
            <div class="board_title">
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    ${board.title}
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <c:choose>
                        <c:when test="${not empty board.titleEng}">
                            ${board.titleEng}
                        </c:when>
                        <c:otherwise>
                            ${board.title}
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <div class="board_info">
                    <div>
                        <span>${board.categoryTypeNm}</span>
                        <input type="text" id="modiTime" name="modiTime" value="<c:out value='${board.regTime}' />" disabled>
                        <span class="board_date"></span>
                        <span class="board_cnt"><i class="fa-solid fa-eye"></i>&nbsp;&nbsp;<c:out value="${board.viewCnt}" /></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content Section -->
        <div class="main-contents">
            <div class="main-full board">
                <c:if test="${not empty board.subTitle}">
                    <div class="board_subtitle">
                        <textarea id="subTitle" disabled rows="2"><c:out value="${board.subTitle}" /></textarea>
                    </div>
                </c:if>
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    <c:if test="${not empty board.productDesc}">
                        <span class="title_md margin-0">제품설명</span>
                        <div class="board_product_desc">
                            <span><c:out value="${board.productDesc}" /></span>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <c:if test="${not empty board.productDescEng}">
                        <span class="title_md margin-0">Product Description</span>
                        <div class="board_product_desc">
                            <span><c:out value="${board.productDescEng}" /></span>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    <div class="board_content">
                        ${board.content}
                    </div>
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <div class="board_content">
                        <c:choose>
                            <c:when test="${not empty board.contentEng}">
                                ${board.contentEng}
                            </c:when>
                            <c:otherwise>
                                ${board.content}
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>

                <div class="board_bottom">
                    <div class="board_keyword">
                        <c:forEach items="${keywordList }" var="keyword" varStatus="i">
                            <c:if test="${not empty keyword}">
                                <span><a href="/searchTag?searchKeyword=${keyword}">${keyword}</a></span>
                            </c:if>
                        </c:forEach>
                    </div>

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

                    <c:if test="${not empty board.url1 || not empty board.url2}">
                        <span class="title_md margin-0">URL</span>
                        <div class="board_url">
                            <c:if test="${not empty board.url1}">
                                <span><i class="fa-solid fa-link"></i>URL :  <a href="${board.url1}" target="_blank">${board.url1}</a></span>
                            </c:if>
                            <c:if test="${not empty board.url2}">
                                <span><i class="fa-solid fa-link"></i>URL :  <a href="${board.url2}" target="_blank">${board.url2}</a></span>
                            </c:if>
                        </div>
                    </c:if>

                    <c:if test="${not empty user && user.userTypeCd eq '9'}">
                        <div class="board_button">
                            <form id="boardForm" name="boardForm" method="POST" enctype="multipart/form-data">
                                <input type="hidden" id="boardId" name="boardId"value="${board.boardId}"/>
                                <input type="hidden" id="userUid" name="userUid"value="${board.userUid}"/>
                            </form>
                            <a href="/boardModify?boardId=${board.boardId}" id="boardModBtn" class="subBtn"><spring:message code="common.mod"/></a>
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
                    <div class="board_icon_area"><a href="/product?openTabName=${board.categoryTypeEngNm}"><img src="/img/icon_list.png"></a></div>
                </div>

            </div>
        </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>