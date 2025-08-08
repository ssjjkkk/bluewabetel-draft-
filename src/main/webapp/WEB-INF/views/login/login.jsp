<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <script type="text/javascript" src="./js/login/login.js"></script>
</head>
<body>

    <section id="login_group">
        <form id="loginForm" name="loginForm">
            <h1 class="login_title">회원 로그인</h1>
            <div class="id_input_box">
                <span class="id_icon"><i class='fa-regular fa-user'></i></span>
                <input type="text" id="userId" name="userId" maxlength="20" value="" placeholder="아이디 입력" required="" autocomplete="off">
            </div>
            <div class="pw_input_box">
                <span class="pw_icon"><i class="fa-solid fa-key"></i></span>
                <input type="password" name="userPw" id="userPw" maxlength="20" class="login" placeholder="패스워드 입력" required="" autocomplete="off">
            </div>
    
            <div style="display:flex; justify-content: space-between; width: 100%; align-items: center;">
                <div class="auto_login_zone">
                    <!--
                    <input type="checkbox" id="auto_login" name="auto_login" value="1" onclick="autologin_check_v2(this)">
                    <label for="auto_login">자동로그인</label>-->
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">아이디 기억하기</label>
                </div>
            </div>
            <div class="btn_box">
                <button type="submit" class="bigLoginBtn">로그인</button>
            </div>
        </form>
        <%--<!--
        <div style="margin: 10px 0;" class="division_line">
            <span class="text">소셜로그인</span>
        </div>
        <div class="socialZone">
            <a href="../plugin/social_login/router/oauth_router.php?social=kakao" class="kakaoLoginBtn">
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M9 0C4.0294 0 0 3.29476 0 7.35897C0 9.98658 1.68456 12.2922 4.21858 13.5941C4.08072 14.0871 3.33268 16.766 3.30291 16.9764C3.30291 16.9764 3.285 17.1346 3.38374 17.1949C3.48248 17.2552 3.59862 17.2083 3.59862 17.2083C3.88177 17.1673 6.88214 14.9817 7.40146 14.6022C7.92026 14.6784 8.45446 14.7179 9 14.7179C13.9706 14.7179 18 11.4233 18 7.35897C18 3.29476 13.9706 0 9 0Z" fill="black"></path>
                    <path d="M4.024 9.92766C3.73765 9.92766 3.50477 9.69702 3.50477 9.41343V6.21452H2.6946C2.41361 6.21452 2.18506 5.97796 2.18506 5.68728C2.18506 5.3966 2.41369 5.16003 2.6946 5.16003H5.3534C5.63439 5.16003 5.86294 5.3966 5.86294 5.68728C5.86294 5.97796 5.63431 6.21452 5.3534 6.21452H4.54323V9.41343C4.54323 9.69702 4.31036 9.92766 4.024 9.92766ZM8.57696 9.92066C8.36044 9.92066 8.19481 9.82948 8.14488 9.68284L7.88777 8.98482L6.30446 8.98473L6.04718 9.6832C5.99742 9.82957 5.83188 9.92066 5.61536 9.92066C5.50147 9.92078 5.38889 9.89544 5.2853 9.84635C5.14216 9.77788 5.00457 9.5896 5.16224 9.08174L6.40424 5.69159C6.49173 5.43375 6.75749 5.16811 7.09568 5.16012C7.43483 5.16802 7.70059 5.43375 7.78825 5.69212L9.02973 9.08075C9.18775 9.58978 9.05015 9.77815 8.90702 9.84644C8.80341 9.89544 8.69084 9.92075 8.57696 9.92066C8.57696 9.92066 8.57688 9.92066 8.57696 9.92066ZM7.61474 8.03102L7.09612 6.50314L6.57749 8.03102H7.61474ZM9.86535 9.84914C9.59093 9.84914 9.36775 9.62765 9.36775 9.35555V5.6985C9.36775 5.40153 9.60556 5.16003 9.8978 5.16003C10.19 5.16003 10.4278 5.40153 10.4278 5.6985V8.86196H11.5312C11.8056 8.86196 12.0288 9.08344 12.0288 9.35555C12.0288 9.62765 11.8056 9.84914 11.5312 9.84914H9.86535ZM12.75 9.92066C12.4637 9.92066 12.2308 9.67916 12.2308 9.3822V5.6985C12.2308 5.40153 12.4637 5.16003 12.75 5.16003C13.0364 5.16003 13.2692 5.40153 13.2692 5.6985V6.85583L14.7179 5.35352C14.7924 5.27625 14.8948 5.23371 15.0059 5.23371C15.1355 5.23371 15.2657 5.29169 15.3632 5.39274C15.4542 5.48697 15.5084 5.60821 15.5159 5.73412C15.5234 5.86111 15.4826 5.97751 15.4013 6.06196L14.2181 7.28884L15.4961 9.04476C15.5374 9.1011 15.5675 9.16537 15.5846 9.23385C15.6017 9.30233 15.6055 9.37365 15.5958 9.44367C15.5866 9.51374 15.564 9.58121 15.5294 9.64217C15.4948 9.70313 15.4489 9.75636 15.3944 9.79879C15.3046 9.86957 15.1948 9.90775 15.0821 9.90747C15.0016 9.90786 14.9222 9.8887 14.8502 9.85153C14.7781 9.81436 14.7155 9.76022 14.6673 9.69343L13.4496 8.02025L13.2694 8.2071V9.38193C13.2693 9.52475 13.2145 9.66166 13.1171 9.76266C13.0198 9.86365 12.8877 9.92047 12.75 9.92066Z" fill="#FFE812"></path>
                </svg>
                <span>
                    카카오톡 계정으로 로그인
                </span>
            </a>
            <a href="../plugin/social_login/router/oauth_router.php?social=google" class="googleLoginBtn">
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M17.64 9.20456C17.64 8.56637 17.5827 7.95274 17.4764 7.36365H9V10.845H13.8436C13.635 11.97 13.0009 12.9232 12.0477 13.5614V15.8196H14.9564C16.6582 14.2527 17.64 11.9455 17.64 9.20456Z" fill="#4285F4"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M9 18C11.43 18 13.4673 17.1941 14.9564 15.8195L12.0477 13.5613C11.2418 14.1013 10.2109 14.4204 9 14.4204C6.65591 14.4204 4.67182 12.8372 3.96409 10.71H0.957275V13.0418C2.43818 15.9831 5.48182 18 9 18Z" fill="#34A853"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M3.96409 10.7099C3.78409 10.1699 3.68182 9.59313 3.68182 8.99995C3.68182 8.40677 3.78409 7.82995 3.96409 7.28995V4.95813H0.957273C0.347727 6.17313 0 7.54768 0 8.99995C0 10.4522 0.347727 11.8268 0.957273 13.0418L3.96409 10.7099Z" fill="#FBBC05"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M9 3.57955C10.3214 3.57955 11.5077 4.03364 12.4405 4.92545L15.0218 2.34409C13.4632 0.891818 11.4259 0 9 0C5.48182 0 2.43818 2.01682 0.957275 4.95818L3.96409 7.29C4.67182 5.16273 6.65591 3.57955 9 3.57955Z" fill="#EA4335"></path>
                </svg>
                <span>
                    구글 계정으로 로그인
                </span>
            </a>
        </div>
        --> --%>
    </section>

	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    
</body>

</html>