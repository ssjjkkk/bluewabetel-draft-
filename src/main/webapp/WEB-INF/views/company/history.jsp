<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <section class="company_contents">
        <div class="header_bg" style="background-image:url('/img/bg_company4.png')">
            <h3 style="color:white;" data-aos="fade-up" data-aos-duration="2000">
                <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                    <span class="highlight">에이아이시스템즈</span>는 끝없는 변화와 도전을 두려워하지 않고,<br/>
                    지속적인 혁신과 성장을 통해 더 나은 가치를 창출해 나갈 것입니다.
                </c:if>
                <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                    <span class="highlight">AI Systems</span> is not afraid of endless changes and challenges,<br/>
                    and will continue to innovate and grow to create better value.
                </c:if>
            </h3>
        </div>
        <div class="company_history_contents">
            <div class="history_title" data-aos="fade-up" data-aos-duration="1000">
                <h3 style="text-align:left;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span class="highlight" style="font-size:60px;">2010′s</span><br/>에이아이시스템즈가 걸어온 길
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
                    <p class="history_year">2013</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">01</span>에이아이시스템즈㈜ 설립</li>
                            <li><span class="history_month">07</span>중기청 개발사업 선정(자동차 DISC FRF 분석기 개발)</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">01</span>Establishment of AI Systems Co., Ltd</li>
                            <li><span class="history_month">07</span>Selection of the Small and Medium Business Administration Development Project (Development of automobile DISC FRF analyzer)</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2014</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">05</span>특허등록(센서홀딩장치, 고유진동수 분석시스템)</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">05</span>Patent registration (sensor holding device, natural frequency analysis system)</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2015</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">05</span>인천대학교 기술지주 자회사 편입</li>
                            <li><span class="history_month">08</span>자동화 사업부 신설</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">05</span>Incorporation of Incheon National University's technology holding subsidiary</li>
                            <li><span class="history_month">08</span>Establishment of Automation Business Department</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2016</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">01</span>본사 이전(대전 유성구 관평동)</li>
                            <li><span class="history_month">03</span>기업부설 연구소 설립(비파괴검사 연구소)</li>
                            <li><span class="history_month">09</span>2016 국제 자동화 정밀기기 전시회 참가</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">01</span>Relocation of the headquarters (Gwanpyeong-dong, Yuseong-gu, Daejeon)</li>
                            <li><span class="history_month">03</span>Establishment of a corporate research institute (Non-destructive Testing Laboratory)</li>
                            <li><span class="history_month">09</span>Participation in the 2016 International Automation Precision Equipment Exhibition</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2017</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">02</span>벤처기업 등록</li>
                            <li><span class="history_month">11</span>2017 벤처창업 페스티벌 참가</li>
                            <li><span class="history_month">12</span>특허등록(원통형 오토 임팩트 해머링 장치)</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">02</span>Venture Business Registration</li>
                            <li><span class="history_month">11</span>2017 Participation in the Venture Start-up Festival</li>
                            <li><span class="history_month">12</span>Patent registration (Cylindrical auto impact hammering device)</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2018</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">01</span>2018 자동차 경량화 기술산업전 참가</li>
                            <li><span class="history_month">05</span>산업용 가속도 센서, 힘 센서 런칭</li>
                            <li><span class="history_month">05</span>오토해머 신뢰성 인증(R인증) 획득(국내최초)</li>
                            <li><span class="history_month">12</span>자동차 브레이크 디스크 FRF 검사기 미국 수출</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">01</span>Participation in the 2018 Automobile Lightweight Technology Industry Exhibition</li>
                            <li><span class="history_month">05</span>Industrial Acceleration Sensor Launches Force Sensor</li>
                            <li><span class="history_month">05</span>Acquired Autohammer Reliability Certification (R Certification) (First in Korea)</li>
                            <li><span class="history_month">12</span>Car Brake Disc FRF Inspectors Exported to U.S</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2019</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">01</span>2019 자동차 경량화 기술산업전 참가</li>
                            <li><span class="history_month">03</span>Automotive testing expo 2019 참가</li>
                            <li><span class="history_month">04</span>오토 임팩트 해머링 장치 특허 등록</li>
                            <li><span class="history_month">06</span>음향공진 포터블 검사기 출시</li>
                            <li><span class="history_month">12</span>공공연구기관 기술이전 성과확산대전 참가</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">01</span>2019 Participation in the Automobile Lightweight Technology Industry Exhibition</li>
                            <li><span class="history_month">03</span>Automotive testing expo 2019 Participation</li>
                            <li><span class="history_month">04</span>Patent Registration for Auto Impact Hammering Devices</li>
                            <li><span class="history_month">06</span>Sound Resonant Portable Inspection Machine Launched</li>
                            <li><span class="history_month">12</span>Public research institutes participate in a competition to spread the results of technology transfer</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="company_history_contents2">
            <div class="history_title">
                <h3 style="text-align:left;">
                    <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                        <span class="highlight" style="font-size:60px;">2020′s</span><br/>다양한 산업영역 사업확대
                    </c:if>
                    <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                        <span class="highlight" style="font-size:60px;">2020′s</span><br/>Expansion of business<br/>in various industrial sectors
                    </c:if>
                </h3>
                <img src="/img/img_history2.png" width="500px" height="500px">
            </div>
            <div class="history_contents">
                <div class="history_line"></div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2020</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">02</span>ExpoManufactura 2020 참가 (멕시코)</li>
                            <li><span class="history_month">07</span>브레이크 디스크 FRF 수출 (미국 브렘보)</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">02</span>Participation in ExpoManufactura 2020 (Mexico)</li>
                            <li><span class="history_month">07</span>Brake Disc FRF Export (Brembo, USA)</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2021</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">01</span>특허등록(음향공진 비파괴 검사장치의 검출센서 조립구조)</li>
                            <li><span class="history_month">03</span>본사 이전(대전 ▶ 의왕)</li>
                            <li><span class="history_month">08</span>특허등록(벨트장력 측정장치)</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">01</span>Patent registration (detection sensor assembly structure of acoustic resonance non-destructive inspection device)</li>
                            <li><span class="history_month">03</span>Relocation of headquarters (Daejeon ▶ Uiwang)</li>
                            <li><span class="history_month">08</span>Patent registration (belt tension measurement device)</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2022</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">10</span>Dton 2022 한국산업대전 출품</li>
                            <li><span class="history_month">11</span>SMATEC 2022 전시회 출품</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">10</span>Dton 2022 Exhibit to the Korea Industrial Exhibition</li>
                            <li><span class="history_month">11</span>SMATEC 2022 Exhibition entry</li>
                        </c:if>
                    </ul>
                </div>
                <div class="history_text" data-aos="fade-up" data-aos-delay="50" data-aos-easing="ease-in-out" data-aos-duration="600">
                    <img src="/img/icon_history.png">
                    <p class="history_year">2023</p>
                    <ul>
                        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
                            <li><span class="history_month">03</span>초음파 혼 크랙 검사기 출시</li>
                            <li><span class="history_month">04</span>BUTECH 2023 부산 국제 기계대전 출품</li>
                            <li><span class="history_month">05</span>가속도 센서 고정용 홀더 특허등록</li>
                            <li><span class="history_month">07</span>mta Vietnam 2023 (베트남 호치민)전시회 출품</li>
                            <li><span class="history_month">07</span>모터 노이즈 검사기 출시</li>
                            <li><span class="history_month">11</span>SMATEC 2023 전시회 출품</li>
                        </c:if>
                        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
                            <li><span class="history_month">03</span>Ultrasonic Horn Crack Inspection Machine Launched</li>
                            <li><span class="history_month">04</span>BUTECH 2023 Busan International Mechanical Exhibition Submitted</li>
                            <li><span class="history_month">05</span>Patent registration of holder for fixing acceleration sensor</li>
                            <li><span class="history_month">07</span>mta Vietnam 2023 (Ho Chi Minh City, Vietnam) Exhibition Submission</li>
                            <li><span class="history_month">07</span>Motor Noise Checker Launched</li>
                            <li><span class="history_month">11</span>Submission of SMATEC 2023 Exhibition</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>