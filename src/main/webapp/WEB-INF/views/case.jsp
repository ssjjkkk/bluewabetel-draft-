<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
<body>
    <section class="subpage_header">
        <div class="breadcrumb">
            <ul>
                <li><a href="/">
                    <svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 -960 960 960" width="18px" fill="#C9C9C9"><path d="M240-200h147.69v-235.38h184.62V-200H720v-360L480-741.54 240-560v360Zm-40 40v-420l280-211.54L760-580v420H532.31v-235.38H427.69V-160H200Zm280-310.77Z"/></svg>
                </a></li>
                <li><a href="/case?openTabName=Inspection"><spring:message code="case"/></a></li>
                <li id="bc"><spring:message code="inspection"/></li>
            </ul>
        </div>
        <h1 id="h1"><spring:message code="inspection"/></h1>

        <input type="hidden" id="openTabName" value="${openTabName}">
        <div class="subpage_category">
            <button type="button" id="tab-Inspection" class="tab-link" onclick="window.location.href='/case?openTabName=Inspection'"><spring:message code="inspection"/></button>
            <button type="button" id="tab-Analyzer" class="tab-link" onclick="window.location.href='/case?openTabName=Analyzer'"><spring:message code="analyzer"/></button>
            <button type="button" id="tab-Sensor" class="tab-link" onclick="window.location.href='/case?openTabName=Sensor'"><spring:message code="sensor"/></button>
            <button type="button" id="tab-Etc" class="tab-link" onclick="window.location.href='/case?openTabName=Etc'"><spring:message code="etc"/></button>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/layout/searchArea.jsp" %>

    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full">
            <input type="hidden" id="totalPageCount" value="${pageInfo.totalPageCount}">
            <input type="hidden" id="currentPage">
            <input type="hidden" id="boardType" value="B">
            <input type="hidden" id="category" value="Inspection">

            <div id="Inspection" class="tab-content" style="display: block;">
                <c:if test="${empty productList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group2">
                    <c:forEach items="${productList }" var="board">
                        <c:if test="${board.categoryTypeEngNm eq 'Inspection'}">
                            <a href="/boardView?boardId=${board.boardId}">
                                <article class="product_box" style="background-image:url(${board.thumnailImg});">
                                    <div class="product_info">
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
                                            <p><span class="product_box_date">${board.regTime}</span>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa-solid fa-eye"></i>&nbsp;&nbsp;${board.viewCnt}</p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                                        </div>
                                    </div>
                                </article>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div id="Analyzer" class="tab-content" style="display: none;">
                <c:if test="${empty productList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group2">
                    <c:forEach items="${productList }" var="board">
                        <c:if test="${board.categoryTypeEngNm eq 'Analyzer'}">
                            <a href="/boardView?boardId=${board.boardId}">
                                <article class="product_box" style="background-image:url(${board.thumnailImg});">
                                    <div class="product_info">
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
                                            <p><span class="product_box_date">${board.regTime}</span>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa-solid fa-eye"></i>&nbsp;&nbsp;${board.viewCnt}</p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                                        </div>
                                    </div>
                                </article>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div id="Sensor" class="tab-content" style="display: none;">
                <c:if test="${empty productList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group2">
                    <c:forEach items="${productList }" var="board">
                        <c:if test="${board.categoryTypeEngNm eq 'Sensor'}">
                            <a href="/boardView?boardId=${board.boardId}">
                                <article class="product_box" style="background-image:url(${board.thumnailImg});">
                                    <div class="product_info">
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
                                            <p><span class="product_box_date">${board.regTime}</span>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa-solid fa-eye"></i>&nbsp;&nbsp;${board.viewCnt}</p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                                        </div>
                                    </div>
                                </article>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div id="Etc" class="tab-content" style="display: none;">
                <c:if test="${empty productList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group2">
                    <c:forEach items="${productList }" var="board">
                        <c:if test="${board.categoryTypeEngNm eq 'Etc'}">
                            <a href="/boardView?boardId=${board.boardId}">
                                <article class="product_box" style="background-image:url(${board.thumnailImg});">
                                    <div class="product_info">
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
                                            <p><span class="product_box_date">${board.regTime}</span>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa-solid fa-eye"></i>&nbsp;&nbsp;${board.viewCnt}</p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                                        </div>
                                    </div>
                                </article>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            
            <c:if test="${not empty user && user.userTypeCd eq '9'}">
                <div class="button_area">
                    <a href="/boardWrite" id="boardModBtn" class="subBtn"><spring:message code="common.write"/></a>
                </div>
            </c:if>

            <div id="pagenation_area">
                <!-- 페이지네이션이 여기에 동적으로 업데이트됩니다. -->
            </div>

            <div class="box_support" data-aos="fade" data-aos-duration="1000" style="margin-bottom:50px;">
                <span><spring:message code="ask.title"/></span>
                <p><spring:message code="ask.subtitle"/></p>
                <a href="/inquiryWrite"><spring:message code="ask.button"/></a>
                <img src="/img/bg_dropdown.png">
            </div>
        </div>
    </div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    
</body>

</html>