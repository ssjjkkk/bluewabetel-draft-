<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <section class="company_contents">
        <div class="company_contents_bg" style="background-image:url('/img/bg_company2.png')"></div>
        <div class="company_contents_txt">
            <h2 data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    <span class="highlight">에이아이시스템즈㈜</span>는 음향공진 검사 및 소음진동 검사 전문 기업입니다.
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <span class="highlight">AI Systems</span> is a company specializing in acoustic resonance inspection and noise vibration inspection.
                </c:if>
            </h2>
            <span class="divide_line_vertical" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000"></span>
            <p data-aos="fade-up" data-aos-delay="500" data-aos-duration="1000">
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    에이아이시스템즈(주)는 비파괴 검사 솔루션의 공급을 목적으로 설립된 기업입니다.<br/><br/>
                    자체 기술력을 바탕으로 소음진동 검사 및 음향공진 검사 솔루션을 제공하며,<br/>다양한 고객의 요구에 맞는 최적의 검사 솔루션을 제공합니다.<br/><br/>
                    각종 기계 부품 및 자동차 부품, 그리고 최근에 각광 받고 있는 전기차 모터 및 부품 등의 이상유무를 검사하는 검사솔루션을 개발하여 공급하고 있습니다.<br/>
                    뿐만 아니라 2차전지 분야에서 필요한 비파괴 검사 솔루션도 공급하고 있습니다.<br/><br/>
                    크랙, 이종혼입, 열처리 유무, 가공불량, 조립 불량 등 다양한 불량의 유형들을 빠르게 검사할 수 있습니다.<br/><br/>
                    에이아이시스템즈(주)의 다양한 경험과 기술을 바탕으로 다양한 산업영역으로 사업을 확대하고자 합니다.<br/><br/>
                    많은 관심과 성원을 부탁드립니다.
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    AI Systems Co., Ltd. is a company established for the purpose of supplying non-destructive testing solutions.<br/><br/>
                    Based on its own technology, it provides noise and vibration inspection and acoustic resonance inspection solutions, and provides optimal inspection solutions to meet the needs of various customers.<br/><br/>
                    We have developed and supplied inspection solutions to check for abnormalities in various mechanical and automotive parts and electric vehicle motors and parts that have recently been in the spotlight. 
                    In addition, we are also supplying non-destructive inspection solutions needed in the secondary battery field.<br/><br/>
                    You can quickly inspect various types of defects such as cracks, heterogeneous mixing, heat treatment, poor processing, and poor assembly.<br/>
                    Based on the diverse experiences and technologies of AI Systems Co., Ltd., we would like to expand our business to various industrial areas.<br/><br/>
                    We ask for your interest and support.
                </c:if>
            </p>
            <div class="icon_area">
                <div data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
                    <img src="/img/img_vision1.png">
                    <p>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            자체 개발을 통해<br/>
                            고객의 요구에 최적화된<br/>
                            검사솔루션 제공 <br/>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            Provide inspection solutions optimized for customer needs through self-development
                        </c:if>
                    </p>
                </div>
                <div data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
                    <img src="/img/img_vision2.png">
                    <p>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            소음 진동 분석을 통한<br/>
                            비파괴 검사솔루션 공급
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            Supply non-destructive inspection solution through noise vibration analysis
                        </c:if>
                    </p>
                </div>
                <div data-aos="fade-up" data-aos-delay="600" data-aos-duration="1000">
                    <img src="/img/img_vision3.png">
                    <p>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            기계부품, 모터, 2차전지 등의<br/>
                            분야에 적용할 수 있는<br/>
                            비파괴 검사 솔루션 공급
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            Supply of non-destructive inspection solutions that can be applied to fields such as mechanical parts, motors, and secondary batteries
                        </c:if>
                    </p>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>