<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <!-- Style Sheets-->
        <link rel="stylesheet" type="text/css" href="/css/common.css">
        <link rel="stylesheet" type="text/css" href="/css/layout/error.css">
        <script type="text/javascript" src="/js/particles/particles.js"></script>
        <title>ERROR</title>
    </head>
    <body>
        <div class="error-page">
            <div>
              <!--h1(data-h1='400') 400-->
              <!--p(data-p='BAD REQUEST') BAD REQUEST-->
              <!--h1(data-h1='401') 401-->
              <!--p(data-p='UNAUTHORIZED') UNAUTHORIZED-->
              <!--h1(data-h1='403') 403-->
              <!--p(data-p='FORBIDDEN') FORBIDDEN-->
              <h1 data-h1="Sorry">Sorry</h1>
              <p data-p="ERROR"></p>
              <p data-p="ERROR">확인되지 않은 오류가 발생하였습니다. 잠시 후에 다시 시도해주세요</p>
            </div>
          </div>
          <div id="particles-js"></div>
          <a href="javascript:history.back()" target="_self" class="back">뒤로가기</a>
    </body>
    <script type="text/javascript" src="/js/error.js"></script>
</html>