<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/layout/footer.css">
</head>

    <!-- Footer Section -->
    <footer class="footer">
        <input type="hidden" id="slang" value="${locale}">
        <div class="container">
              <div class="footer_title">
                <div class="footer_company_wrapper">
                    <span class="footer_company_name"><spring:message code="company.name"/><c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">(주)</c:if></span>
                    <div class="footer_content_wrapper">
                      <a><spring:message code="Contact Us"/></a>
                      <span> | </span>
                      <a><spring:message code="Privacy Policy"/></a>
                    </div>
                </div>
                <div class="footer_company_wrapper">
                    <div class="footer_company_info">
                        <div class="footer_column_wrapper">
                          <span class="footer_company_info_title"><spring:message code="COMPANY"/></span>
                          <span class="footer_company_info_content"><spring:message code="17, Techno 4-ro, Yuseong-gu, Daejeon, Republic of Korea"/></span>
                          <div style="width: 100%;">
                            <span class="footer_company_info_content"><spring:message code="Tel  +82 42 864 0283"/></span>&nbsp;|&nbsp;
                            <span class="footer_company_info_content"><spring:message code="E-mail  bwt@bluewavetel.com"/></span>
                          </div>
                        </div>
                        <div class="footer_column_wrapper">
                          <span class="footer_company_info_title"><spring:message code="FACTORY"/></span>
                          <span class="footer_company_info_content"><spring:message code="41-2, Geumo-daero 20-gil, Gumi-si,"/></span>
                          <span class="footer_company_info_content"><spring:message code="Gyeongsangbuk-do, Republic of Korea"/></span>
                        </div>
                    </div>
                    <div class="copyright">
                        <a href="/"><img class="footer_logo" src="./img/footer_logo.png"/></a>
                        <span class="footer_copyright_text">Copyright (c) <spring:message code="company.nameEng"/> All rights reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script type="text/javascript" src="./js/common_func.js"></script>
</body>
</html>