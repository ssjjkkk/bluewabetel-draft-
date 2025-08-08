<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="height: 90px;"></div>
<section class="sub_header">
    <h1 id="h1-company" style="display:none;"><spring:message code="Company"/></h1>
    <h1 id="h1-vision" style="display:none;"><spring:message code="Company"/></h1>
    <h1 id="h1-principle" style="display:none;"><spring:message code="Company"/></h1>
    <h1 id="h1-history" style="display:none;"><spring:message code="Company"/></h1>
    <h1 id="h1-certified" style="display:none;"><spring:message code="Company"/></h1>
    <div class="breadcrumb">
        <ul>
            <li>
                <a href="/">
                    <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.93489 0L0.5 8.13759H2.97666V16H7.30098H8.28378H8.51966V10.4177H11.3501V16H11.586H13.355H16.8931V8.13759H19.3698L9.93489 0Z" fill="white"/>
                    </svg>
                </a>
            </li>
            <li><a href="/company"><spring:message code="company"/></a></li>
            <li id="bc-company" style="display:none;"><a style="color:white;" href="/company"><spring:message code="greeting"/></a></li>
            <li id="bc-vision" style="display:none;"><a style="color:white;" href="/vision"><spring:message code="vision"/></a></li>
            <li id="bc-principle" style="display:none;"><a style="color:white;" href="/principle"><spring:message code="principle"/></a></li>
            <li id="bc-history" style="display:none;"><a style="color:white;" href="/history"><spring:message code="history"/></a></li>
            <li id="bc-certified" style="display:none;"><a style="color:white;" href="/certified"><spring:message code="certified"/></a></li>
        </ul>
    </div>
</section>
<section class="sub_header_under">
    <nav>
        <ul>
            <li id="company"><a href="/company"><spring:message code="Philosophy"/></a></li>
            <li id="vision"><a href="/vision"><spring:message code="Mission"/></a></li>
            <li id="principle"><a href="/principle"><spring:message code="Vision"/></a></li>
            <li id="history"><a href="/history"><spring:message code="History"/></a></li>
            <li id="certified"><a href="/certified"><spring:message code="MAP"/></a></li>
        </ul>
    </nav>
</section>
<script type="text/javascript">
    const pathname = window.location.pathname;
    const pathSegments = pathname.split('/');

    pathSegments.shift();

    const subPath = pathSegments[0]; // 'path'

    $('#'+subPath).addClass('active');
    document.getElementById('bc-'+subPath).style.display = 'block';
    document.getElementById('h1-'+subPath).style.display = 'block';
</script>