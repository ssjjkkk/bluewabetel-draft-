<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/sub.css">
    <script type="text/javascript" src="./js/sub.js"></script>
</head>
    <%@ include file="/WEB-INF/views/layout/subheader_company.jsp" %>
    <section class="company_contents_section">
        <div class="company_contents map">
            <div class="bwt-tabs" role="tablist" aria-label="Location tabs">
                <button class="bwt-tab-btn active" role="tab" aria-selected="true" aria-controls="panel-company" id="tab-company">company</button>
                <button class="bwt-tab-btn" role="tab" aria-selected="false" aria-controls="panel-factory" id="tab-factory">factory</button>
            </div>
            <div class="main-contents">
                <div class="main-full board-write">
                    <!-- * 카카오맵 - 지도퍼가기 -->
                    <!-- 1. 지도 노드 -->
                    <div id="daumRoughmapContainer1754984329686" class="root_daum_roughmap root_daum_roughmap_landing tab_cont_map active" style="max-width: 100%;"></div>
                    <div id="daumRoughmapContainer1754985913713" class="root_daum_roughmap root_daum_roughmap_landing tab_cont_map" style="max-width: 100%;"></div>

                    <!--
                        2. 설치 스크립트
                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                    -->
                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                    <!-- 3. 실행 스크립트 -->
                    <script charset="UTF-8">
                        new daum.roughmap.Lander({
                            "timestamp" : "1754984329686",
                            "key" : "6utuxw5s2t2",
                            "mapWidth" : "1300",
                            "mapHeight" : "400"
                        }).render();

                        // Factory는 지연 렌더 (최초 1회만)
                        let factoryRendered = false;
                        async function renderFactoryOnce() {
                            if (factoryRendered) return;
                            new daum.roughmap.Lander({
                                timestamp: "1754985913713",
                                key: "79bp74qimg5",
                                mapWidth: "1300",
                                mapHeight: "400"
                            }).render();
                            factoryRendered = true;
                        }

                        document.querySelectorAll('.bwt-tab-btn').forEach(btn => {
                            btn.addEventListener('click', (e) => {
                                if (btn.classList.contains('active')) {
                                    e.preventDefault()
                                } else {
                                    document.querySelectorAll('.bwt-tab-btn').forEach(b2 => {
                                        b2.classList.remove('active')
                                    })

                                    btn.classList.add('active')

                                    document.querySelectorAll('.tab_cont_map.inline-flex').forEach(cont => {
                                        if (cont.classList.contains('active')) {
                                            cont.classList.remove('active')
                                        } else {
                                            cont.classList.add('active')
                                        }
                                    })

                                    if (btn.textContent === 'company') {
                                        document.querySelector('#daumRoughmapContainer1754984329686').classList.add('active')
                                        document.querySelector('#daumRoughmapContainer1754984329686').style.display= 'block';
                                        document.querySelector('#daumRoughmapContainer1754985913713').classList.remove('active')
                                        document.querySelector('#daumRoughmapContainer1754985913713').style.display= 'none';
                                        setTimeout(()=>{ window.dispatchEvent(new Event('resize')); }, 50);
                                    } else {
                                        document.querySelector('#daumRoughmapContainer1754984329686').classList.remove('active')
                                        document.querySelector('#daumRoughmapContainer1754984329686').style.display= 'none';
                                        document.querySelector('#daumRoughmapContainer1754985913713').classList.add('active')
                                        document.querySelector('#daumRoughmapContainer1754985913713').style.display= 'block';
                                        renderFactoryOnce()
                                        setTimeout(()=>{ window.dispatchEvent(new Event('resize')); }, 50);
                                    }
                                }
                            });
                        });
                    </script>
                    <div class="map_info  tab_cont_map active inline-flex">
                        <div class="map_info_content">
                            <div style="min-width: 55px; margin: 0;">
                                <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <circle cx="40" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                                <path d="M39.9968 48.3153C40.0465 48.3458 40.0427 48.3344 39.9968 48.2847C39.9509 48.3344 39.9471 48.3497 39.9968 48.3153Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M39.9981 27.5C35.6837 27.5 32.1875 31.0682 32.1875 35.4659C32.1875 36.9432 32.4223 37.7462 32.8125 39.0038C33.9716 42.7424 39.9981 48.2841 39.9981 48.2841C39.9981 48.2841 46.0208 42.7462 47.1799 39.0227C47.5739 37.7576 47.8125 36.9508 47.8125 35.4659C47.8125 31.0682 44.3163 27.5 39.9981 27.5ZM39.9981 38.9583C37.839 38.9583 36.0928 37.2083 36.0928 35.053C36.0928 32.8977 37.8428 31.1477 39.9981 31.1477C42.1534 31.1477 43.9034 32.8977 43.9034 35.053C43.9034 37.2083 42.1534 38.9583 39.9981 38.9583Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M42.9382 45.4697H49.8132L52.5367 52.5H27.4609L30.1844 45.4697H37.2337" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </div>
                            <div>
                                <p class="map_title">
                                    <spring:message code="common.address"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.address"/>
                                </p>
                            </div>
                        </div>
                        <div class="map_info_line"></div>
                        <div class="map_info_content">
                            <svg width="81" height="80" viewBox="0 0 81 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="40.2031" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                            <path d="M40.2031 27.5005C47.0955 27.5005 52.7038 33.108 52.7038 39.9995" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M40.2031 31.5103C44.8829 31.5103 48.6942 35.3172 48.6942 40.0001" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M40.2031 35.9795C42.4195 35.9795 44.224 37.7838 44.224 39.9998" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M48.5283 48.6313C48.4871 48.957 48.3336 49.2826 48.1277 49.4885L46.6114 51.0083C41.4449 55.3318 34.8857 48.8896 34.8183 48.8259L31.389 45.3933C31.3253 45.3259 24.8785 38.7713 29.1839 33.6205L30.7263 32.0783C30.9285 31.8761 31.258 31.7227 31.5799 31.6777C31.6436 31.6702 31.7035 31.6665 31.7634 31.6665C32.003 31.6665 32.1977 31.7301 32.31 31.8424L35.5147 35.5409C35.9003 35.9264 35.9003 36.5478 35.5147 36.9334L34.3466 38.105C34.0583 38.4157 33.8562 38.7077 33.7251 39.0034C33.4706 39.7034 33.0625 41.5339 34.8221 43.4281L36.7914 45.4008C38.6745 47.1489 40.5052 46.7409 41.2278 46.4789C41.4974 46.3591 41.7931 46.1532 42.1113 45.8575L43.2719 44.697C43.6426 44.3265 44.2715 44.304 44.6834 44.7158L48.3486 47.8901C48.5021 48.0511 48.5657 48.3206 48.5245 48.6313H48.5283Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <div>
                                <p class="map_title">
                                    <spring:message code="common.tel"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.tel"/>
                                </p>
                            </div>
                        </div>
                        <div class="map_info_line"></div>
                        <div class="map_info_content">
                            <svg width="81" height="80" viewBox="0 0 81 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="40.4062" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                            <path d="M29.6351 32.063H27.8594V52.5001H52.9548V32.063H51.3084" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M42.543 43.7397L52.9538 52.5001" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M27.8594 52.4998L38.4489 43.5493" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M27.8594 32.8462L38.0078 43.0971C39.3957 44.5001 41.6695 44.4887 43.0421 43.0704L52.9548 32.8462" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M30.1406 34.7243V27.5H50.6733V34.7243" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M35.8398 33.2036H44.9655" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M38.125 37.7661H42.6878" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <div>
                                <p class="map_title">
                                    <spring:message code="common.email"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.email"/>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="map_info tab_cont_map inline-flex">
                        <div class="map_info_content">
                            <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="40" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                            <path d="M39.9968 48.3153C40.0465 48.3458 40.0427 48.3344 39.9968 48.2847C39.9509 48.3344 39.9471 48.3497 39.9968 48.3153Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M39.9981 27.5C35.6837 27.5 32.1875 31.0682 32.1875 35.4659C32.1875 36.9432 32.4223 37.7462 32.8125 39.0038C33.9716 42.7424 39.9981 48.2841 39.9981 48.2841C39.9981 48.2841 46.0208 42.7462 47.1799 39.0227C47.5739 37.7576 47.8125 36.9508 47.8125 35.4659C47.8125 31.0682 44.3163 27.5 39.9981 27.5ZM39.9981 38.9583C37.839 38.9583 36.0928 37.2083 36.0928 35.053C36.0928 32.8977 37.8428 31.1477 39.9981 31.1477C42.1534 31.1477 43.9034 32.8977 43.9034 35.053C43.9034 37.2083 42.1534 38.9583 39.9981 38.9583Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M42.9382 45.4697H49.8132L52.5367 52.5H27.4609L30.1844 45.4697H37.2337" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <div>
                                <p class="map_title">
                                    <spring:message code="common.address"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.address"/>
                                </p>
                            </div>
                        </div>
                        <div class="map_info_line"></div>
                        <div class="map_info_content">
                            <svg width="81" height="80" viewBox="0 0 81 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="40.2031" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                            <path d="M40.2031 27.5005C47.0955 27.5005 52.7038 33.108 52.7038 39.9995" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M40.2031 31.5103C44.8829 31.5103 48.6942 35.3172 48.6942 40.0001" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M40.2031 35.9795C42.4195 35.9795 44.224 37.7838 44.224 39.9998" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M48.5283 48.6313C48.4871 48.957 48.3336 49.2826 48.1277 49.4885L46.6114 51.0083C41.4449 55.3318 34.8857 48.8896 34.8183 48.8259L31.389 45.3933C31.3253 45.3259 24.8785 38.7713 29.1839 33.6205L30.7263 32.0783C30.9285 31.8761 31.258 31.7227 31.5799 31.6777C31.6436 31.6702 31.7035 31.6665 31.7634 31.6665C32.003 31.6665 32.1977 31.7301 32.31 31.8424L35.5147 35.5409C35.9003 35.9264 35.9003 36.5478 35.5147 36.9334L34.3466 38.105C34.0583 38.4157 33.8562 38.7077 33.7251 39.0034C33.4706 39.7034 33.0625 41.5339 34.8221 43.4281L36.7914 45.4008C38.6745 47.1489 40.5052 46.7409 41.2278 46.4789C41.4974 46.3591 41.7931 46.1532 42.1113 45.8575L43.2719 44.697C43.6426 44.3265 44.2715 44.304 44.6834 44.7158L48.3486 47.8901C48.5021 48.0511 48.5657 48.3206 48.5245 48.6313H48.5283Z" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <div>
                                <p class="map_title">
                                    <spring:message code="common.tel"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.tel"/>
                                </p>
                            </div>
                        </div>
                        <div class="map_info_line"></div>
                        <div class="map_info_content">
                            <svg width="81" height="80" viewBox="0 0 81 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="40.4062" cy="40" r="40" fill="#0A6FAE" fill-opacity="0.05"/>
                            <path d="M29.6351 32.063H27.8594V52.5001H52.9548V32.063H51.3084" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M42.543 43.7397L52.9538 52.5001" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M27.8594 52.4998L38.4489 43.5493" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M27.8594 32.8462L38.0078 43.0971C39.3957 44.5001 41.6695 44.4887 43.0421 43.0704L52.9548 32.8462" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M30.1406 34.7243V27.5H50.6733V34.7243" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M35.8398 33.2036H44.9655" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M38.125 37.7661H42.6878" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <div>
                                <p class="map_title">
                                    <spring:message code="으아악"/>
                                </p>
                                <p class="map_cont">
                                    <spring:message code="company.email"/>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>

</html>