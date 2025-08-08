<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="search">
    <div class="searchInputArea">
        <c:if test="${locale eq 'ko_KR' || locale eq 'ko'}">
            <input type="text" class="searchInput" id="searchKeyword" placeholder="검색어를 입력해주세요">
        </c:if>
        <c:if test="${locale eq 'en_US' || locale eq 'en'}">
            <input type="text" class="searchInput" id="searchKeyword" placeholder="Search Keyword">
        </c:if>
        <span class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></span>
    </div>
</section>