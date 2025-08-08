<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <script type="text/javascript" src="./js/login/userlist.js"></script>
</head>
<body>

    <c:if test="${user.userTypeCd > 1}">
        <div id="admin_menu">
            <ul>
                <li><a href="/mypage"><i class="fa-solid fa-user-gear"></i>내 정보</a></li>
                <c:if test="${user.userTypeCd eq 9}">
                    <li><a href="/userlist"><i class="fa-solid fa-users"></i>전체 회원정보</a></li>
                </c:if>
            </ul>
        </div>
    </c:if>
    <section id="user_group">
        <form id="userform" name="userform" method="post" autocomplete="off">
            <h1 class="login_title">회원정보 관리</h1>
            
            <input type="hidden" id="userlistCount" value="${fn:length(userlist)}">
            <table id="user_list">
                <tr>
                    <th>No</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>별명</th>
                    <th>회원등급</th>
                </tr>
                <c:forEach items="${userlist }" var="user" varStatus="i">
                    <tr id="${user.userUid}">
                        <td>${i.count}</td>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userNickName}</td>
                        <td>
                            <input type="hidden" id="userTypeCdTmp${i.count}" name="userTypeCdTmp${i.count}" value="${user.userTypeCd}">
                            <select id="userTypeCd${i.count}" name="userTypeCd${i.count}">
                                <c:forEach items="${userTypeList }" var="userTypeList">
                                    <option value="${userTypeList.typeCd}">${userTypeList.typeCd}(${userTypeList.typeName})</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div class="button_wrap">
                <input type="submit" class="bigLoginBtn" value="회원정보수정">
            </div>
        </form>
    </section>

	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    
</body>

</html>