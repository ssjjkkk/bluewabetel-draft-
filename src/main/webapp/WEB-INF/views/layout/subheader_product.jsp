<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="height: 90px;"></div>
<section class="sub_header product">
    <h1 id="h1-product"><spring:message code="Product"/></h1>
    <div class="breadcrumb">
        <ul>
            <li>
                <a href="/">
                    <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.93489 0L0.5 8.13759H2.97666V16H7.30098H8.28378H8.51966V10.4177H11.3501V16H11.586H13.355H16.8931V8.13759H19.3698L9.93489 0Z" fill="white"/>
                    </svg>
                </a>
            </li>
            <li><a href="/product?openTabName=antenna"><spring:message code="product"/></a></li>
            <li id="bc-antenna" style="display:none;"><a style="color:white;" href="/product?openTabName=antenna"><spring:message code="Antenna"/></a></li>
            <li id="bc-gps" style="display:none;"><a style="color:white;" href="/product?openTabName=gps"><spring:message code="GPS"/></a></li>
            <li id="bc-electronic-warfare" style="display:none;"><a style="color:white;" href="/product?openTabName=electronic-warfare"><spring:message code="Electronic Warfare"/></a></li>
            <li id="bc-oem" style="display:none;"><a style="color:white;" href="/product?openTabName=oem"><spring:message code="OEM"/></a></li>
            <li id="bc-rf-modules" style="display:none;"><a style="color:white;" href="/product?openTabName=rf-modules"><spring:message code="RF Modules"/></a></li>
        </ul>
    </div>
</section>
<section class="sub_header_under">
    <nav>
        <ul>
            <li id="li-antenna"><a href="/product?openTabName=antenna"><spring:message code="Antenna"/></a></li>
            <li id="li-gps"><a href="/product?openTabName=gps"><spring:message code="GPS"/></a></li>
            <li id="li-electronic-warfare"><a href="/product?openTabName=electronic-warfare"><spring:message code="Electronic Warfare"/></a></li>
            <li id="li-oem"><a href="/product?openTabName=oem"><spring:message code="OEM"/></a></li>
            <li id="li-rf-modules"><a href="/product?openTabName=rf-modules"><spring:message code="RF Modules"/></a></li>
        </ul>
    </nav>
</section>
<script type="text/javascript">
    const url = new URL(window.location.href);
    const searchParams = url.searchParams;
    const productCategory = searchParams.get('openTabName')

    $('#li-'+ productCategory).addClass('active');

    if (document.getElementById('bc-'+productCategory)) {
        document.getElementById('bc-'+productCategory).style.display = 'block';
    }
</script>