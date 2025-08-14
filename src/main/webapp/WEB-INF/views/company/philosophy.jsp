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
                <span class="highlight">Philosophy</span>
            </c:if>
            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                <span class="highlight">Philosophy</span>
            </c:if>
        </h2>
        <div class="company_contents">
          <div class="company_contents_bg_philo" style="background-image:url('/img/회사소개.png')">
            <article class="philo-card philo-tl" data-aos="fade" data-aos-delay="200" data-aos-duration="1000">
              <div class="philo-icon"><img src="/img/회사소개1.png" alt=""></div>
              <h3 class="philo-title">Everything’s being connected via Wireless.</h3>
            </article>

            <article class="philo-card philo-tr" data-aos="fade" data-aos-delay="400" data-aos-duration="1000">
              <div class="philo-icon"><img src="/img/회사소개2.png" alt=""></div>
              <h3 class="philo-title">Survival is to increase sales and expand business areas.</h3>
            </article>

            <article class="philo-card philo-bl" data-aos="fade" data-aos-delay="600" data-aos-duration="1000">
              <div class="philo-icon"><img src="/img/회사소개3.png" alt=""></div>
              <h3 class="philo-title">Leave people rather than margins(benefits).</h3>
            </article>

            <article class="philo-card philo-br" data-aos="fade" data-aos-delay="800" data-aos-duration="1000">
              <div class="philo-icon"><img src="/img/회사소개4.png" alt=""></div>
              <h3 class="philo-title">Simple is the best.</h3>
            </article>
          </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>