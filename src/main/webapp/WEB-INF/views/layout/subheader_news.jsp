<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="height: 90px;"></div>
<section class="sub_header news">
    <h1 id="h1-news"><spring:message code="News"/></h1>
    <div class="breadcrumb">
        <ul>
            <li>
                <a href="/">
                    <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.93489 0L0.5 8.13759H2.97666V16H7.30098H8.28378H8.51966V10.4177H11.3501V16H11.586H13.355H16.8931V8.13759H19.3698L9.93489 0Z" fill="white"/>
                    </svg>
                </a>
            </li>
            <li><a href="/news?openTabName=news"><spring:message code="News"/></a></li>
            <li id="bc-news" style="display:none;"><a style="color:white;" href="/news?openTabName=news"><spring:message code="News"/></a></li>
            <li id="bc-notice" style="display:none;"><a style="color:white;" href="/news?openTabName=notice"><spring:message code="Notice"/></a></li>
        </ul>
    </div>
</section>
<section class="sub_header_under">
    <nav>
        <ul>
            <li id="li-news"><a href="/news?openTabName=news"><spring:message code="News"/></a></li>
            <li id="li-notice"><a href="/news?openTabName=notice"><spring:message code="notice"/></a></li>
        </ul>
    </nav>
</section>
<script type="text/javascript">
    const url = new URL(window.location.href);
    const searchParams = url.searchParams;
    const newsCategory = searchParams.get('openTabName')

    $('#li-'+ newsCategory).addClass('active');

    if (document.getElementById('bc-'+newsCategory)) {
        document.getElementById('bc-'+newsCategory
        ).style.display = 'block';
    }
</script>