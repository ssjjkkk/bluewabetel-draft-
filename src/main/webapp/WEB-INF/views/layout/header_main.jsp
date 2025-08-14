<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLUEWAVETEL</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-mobile-web-app-title" content="BLUEWAVETEL">
    <meta name="robots" content="index,follow">
    <meta name="author" content="HS컴퍼니">   
    <meta name="keywords" content="BLUEWAVETEL, BlueWaveTel, 블루웨이브텔">
    <!-- 메타부분 전부 수정필요 -->
    <meta name="description" content="블루웨이브텔 입니다.">

    <!-- 파비콘 받아서 연결해야함!!! -->
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png">

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js" crossorigin="anonymous"></script>
    <!-- Google Icon-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,300,0,0" />
    <!-- Pretendard 폰트 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable-dynamic-subset.min.css" />
    <!-- Fontawesome Icons -->
    <script src="https://kit.fontawesome.com/6b6a786985.js"></script>
    <!-- Swiper -->
    <link rel="stylesheet" href="/js/swiper/swiper-bundle.min.css"/>
    <script src="/js/swiper/swiper-bundle.min.js"></script>

    <!-- AOS(Animation On Scroll)-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/layout/header.css">
</head>
<body>
 <!-- Header Section -->
 <header class="act">
     <div class="container">
         <a class="main_logo" href="/">
             <!-- <img src="/img/main_logo.png"> -->
         </a>
        <!-- Navigation -->
        <nav id="main_menu">
            <ul>
                <li><a href="/company"><span><spring:message code="company"/></span></a></li>
                <li><a href="/product?openTabName=antenna"><span><spring:message code="product"/></span></a></li>
                <li><a href="/product?openTabName=antenna"><span><spring:message code="rd"/></span></a></li>
                <li><a href="/news?openTabName=news"><span><spring:message code="news"/></span></a></li>
                <li><a href="/product?openTabName=antenna"><span><spring:message code="support"/></span></a></li>
                <li><a href="/product?openTabName=antenna"><span><spring:message code="inquiryHead"/></span></a></li>
            </ul>
        </nav>
         <!-- SNS button -->
         <nav class="header-right">
             <ul id="main_top_sns">
                 <li id="lang">
                     <a href="#"><i class="fa-solid fa-globe"></i>
                         <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}"><span>KOR</span></c:if>
                         <c:if test="${locale eq 'en_US' || locale eq 'en'}"><span>ENG</span></c:if>
                     </a>
                     <ul>
                         <li><a href="#" id="langKor" class='act'>KOR</a></li>
                         <li><a href="#" id="langEng">ENG</a></li>
                     </ul>
                 </li>
                 <li>
                     <li class="hamWrapper">
                         <!--<img class="ham" src="/img/icon_menu.png">--!>
                         <svg class="ham hamRotate" viewBox="0 0 100 100" width="45" >
                             <path class="line top" d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20" />
                             <path class="line middle" d="m 30,50 h 40" />
                             <path class="line bottom" d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20" />
                         </svg>
                     </li>
                 </li>
             </ul>
         </nav>
     </div>
     <div class="dropdown-menu">
        <div id="top_menu_header">
            <!-- <button class="hamburger2" aria-label="Close Menu">
                <svg xmlns="http://www.w3.org/2000/svg" height="28px" viewBox="0 -960 960 960" width="28px" fill="#FFFFFF"><path d="M256-192.35 192.35-256l224-224-224-224L256-767.65l224 224 224-224L767.65-704l-224 224 224 224L704-192.35l-224-224-224 224Z"/></svg>
            </button> -->
            <img id="bg_dropdown" src="/img/bg_dropdown.png">
        </div>
         <ul>
             <li>
                <a href="/company"><span><spring:message code="company"/></span></a>
                <ul>
                    <li><a href="/company"><span><spring:message code="Philosophy"/></span></a></li>
                    <li><a href="/vision"><span><spring:message code="Mission"/></span></a></li>
                    <li><a href="/principle"><span><spring:message code="Vision"/></span></a></li>
                    <li><a href="/history"><span><spring:message code="History"/></span></a></li>
                    <li><a href="/certified"><span><spring:message code="MAP"/></span></a></li>
                </ul>
            </li>
             <li>
                <a href="/product?openTabName=antenna"><span><spring:message code="product"/></span></a>
                <ul>
                    <li><a href="/product?openTabName=antenna"><span><spring:message code="Antenna"/></span></a></li>
                    <li><a href="/product?openTabName=gps"><span><spring:message code="GPS"/></span></a></li>
                    <li><a href="/product?openTabName=electronic-warfare"><span><spring:message code="Electronic Warfare"/></span></a></li>
                    <li><a href="/product?openTabName=oem"><span><spring:message code="OEM"/></span></a></li>
                    <li><a href="/product?openTabName=rf-modules"><span><spring:message code="RF Modules"/></span></a></li>
                </ul>
            </li>
             <li>
                <a href="/case?openTabName=Inspection"><span><spring:message code="R&D"/></span></a>
                <ul>
                    <li><a href="/case?openTabName=Inspection"><span><spring:message code="R&D"/></span></a></li>
                </ul>
            </li>
             <li>
                 <a href="/company"><span><spring:message code="News"/></span></a>
                 <ul>
                     <li><a href="/company"><span><spring:message code="News"/></span></a></li>
                     <li><a href="/vision"><span><spring:message code="Notice"/></span></a></li>
                 </ul>
             </li>
             <li>
                  <a href="/product?openTabName=Inspection"><span><spring:message code="Support"/></span></a>
                  <ul>
                      <li><a href="/product?openTabName=Etc"><span><spring:message code="Technical Support"/></span></a></li>
                  </ul>
             </li>
             <li>
                <a href="/support"><span><spring:message code="Inquiry"/></span></a>
                <ul>
                    <li><a href="/map"><span><spring:message code="Inquiry"/></span></a></li>
                </ul>
             </li>
         </ul>
          <div class="dropdown-info-wrapper">
            <div class="dropdown-company-wrapper">
              <span class="dropdown-info-title">COMPANY</span>
              <span class="dropdown-info-content">17, Techno 4-ro, Yuseong-gu, Daejeon, Republic of Korea</span>
            </div>
            <div class="dropdown-factory-wrapper">
              <span class="dropdown-info-title">FACTORY</span>
              <span class="dropdown-info-content">41-2, Geumo-daero 20-gil, Gumi-si, Gyeongsangbuk-do, Republic of Korea</span>
            </div>
          </div>
     </div>
 </header>
 <section class="main_hero">
 <!-- main_slider--!>
    <div class="container">
        <div class="hero-container" id="hero_banner">
            <c:if test = "${ locale eq 'ko_KR' }">
                <div class="hero-wrapper">
                    <div class="product-area">
                        <div class="product-txt">
                            <span class="product-subtitle">BlueWaveTel</span>
                            <span class="product-title">Everything’s being connected via Wireless</span>
                            <ul class="product-desc">
                                <li>It is the Antenna that makes it Wireless</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test = "${ locale eq 'en_US' }">
                <div class="hero-wrapper">
                    <div class="product-area">
                        <div class="product-txt">
                            <span class="product-subtitle">BlueWaveTel</span>
                            <span class="product-title">Everything’s being connected via Wireless</span>
                            <ul class="product-desc">
                                <li>It is the Antenna that makes it Wireless</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</section>
