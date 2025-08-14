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
                <span class="highlight">Mission</span>
            </c:if>
            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                <span class="highlight">Mission</span>
            </c:if>
        </h2>
        <div class="company_contents">
          <div class="company_contents_bg mission" data-aos="fade" data-aos-delay="100" data-aos-duration="1000"></div>
          <div class="company_contents_wrapper">
              <h2 class="h2_mission" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
                  <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                      Provide competitiveness in industry-leading wireless system and services through cutting edge RF and antenna.
                  </c:if>
                  <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                      Provide competitiveness in industry-leading wireless system and services through cutting edge RF and antenna.
                  </c:if>
              </h2>
            <!--<div class="company_contents_txt">--!>
            </div>
          </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>