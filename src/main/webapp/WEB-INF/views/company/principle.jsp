<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <section class="company_contents">
        <div class="company_contents_bg" style="background-image:url('/img/bg_company3.jpeg')"></div>
        <div class="company_contents_txt">
            <div class="icon_area">
                <div data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <img src="/img/img_principle1.png">
                        <p>
                            최신의 음향공진 비파괴<br/>
                            검사 장비와 기술을 통해<br/>
                            고객에게 정확하고 효과적인<br/>
                            서비스를 제공합니다.
                        </p>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <img src="/img/img_principle1_en.png">
                        <p>
                            Accurate and effective service is provided to customers through the latest acoustic resonance non-destructive inspection equipment and technology.
                        </p>
                    </c:if>
                </div>
                <div data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <img src="/img/img_principle2.png">
                        <p>
                            고객의 요구를 항상 우선시하며,<br/>
                            신속하고 효율적인 서비스로<br/>
                            최상의 만족을 제공합니다.
                        </p>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <img src="/img/img_principle2_en.png">
                        <p>
                            We always prioritize our customers' needs and provide the best satisfaction with quick and efficient service.
                        </p>
                    </c:if>
                </div>
                <div data-aos="fade-up" data-aos-delay="600" data-aos-duration="1000">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <img src="/img/img_principle3.png">
                        <p>
                            우리는 비파괴 검사 전문가들로<br/>
                            구성된 팀을 보유하고 있으며,<br/>
                            경험과 지식을 바탕으로<br/>
                            고객의 요구사항을 충족시킵니다.
                        </p>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <img src="/img/img_principle3_en.png">
                        <p>
                            We have a team of non-destructive testing experts, and based on our experience and knowledge, we meet our customers' requirements.
                        </p>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>