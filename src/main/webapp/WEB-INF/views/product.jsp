<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/layout/subheader_product.jsp" %>
    <%@ include file="/WEB-INF/views/layout/searchArea.jsp" %>
    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full">
            <input type="hidden" id="openTabName" value="${openTabName}">
            <input type="hidden" id="totalPageCount" value="${pageInfo.totalPageCount}">
            <input type="hidden" id="currentPage">
            <input type="hidden" id="boardType" value="A">
            <input type="hidden" id="category" value="antenna">

            <div id="antenna" class="tab-content" style="display: block;">
                <c:if test="${empty productList}">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span style="display:inline-block;width:100%;text-align:center;">There are no posts.</span>
                    </c:if>
                </c:if>
                <div class="product_group">
                    <c:forEach items="${productList }" var="board">
                        <c:if test="${board.categoryTypeEngNm eq 'antenna'}">
                            <a href="/boardView?boardId=${board.boardId}">
                                <article class="product_box">
                                    <c:if test="${not empty board.thumnailImg}">
                                        <img src="${board.thumnailImg}" width="100%">
                                    </c:if>
                                    <c:if test="${empty board.thumnailImg}">
                                        <img src="./img/common/noImage.png" width="100%">
                                    </c:if>
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
                                            <p>${board.subTitle}</p>
                                        </div>
                                    </div>
                                </article>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!-- 추가 제품 카테고리 넣기 --!>
            
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