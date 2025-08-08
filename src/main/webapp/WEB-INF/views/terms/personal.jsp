
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/board.css">
</head>
    <div class="container board board_header">
        <div class="board_title">
            <h4 style="margin:0;">개인정보처리방침</h4>
            <div class="board_info"></div>
        </div>
    </div>

    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full">
            <div class="terms">
                <h4 style="display:inline-block;background-color:rgba(0,0,0,0.1);margin-top:0;padding:10px;"><spring:message code="company.name"/>(주)(<spring:message code="company.nameEng"/>, 이하 <spring:message code="company.name"/>)는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
                    <spring:message code="company.name"/>는 개인정보처리방침을 개정하는 경우 웹사이트 게시 또는 개별공지를 통하여 공지할 것입니다.
                    <span  class="personal_title" style="text-align:center;">※ 본 방침은 2024년 6월 1일부터 시행됩니다.</span>
                </h4>
                
                <h3>1. 개인정보의 처리 목적</h3>
                <p><spring:message code="company.name"/>는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.
                
                <span class="personal_title" style="margin-top:20px;">ㅁ 홈페이지 회원가입 및 관리</span>
                <span>- 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증 등을 목적으로 개인정보를 처리합니다.</span>
                </p>
                
                <h3>2. 개인정보의 처리 및 보유 기간</h3>
                <p><spring:message code="company.name"/>는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.
                    <br/>각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

                <span class="personal_title" style="margin-top:20px;">ㅁ 홈페이지 회원가입 및 관리</span>
                <span>'홈페이지 회원가입 및 관리'와 관련한 개인정보는 수집.이용에 관한 동의일로부터 '사업자, 단체의 회원 탈퇴 시'까지 아래의 이용목적을 위하여만 보유, 이용됩니다.</span>
                <span>- 보유근거 : 홈페이지 회원 신원확인용</span>
                </p>

                <h3>3. 개인정보 수집 항목</h3>
                <p>
                    <span class="personal_title">ㅁ 개인정보 항목 : 이메일(로그인ID), 비밀번호, 이름, 별명</span>
                    <span class="personal_title">ㅁ 수집방법 : 홈페이지 회원가입</span>
                    <span class="personal_title">ㅁ 보유근거 : 홈페이지 회원 신원확인용</span>
                    <span class="personal_title">ㅁ 보유기간 : 회원 탈퇴 시</span>
                </p>

                <h3>4. 개인정보의 파기</h3>
                <p><spring:message code="company.name"/>는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

                <span class="personal_title" style="margin-top:20px;">ㅁ 파기절차</span>
                <span>- 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</span>
                <span class="personal_title">ㅁ 파기기한</span>
                <span>- 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</span>
                <span class="personal_title">ㅁ 파기방법</span>
                <span>- 전자적 파일 형태의 정보를 복원 불가능하도록 완전 삭제, 파기 조치 합니다.</span>
                </p>

                <h3>5. 개인정보 보호책임자</h3>
                <p>
                    <spring:message code="company.name"/>는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
                    <br/>정보주체께서는 <spring:message code="company.name"/>의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 
                    <spring:message code="company.name"/>는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.
                    <span class="personal_title" style="margin-top:20px;">ㅁ 개인정보 보호책임자</span>
                    <span>- 성명 : 김진영</span>
                    <span>- 직책 : 대표</span>
                    <span>- 연락처 : 031-427-1563, aisystems@aisystems.co.kr</span>
                    
                </p>

                <h3>6. 개인정보 처리방침 변경</h3>
                <p>
                    이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 고지할 것입니다.
                </p>
                
                <h3>7. 개인정보의 안전성 확보 조치</h3>
                <p><spring:message code="company.name"/>는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
                
                <span class="personal_title" style="margin-top:20px;">ㅁ 해킹 등에 대비한 기술적 대책</span>
                <span>- <spring:message code="company.name"/>는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</span>
                <span class="personal_title">ㅁ 개인정보의 암호화</span>
                <span>- 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</span>
                <span class="personal_title">ㅁ 개인정보에 대한 접근 제한</span>
                <span>- 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</span>
                </p>

                <h3>8. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</h3>
                
                <p>
                    정보주체는 <spring:message code="company.name"/>에 대해 언제든지 개인정보 열람, 정정, 삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다.
                
                <span>- 제1항에 따른 권리 행사는 <spring:message code="company.name"/>에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편 등을 통하여 하실 수 있으며 <spring:message code="company.name"/>는 이에 대해 지체 없이 조치하겠습니다.</span>
                <span>- 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.
                    <br/>&nbsp;&nbsp;&nbsp;이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</span>
                <span>- 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</span>
                <span>- 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</span>
                <span>- <spring:message code="company.name"/>는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</span>
                </p>
                
                <p>
                <span class="personal_title" style="margin-top:20px;">※ 본 개인정보처리방침은 <spring:message code="company.name"/>(<spring:message code="company.nameEng"/>)의 자산이며, 저작권은 <spring:message code="company.name"/>(<spring:message code="company.nameEng"/>)회사에 귀속 되어있습니다.</span>
                <span class="personal_title">무단 복제 및 참조, 배포, 기타 저작권의 침해행위를 금지합니다. </span>
                </p>
            </div>

        </div>
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>