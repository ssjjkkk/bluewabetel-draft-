<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <section class="company_contents_section">
        <h2 class="sub_page_title" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
            <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                <span class="highlight">Vision</span>
            </c:if>
            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                <span class="highlight">Vision</span>
            </c:if>
        </h2>
        <h2 class="sub_page_subtitle" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
            <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                BWT is good at wave & propagation.<br> (전파(電波)와 전파(傳播)에 강한 기업)
            </c:if>
            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                BWT is good at wave & propagation.<br> (전파(電波)와 전파(傳播)에 강한 기업)
            </c:if>
        </h2>
        <div class="company_contents vision">
          <div class="company_contents_bg" data-aos="fade" data-aos-delay="100" data-aos-duration="1000" style="background-image:url('/img/bg_vision.png')"></div>
          <div class="company_contents_wrapper">
              <div class="company_contents_vision" style="background-image:url('/img/content_vision.png')" data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
          </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>