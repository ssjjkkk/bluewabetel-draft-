<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <!-- Main Content Section -->
    <section class="company_contents">
        <div class="company_contents_bg" style="background-image:url('/img/bg_company5.jpeg')"></div>
        <div class="company_contents_txt" style="padding:70px 160px;">
            <div class="certified_category" data-aos="fade" data-aos-delay="200" data-aos-duration="600">
                <ul>
                    <li><button type="button" id="tab-Patent" class="tab-link active" onclick="openTab('tab-Patent')"><spring:message code="patent"/></button></li>
                    <li>•</li>
                    <li><button type="button" id="tab-Certificate" class="tab-link" onclick="openTab('tab-Certificate')"><spring:message code="certificate"/></button></li>
                </ul>
            </div>

            <div id="Patent" class="tab-content" style="display: block;" data-aos="fade" data-aos-delay="400" data-aos-duration="1000">
                <div class="patent_group">
                    <div class="patent_group_area">
                        <img src="/img/img_patent1.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">고유진동수 분석시스템</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Natural frequency analysis system</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_patent2.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">센서 홀딩 장치</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Sensor holding device</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_patent3.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">실린더 내부 이물질 검사 장치</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Inspection device for Floor inside cylinder</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_patent4.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">원통형 오토 임팩트 해머링장치</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Cylindrical auto impact hammering device</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_patent5.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">일방향 로테이션 툴</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">One-way Rotation Tool</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_patent6.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">고유 진동수 측정 장치</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Natural frequency measuring device</span>
                        </c:if>
                    </div>
                </div>
            </div>

            <div id="Certificate" class="tab-content" style="display: none;" data-aos="fade" data-aos-delay="200" data-aos-duration="1000">
                <div class="patent_group">
                    <div class="patent_group_area">
                        <img src="/img/img_cert1.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">ISO 9001 인증서</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">ISO 9001 Certificate</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_cert2.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">신뢰성(R) 인증서</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Reliability(R) Certificates</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_cert3.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">벤처기업 인증서</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Certificate of venture company</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_cert4.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">음향 공진 비파괴 검사장치의 검출센서 조립 구조</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Detection sensor aggregation structure of Acoustic reson</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_cert5.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">중소기업 확인서</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Small and Medium-sized enterprise confirmation letter</span>
                        </c:if>
                    </div>
                    <div class="patent_group_area">
                        <img src="/img/img_cert6.jpg" style="max-width:220px;"/>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <span class="patent_group_txt">기업부설연구소 인정서</span>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <span class="patent_group_txt">Certificate of Accreditation to the Corporate Affiliated Research Institute</span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>