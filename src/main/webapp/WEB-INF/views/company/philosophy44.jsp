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
        <div class="company_contents philo">
  <div class="philo-ring" aria-hidden="true"></div>

  <div class="philo-center">
    <img src="/img/company/illustration_philo.png" alt="Team collaboration illustration">
  </div>

  <article class="philo-card philo-tl">
    <div class="philo-icon"><img src="/img/company/icon_connect.png" alt=""></div>
    <h3 class="philo-title">Everything’s being connected via Wireless.</h3>
  </article>

  <article class="philo-card philo-tr">
    <div class="philo-icon"><img src="/img/company/icon_growth.png" alt=""></div>
    <h3 class="philo-title">Survival is to increase sales and expand business areas.</h3>
  </article>

  <article class="philo-card philo-bl">
    <div class="philo-icon"><img src="/img/company/icon_people.png" alt=""></div>
    <h3 class="philo-title">Leave people rather than margins(benefits).</h3>
  </article>

  <article class="philo-card philo-br">
    <div class="philo-icon"><img src="/img/company/icon_simple.png" alt=""></div>
    <h3 class="philo-title">Simple is the best.</h3>
  </article>
</div>
</section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>