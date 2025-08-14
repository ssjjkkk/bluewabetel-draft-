<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <h2 class="sub_page_title" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">
        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
            <span class="highlight">History</span>
        </c:if>
        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
            <span class="highlight">History</span>
        </c:if>
    </h2>
    <section class="company_contents history main">
        <div class="company_history_contents">
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <img src="/img/img_history1.png" width="450px">
            </div>
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <h3 style="text-align:right;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        2000<br/><span>창업기</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        2000<br/><span>창업기</span>
                    </c:if>
                </h3>
            </div>
            <div class="history_contents">
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <div class="history_line" data-aos="fade" data-aos-duration="2000"></div>
                    <img src="/img/icon_history.png">
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>2000년 6월 BWT 설립 및 R&D 센터(번호 20004510) 설립</li>
                            <li>사용자 요구사항에 기반한 안테나 개발</li>
                            <li>미국으로 리모컨 및 키패드 수출</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>2000년 6월 BWT 설립 및 R&D 센터(번호 20004510) 설립</li>
                            <li>사용자 요구사항에 기반한 안테나 개발</li>
                            <li>미국으로 리모컨 및 키패드 수출</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="company_history_contents center">
            <div class="history_contents left">
                <div class="history_text left" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>ITS(지능형 교통 서비스)용 차량 탑재 안테나</li>
                            <li>ETC(전자 요금 징수) 시스템용 배열 안테나 개발 및 수출용 노변 장비 안테나</li>
                            <li>F-5E/F용 블레이드형 안테나</li>
                            <li>ICS(간섭 제거 서비스)용 고격리 안테나</li>
                            <li>군사용 안테나 (퓨즈/원격측정/GPS)</li>
                            <li>레이더 및 위성 서비스용 고이득 배열 안테나</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>ITS(지능형 교통 서비스)용 차량 탑재 안테나</li>
                            <li>ETC(전자 요금 징수) 시스템용 배열 안테나 개발 및 수출용 노변 장비 안테나</li>
                            <li>F-5E/F용 블레이드형 안테나</li>
                            <li>ICS(간섭 제거 서비스)용 고격리 안테나</li>
                            <li>군사용 안테나 (퓨즈/원격측정/GPS)</li>
                            <li>레이더 및 위성 서비스용 고이득 배열 안테나</li>
                        </c:if>
                    </ul>
                    <div class="history_padding" style="width: 15px; height: 15px; margin-top: 12px; margin-right: 90px;"></div>
                </div>
            </div>
            <div class="history_contents">
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <div class="history_line" data-aos="fade" data-aos-duration="2000"></div>
                    <img src="/img/icon_history.png">
                    <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                        <h3 style="text-align:left;">
                            <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                                2010<span><br/>개발기</span>
                            </c:if>
                            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                                2010<span><br/>개발기</span>
                            </c:if>
                        </h3>
                    </div>
                    <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                        <img src="/img/img_history1.png" width="450px">
                    </div>
                </div>
            </div>
        </div>

        <div class="company_history_contents center">
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <img src="/img/img_history1.png" width="450px">
            </div>
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <h3 style="text-align:right;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        2020<br/><span>성장기</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        2020<br/><span>성장기</span>
                    </c:if>
                </h3>
            </div>
            <div class="history_contents">
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <div class="history_line" data-aos="fade" data-aos-duration="2000"></div>
                    <img src="/img/icon_history.png">
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>사용자 요구사항에 기반한 다중 대역/다중 빔/빔 성형 안테나 개발</li>
                            <li>다양한 유형의 배열 안테나 및 다이폴 안테나 개발</li>
                            <li>일본 모바일 네트워크용 중계기를 위한 고격리 안테나</li>
                            <li>전력 제한기 및 PIN 다이오드 개발</li>
                            <li>RF 모듈: 필터, 어댑터, 저잡음 증폭기(LNA), 결합기/분배기, 고출력 증폭기(HPA) 등</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>사용자 요구사항에 기반한 다중 대역/다중 빔/빔 성형 안테나 개발</li>
                            <li>다양한 유형의 배열 안테나 및 다이폴 안테나 개발</li>
                            <li>일본 모바일 네트워크용 중계기를 위한 고격리 안테나</li>
                            <li>전력 제한기 및 PIN 다이오드 개발</li>
                            <li>RF 모듈: 필터, 어댑터, 저잡음 증폭기(LNA), 결합기/분배기, 고출력 증폭기(HPA) 등</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <div class="company_history_contents end">
            <div class="history_contents left">
                <div class="history_text left no_content" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                </div>
            </div>
            <div class="history_contents">
                <div class="history_text no_content" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                        <h3 style="text-align:left;">
                            <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                                2023
                            </c:if>
                            <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                                2023
                            </c:if>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="company_contents history mobile" style="display: none;">
        <div class="company_history_contents">
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <h3 style="text-align:left;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        2000<span><br/>창업기</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span class="highlight" style="font-size:60px;">2010′s</span><br/>The path that AI Systems walked on
                    </c:if>
                </h3>
                <img src="/img/img_history1.png" width="500px" height="500px">
            </div>
            <div class="history_contents">
                <div class="history_line" data-aos="fade" data-aos-duration="2000"></div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2000</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>2000년 6월 BWT 설립 및 R&D 센터(번호 20004510) 설립</li>
                            <li>사용자 요구사항에 기반한 안테나 개발</li>
                            <li>미국으로 리모컨 및 키패드 수출</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>2000년 6월 BWT 설립 및 R&D 센터(번호 20004510) 설립</li>
                            <li>사용자 요구사항에 기반한 안테나 개발</li>
                            <li>미국으로 리모컨 및 키패드 수출</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="company_history_contents">
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <h3 style="text-align:left;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        2010<span><br/>개발기</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        2010<span><br/>개발기</span>
                    </c:if>
                </h3>
                <img src="/img/img_history2.png" width="500px" height="500px">
            </div>
            <div class="history_contents">
                <div class="history_line" data-aos="fade" data-aos-duration="2000"></div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2010</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>ITS(지능형 교통 서비스)용 차량 탑재 안테나</li>
                            <li>ETC(전자 요금 징수) 시스템용 배열 안테나 개발 및 수출용 노변 장비 안테나</li>
                            <li>F-5E/F용 블레이드형 안테나</li>
                            <li>ICS(간섭 제거 서비스)용 고격리 안테나</li>
                            <li>군사용 안테나 (퓨즈/원격측정/GPS)</li>
                            <li>레이더 및 위성 서비스용 고이득 배열 안테나</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>ITS(지능형 교통 서비스)용 차량 탑재 안테나</li>
                            <li>ETC(전자 요금 징수) 시스템용 배열 안테나 개발 및 수출용 노변 장비 안테나</li>
                            <li>F-5E/F용 블레이드형 안테나</li>
                            <li>ICS(간섭 제거 서비스)용 고격리 안테나</li>
                            <li>군사용 안테나 (퓨즈/원격측정/GPS)</li>
                            <li>레이더 및 위성 서비스용 고이득 배열 안테나</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="company_history_contents2">
            <div class="history_title">
                <h3 style="text-align:left;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        2020<span><br/>성장기</span>
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        2020<span><br/>성장기</span>
                    </c:if>
                </h3>
                <img src="/img/img_history3.png" width="450px">
            </div>
            <div class="history_contents">
                <div class="history_line"></div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2020</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li>사용자 요구사항에 기반한 다중 대역/다중 빔/빔 성형 안테나 개발</li>
                            <li>다양한 유형의 배열 안테나 및 다이폴 안테나 개발</li>
                            <li>일본 모바일 네트워크용 중계기를 위한 고격리 안테나</li>
                            <li>전력 제한기 및 PIN 다이오드 개발</li>
                            <li>RF 모듈: 필터, 어댑터, 저잡음 증폭기(LNA), 결합기/분배기, 고출력 증폭기(HPA) 등</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li>사용자 요구사항에 기반한 다중 대역/다중 빔/빔 성형 안테나 개발</li>
                            <li>다양한 유형의 배열 안테나 및 다이폴 안테나 개발</li>
                            <li>일본 모바일 네트워크용 중계기를 위한 고격리 안테나</li>
                            <li>전력 제한기 및 PIN 다이오드 개발</li>
                            <li>RF 모듈: 필터, 어댑터, 저잡음 증폭기(LNA), 결합기/분배기, 고출력 증폭기(HPA) 등</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>