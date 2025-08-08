<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="sub_header">
    <div class="breadcrumb">
        <ul>
            <li><a href="/">
                <svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 -960 960 960" width="18px" fill="#C9C9C9"><path d="M240-200h147.69v-235.38h184.62V-200H720v-360L480-741.54 240-560v360Zm-40 40v-420l280-211.54L760-580v420H532.31v-235.38H427.69V-160H200Zm280-310.77Z"/></svg>
            </a></li>
            <li><a href="/support"><spring:message code="case"/></a></li>
            <li id="bc-notice" style="display:none;"><a style="color:black;" href="/notice"><spring:message code="notice"/></a></li>
            <c:choose>
                <c:when test="${not empty user.userId}">
                    <li id="bc-inquiry" style="display:none;"><a style="color:black;" href="/inquiryAdmin"><spring:message code="inquiry"/></a></li>
                </c:when>
                <c:otherwise>
                    <li id="bc-inquiry" style="display:none;"><a style="color:black;" href="/inquiryWrite"><spring:message code="inquiry"/></a></li>
                </c:otherwise>
            </c:choose>
            <li id="bc-board" style="display:none;"><a style="color:black;" href="/board"><spring:message code="board"/></a></li>
            <li id="bc-map" style="display:none;"><a style="color:black;" href="/map"><spring:message code="map"/></a></li>
        </ul>
    </div>
    <h1 id="h1-notice" style="display:none;"><spring:message code="notice"/></h1>
    <h1 id="h1-inquiry" style="display:none;"><spring:message code="inquiry"/></h1>
    <h1 id="h1-board" style="display:none;"><spring:message code="board"/></h1>
    <h1 id="h1-map" style="display:none;"><spring:message code="map"/></h1>
    <nav>
        <ul>
            <li id="notice"><a href="/notice"><spring:message code="notice"/></a></li>
            <c:choose>
                <c:when test="${not empty user.userId}">
                    <li id="inquiry"><a href="/inquiryAdmin"><spring:message code="inquiry"/></a></li>
                </c:when>
                <c:otherwise>
                    <li id="inquiry"><a href="/inquiryWrite"><spring:message code="inquiry"/></a></li>
                </c:otherwise>
            </c:choose>
            <li id="board"><a href="/board"><spring:message code="board"/></a></li>
            <li id="map"><a href="/map"><spring:message code="map"/></a></li>
        </ul>
    </nav>
</section>
<script type="text/javascript">
$(document).ready(function() {
    const pathname = window.location.pathname;
    const pathSegments = pathname.split('/');

    pathSegments.shift();

    var subPath = pathSegments[0];

    if( subPath == "support" ) {
        subPath = "notice";
    }else if (subPath == "inquiryAdmin"){
        subPath = "inquiry"
    }else if (subPath == "inquiryWrite"){
        subPath = "inquiry"
    }

    //console.log(subPath);

    if(subPath == 'boardView'){
        var boardTypeCd = $('#boardTypeCd').val();
        //console.log(boardTypeCd);
        if(boardTypeCd == 'C'){
            subPath = "notice";
        } else if(boardTypeCd == 'D'){
            subPath = "board";
        } else if(boardTypeCd == 'E'){
            subPath = "inquiry";
        }
    }

    //console.log(subPath);
    $('#path').val(subPath);

    $('#'+subPath).addClass('active');
    document.getElementById('bc-'+subPath).style.display = 'block';
    document.getElementById('h1-'+subPath).style.display = 'block';
});
</script>