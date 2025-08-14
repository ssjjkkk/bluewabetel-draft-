<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/layout/subheader_news.jsp" %>
    <%@ include file="/WEB-INF/views/layout/searchArea.jsp" %>
    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full">
            <input type="hidden" id="openTabName" value="${openTabName}">
            <input type="hidden" id="totalPageCount" value="${pageInfo.totalPageCount}">
            <input type="hidden" id="currentPage">
            <input type="hidden" id="boardType" value="C">
            <input type="hidden" id="category" value="news">

            <div id="news" class="tab-content" style="display: block;">
                <c:if test="${empty newsList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group news">
                    <c:forEach items="${newsList}" var="board">
                        <a href="/boardView?boardId=${board.boardId}">
                            <article class="product_box">
                                <c:if test="${not empty board.thumnailImg}">
                                    <img src="${board.thumnailImg}" style="object-fit: cover; width: 100%; height: 100%;">
                                </c:if>
                                <c:if test="${empty board.thumnailImg}">
                                    <img src="./img/common/noImage.png" style="object-fit: cover; width: 100%; height: 100%;">
                                </c:if>
                                <div class="product_info news">
                                    <h3 class="product_box_title">
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
                                    </h3>
                                    <div class="product_box_subinfo">
                                        <p>
                                            <span class="product_box_date">${board.regTime}</span>
                                        </p>
                                    </div>
                                </div>
                            </article>
                        </a>
                    </c:forEach>
                </div>
            </div>

            <table id="notice" class="tab-content notice_table" style="display: none;">
                <colgroup>
                    <col width="5%">
                    <col>
                    <col width="10%">
                    <col width="5%">
                </colgroup>
                <c:forEach items="${newsList }" var="notice" varStatus="i">
                    <tr>
                        <td>${notice.number}</td>
                        <td><a href="/boardView?boardId=${notice.boardId}">
                            <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                                ${notice.title}
                            </c:if>
                            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                                <c:choose>
                                    <c:when test="${not empty notice.titleEng}">
                                        ${notice.titleEng}
                                    </c:when>
                                    <c:otherwise>
                                        ${notice.title}
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </a></td>
                        <td class="product_box_date">${notice.regTime}</td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#0085CF"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${not empty user && user.userTypeCd eq '9'}">
                <div class="button_area">
                    <a href="/boardWrite" id="boardModBtn" class="subBtn"><spring:message code="common.write"/></a>
                </div>
            </c:if>

            <div id="pagenation_area">
                <!-- 페이지네이션이 여기에 동적으로 업데이트됩니다. -->
            </div>
        </div>
    </div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    
</body>

</html>