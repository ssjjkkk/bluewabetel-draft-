<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
<section class="sub_header">
    <h1 id="h1" style="color:#0085CF;">#${searchKeyword}</h1>
</section>

    <section class="company_contents">
        <div class="company_contents_board">
            <input type="hidden" id="totalPageCount" value="${pageInfo.totalPageCount}">
            <input type="hidden" id="currentPage">
            <input type="hidden" id="boardType" value="">
            <input type="hidden" id="category" value="All">
            <table id="notice_list">
                <colgroup>
                    <col width="10%">
                    <col>
                    <col width="10%">
                    <col width="5%">
                </colgroup>
                <c:forEach items="${boardList }" var="board" varStatus="i">
                    <tr>
                        <td>${board.boardTypeNm}</td>
                        <td><a href="/boardView?boardId=${board.boardId}">
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
                        </a></td>
                        <td class="product_box_date">${board.regTime}</td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#0085CF"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
            
        <c:if test="${not empty user && user.userTypeCd eq '9'}">
            <div class="button_area">
                <a href="/boardWrite" id="boardModBtn" class="subBtn"><spring:message code="common.write"/></a>
            </div>
        </c:if>

        <div id="pagenation_area">
            <!-- 페이지네이션이 여기에 동적으로 업데이트됩니다. -->
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>