<c:if test="${not empty user.userId}">
    <input type="hidden" id="userId" value="${user.userId}"/>
    <button type="button" id="logoutBtn" title="Logout"><i class="fa-solid fa-arrow-right-from-bracket"></i></button>
</c:if>
<button type="button" onclick="scrollToTop()" id="scrollTopBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>

<script>
$(document).ready(function() {

    // 모바일에서 전체메뉴 내 드랍다운 적용을 위한 스크립트
    const dropdownItems = document.querySelectorAll(".dropdown-menu > ul > li");
    dropdownItems.forEach(item => {
        const firstAnchor = item.querySelector("a");

        if (firstAnchor) {
            const subMenu = item.querySelector("ul");

            if (subMenu) {
                firstAnchor.addEventListener("click", function(event) {
                    if (window.matchMedia("(max-width: 860px)").matches) {
                        event.preventDefault();

                        // 현재 활성화된 메뉴를 찾아서 비활성화
                        const activeItem = document.querySelector(".dropdown-menu > ul > li.active");
                        if (activeItem && activeItem !== item) {
                            activeItem.classList.remove("active");
                            activeItem.querySelector("ul").style.display = "none";
                        }

                        // 현재 클릭한 메뉴 활성화 상태 변경
                        if (item.classList.contains("active")) {
                            item.classList.remove("active");
                            subMenu.style.display = "none";
                        } else {
                            item.classList.add("active");
                            subMenu.style.display = "block";
                        }

                    }
                });
            }
        }
    });
})
</script>