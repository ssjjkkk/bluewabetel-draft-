<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header_main.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <script type="text/javascript" src="./js/main.js"></script>
</head>
   
    <!-- Main Content Section -->
    <!-- 제품소개 -->
    <section class="product_detail_wrapper">
      <div class="product_section_img1">
        <img src="/img/bg_main_product1.jpeg" alt="bwtBgProduct" style="width: 740px;"/>
      </div>
      <div class="product_section_img2">
        <img src="/img/bg_main_product2.jpeg" alt="BgProduct" style="width: 100%; height:100%;"/>
      </div>
      <section class="container product_detail">
          <div class="product-container-left">
            <span class="section_title" data-aos="fade" data-aos-duration="1000"><spring:message code="product"/></span>
            <span class="board_group_title" data-aos="fade" data-aos-duration="1000"><spring:message code="used in various industries<br/>Check out the product"/></span>
            <div class="main_product_category" data-aos="fade" data-aos-delay="200" data-aos-duration="1000">
              <button type="button" id="tab-Inspection" class="tab-link" onclick="openTab1('tab-Inspection')">
                More View &nbsp;
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="8.00195" cy="8" r="8" fill="#0A6FAE"/>
                <path d="M6.00195 4L10.002 8L6.00195 12" stroke="white" stroke-width="1.5" stroke-miterlimit="10"/>
                </svg>
              </button>
            </div>
          </div>

          <div class="product-container-right">
              <div class="swiper-container product-swiper" id="product_swiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide product-card">
                      <img src="/img/product1.png" alt="제품 1" />
                      <h3 class="card-title">제품 1</h3>
                      <p class="card-desc">제품 1 간단한 설명</p>
                    </div>
                    <!-- 더미들 --!>
                    <div class="swiper-slide product-card">
                      <img src="/img/product2.png" alt="제품 2" />
                      <h3 class="card-title">제품 2</h3>
                      <p class="card-desc">제품 2 간단한 설명</p>
                    </div>
                    <div class="swiper-slide product-card">
                      <img src="/img/product3.png" alt="제품 3" />
                      <h3 class="card-title">제품 3</h3>
                      <p class="card-desc">제품 3 간단한 설명</p>
                    </div>
                    <div class="swiper-slide product-card">
                      <img src="/img/product3.png" alt="제품 4" />
                      <h3 class="card-title">제품 4</h3>
                      <p class="card-desc">제품 4 간단한 설명</p>
                    </div>
                    <div class="swiper-slide product-card">
                      <img src="/img/product3.png" alt="제품 5" />
                      <h3 class="card-title">제품 5</h3>
                      <p class="card-desc">제품 5 간단한 설명</p>
                    </div>
                    <!-- 더미들 끝--!>
                  </div>
              </div>
          </div>
      </section>
    </section>

    <!-- News -->
    <section class="container news_section">
        <div class="news-container-first">
          <span class="section_title" data-aos="fade" data-aos-duration="1000"><spring:message code="news"/></span>
          <div class="news-subtitle-wrapper">
            <span class="board_group_title" data-aos="fade" data-aos-duration="1000"><spring:message code="I am informing you of the new news and information."/></span>
            <div class="main_product_category news_category" data-aos="fade" data-aos-delay="200" data-aos-duration="1000">
              <button type="button" id="tab-Inspection" class="tab-link" onclick="openTab1('tab-Inspection')">
                More View &nbsp;
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="8.00195" cy="8" r="8" fill="#0A6FAE"/>
                <path d="M6.00195 4L10.002 8L6.00195 12" stroke="white" stroke-width="1.5" stroke-miterlimit="10"/>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div class="news-container-second">
            <div class="swiper-container news-swiper" id="news_swiper">
                <div class="swiper-wrapper">
                  <div class="swiper-slide news-card">
                    <img src="/img/product1.png" alt="제품 1" />
                    <h3 class="card-title">뉴스 1</h3>
                    <p class="card-desc">2025.00.00</p>
                  </div>
                  <!-- 더미들 --!>
                  <div class="swiper-slide news-card">
                    <img src="/img/product2.png" alt="제품 2" />
                    <h3 class="card-title">뉴스 2</h3>
                    <p class="card-desc">2025.00.00</p>
                  </div>
                  <div class="swiper-slide news-card">
                    <img src="/img/product3.png" alt="제품 3" />
                    <h3 class="card-title">뉴스 3</h3>
                    <p class="card-desc">2025.00.00</p>
                  </div>
                  <div class="swiper-slide news-card">
                    <img src="/img/product3.png" alt="제품 4" />
                    <h3 class="card-title">뉴스 4</h3>
                    <p class="card-desc">2025.00.00</p>
                  </div>
                  <div class="swiper-slide news-card">
                    <img src="/img/product3.png" alt="제품 5" />
                    <h3 class="card-title">뉴스 5</h3>
                    <p class="card-desc">2025.00.00</p>
                  </div>
                  <!-- 더미들 끝--!>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>

    <!-- Inquiry -->
    <section class="container bg_inquiry_section">
        <section class="container inquiry_section">
            <div class="inquiry-container-first">
              <span class="section_title inquiry_section_title" data-aos="fade" data-aos-duration="1000"><spring:message code="inquiryHead"/></span>
              <div class="inquiry-subtitle-wrapper">
                <span class="board_group_title inquiry_board_title" data-aos="fade" data-aos-duration="1000"><spring:message code="We will do our best<br>to provide reliable services."/></span>
              </div>
              <div class="main_product_category inquiry_category" data-aos="fade" data-aos-delay="200" data-aos-duration="1000">
                <button type="button" id="tab-Inspection" class="tab-link inquiry_more" onclick="openTab1('tab-Inspection')">
                  More View &nbsp;
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="8.00195" cy="8" r="8" fill="white"/>
                  <path d="M6.00195 4L10.002 8L6.00195 12" stroke="#2596FF" stroke-width="1.5" stroke-miterlimit="10"/>
                  </svg>
                </button>
              </div>
            </div>

            <div class="inquiry-container-second">
              <div class="inquiry_info_wrapper">
                <div style="width: 27px; margin-right: 30px;">
                <svg class="inquiry_info_icon" width="27" height="28" viewBox="0 0 27 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M13.4616 22.3153C13.5113 22.3458 13.5075 22.3344 13.4616 22.2847C13.4158 22.3344 13.4119 22.3497 13.4616 22.3153Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M13.461 1.5C9.14661 1.5 5.65039 5.06818 5.65039 9.46592C5.65039 10.9432 5.88524 11.7462 6.27539 13.0038C7.43448 16.7424 13.461 22.2841 13.461 22.2841C13.461 22.2841 19.4837 16.7462 20.6428 13.0227C21.0368 11.7576 21.2754 10.9508 21.2754 9.46592C21.2754 5.06818 17.7792 1.5 13.461 1.5ZM13.461 12.9583C11.3019 12.9583 9.5557 11.2083 9.5557 9.05304C9.5557 6.89773 11.3057 5.14773 13.461 5.14773C15.6163 5.14773 17.3663 6.89773 17.3663 9.05304C17.3663 11.2083 15.6163 12.9583 13.461 12.9583Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M16.4011 19.4696H23.2761L25.9996 26.4999H0.923828L3.64732 19.4696H10.6966" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                </div>
                <div class="inquiry_info_text_wrapper">
                  <span class="inquiry_info_text inquiry_info_title" data-aos="fade" data-aos-duration="1000"><spring:message code="COMPANY"/></span>
                  <span class="inquiry_info_text inquiry_info_content" data-aos="fade" data-aos-duration="1000"><spring:message code="17, Techno 4-ro, Yuseong-gu, Daejeon, Republic of Korea"/></span>
                </div>
              </div>
              <div class="inquiry_info_wrapper">
                <svg class="inquiry_info_icon" width="27" height="28" viewBox="0 0 27 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M13.459 1.5C20.3514 1.5 25.9597 7.10751 25.9597 13.999" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M13.459 5.50958C18.1388 5.50958 21.95 9.31655 21.95 13.9995" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M13.459 9.97888C15.6753 9.97888 17.4799 11.7832 17.4799 13.9992" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M21.7861 22.631C21.7449 22.9567 21.5914 23.2824 21.3855 23.4883L19.8693 25.0081C14.7028 29.3316 8.14355 22.8893 8.07616 22.8257L4.64681 19.3931C4.58316 19.3257 -1.86373 12.7711 2.44168 7.62028L3.98415 6.07803C4.18631 5.87589 4.51577 5.72241 4.83774 5.67749C4.90139 5.67 4.96129 5.66626 5.02119 5.66626C5.2608 5.66626 5.45547 5.7299 5.56779 5.8422L8.77252 9.54061C9.15813 9.92617 9.15813 10.5476 8.77252 10.9331L7.60444 12.1048C7.31616 12.4155 7.114 12.7075 6.98296 13.0032C6.72838 13.7032 6.3203 15.5337 8.07991 17.4278L10.0492 19.4005C11.9323 21.1487 13.7631 20.7407 14.4856 20.4786C14.7552 20.3588 15.0509 20.153 15.3692 19.8572L16.5298 18.6968C16.9004 18.3262 17.5294 18.3037 17.9412 18.7155L21.6064 21.8899C21.7599 22.0508 21.8235 22.3203 21.7824 22.631H21.7861Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <div class="inquiry_info_text_wrapper">
                  <span class="inquiry_info_text inquiry_info_title" data-aos="fade" data-aos-duration="1000"><spring:message code="Tel"/></span>
                  <span class="inquiry_info_text inquiry_info_content" data-aos="fade" data-aos-duration="1000"><spring:message code="+82 42 864 0283"/></span>
                </div>
              </div>
              <div class="inquiry_info_wrapper">
                <svg class="inquiry_info_icon" width="27" height="28" viewBox="0 0 27 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M2.68976 6.06287H0.914062V26.5H26.0095V6.06287H24.3631" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M15.5977 17.7396L26.0085 26.5" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M0.914062 26.4997L11.5036 17.5492" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M0.914062 6.84619L11.0625 17.0971C12.4504 18.5001 14.7242 18.4887 16.0968 17.0704L26.0095 6.84619" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M3.19336 8.72428V1.5H23.726V8.72428" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M8.89648 7.20349H18.0221" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M11.1797 11.7664H15.7425" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <div class="inquiry_info_text_wrapper">
                  <span class="inquiry_info_text inquiry_info_title" data-aos="fade" data-aos-duration="1000"><spring:message code="E-mail"/></span>
                  <span class="inquiry_info_text inquiry_info_content" data-aos="fade" data-aos-duration="1000"><spring:message code="bwt@bluewavetel.com"/></span>
                </div>
              </div>
            </div>
        </section>
    </section>

	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    <script type="text/javascript">
        /* Swiper Script */
        var swiper = new Swiper('.product-swiper', {
          slidesPerView: 1,
          slidesPerGroup: 1,
          loop: false,
          spaceBetween: 30,
          observer: true,
          observeParents: true,
          autoplay: {
              delay: 3000,
              disableOnInteraction: false,
          },
          speed: 500,
          /*breakpoints: {
            1024: { slidesPerView: 1 },
            768: { slidesPerView: 1 },
            0: { slidesPerView: 1 },
          },*/
        });

        var swiper2 = new Swiper('.news-swiper', {
          /*effect: "fade",*/
          slidesPerView: 1,
          slidesPerGroup: 1,
          loop: false,
          spaceBetween: 30,
          observer: true,
          observeParents: true,
          speed: 500,
          pagination: {
              el: ".swiper-pagination",
              type: "progressbar",
          },
        });
    </script>
</body>

</html>