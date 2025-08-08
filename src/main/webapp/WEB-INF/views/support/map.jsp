<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_support.jsp" %>
    <div class="sub-hero" style="background-image:url('/img/bg_header.png')"></div>
    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full board-write" style="padding-top:70px;">
            <!-- * 카카오맵 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1716750978810" class="root_daum_roughmap root_daum_roughmap_landing" style="max-width: 100%;"></div>

            <!--
                2. 설치 스크립트
                * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
            -->
            <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
                new daum.roughmap.Lander({
                    "timestamp" : "1716750978810",
                    "key" : "2jfyr",
                    "mapWidth" : "1300",
                    "mapHeight" : "400"
                }).render();
            </script>
            <div class="map_info">
                <p>
                    <span class="map_title"><i class="fa-solid fa-map-location"></i>&nbsp;&nbsp;&nbsp;<spring:message code="common.address"/></span><spring:message code="company.address"/>
                </p>
                <p>
                    <span class="map_title"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;&nbsp;<spring:message code="common.tel"/></span><spring:message code="company.tel"/>
                </p>
                <p>
                    <span class="map_title"><i class="fa-solid fa-fax"></i>&nbsp;&nbsp;&nbsp;<spring:message code="common.fax"/></span><spring:message code="company.fax"/>
                </p>
                <p>
                    <span class="map_title"><i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;&nbsp;<spring:message code="common.email"/></span><spring:message code="company.email"/>
                </p>
                <p>
                    <span class="map_title"><i class="fa-solid fa-home"></i>&nbsp;&nbsp;&nbsp;<spring:message code="common.homepage"/></span><spring:message code="company.homepage"/>
                </p>
            </div>
        </div>
    </div>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>