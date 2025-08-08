$(document).ready(function(){

    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';
	insertModiTimeToday();

	document.getElementById('attachFile0').addEventListener('change', function() {
		var allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv'];
		var file = this.files[0];
		var fileName = file.name.toLowerCase();
		var fileExtension = fileName.split('.').pop();
	
		if (!allowedExtensions.includes(fileExtension)) {
			alert('업로드 가능한 파일 형태가 아닙니다.');
			this.value = ''; // 선택한 파일을 초기화
		}
	});

    /*
	 * 게시물 등록
	 */
	$('#boardNewBtn').click(function(e) { //submit이 발생하면
	
		e.preventDefault();

		// 메뉴, 카테고리 필수값 체크
		if(!notNullCheck()) return;

		if(grecaptcha.getResponse() == ""){
			alert("로봇인지 아닌지 확인해주세요.");
			return false;
		}

		// 등록 여부 확인 alert
        if(!confirm("등록하시겠습니까?")) return;

		var formData =  new FormData(document.getElementById('boardForm'));
		
		//게시물 등록일 때는 boardId 제외
		formData.delete('boardId');

		//전달 객체 확인
		// formData.forEach(function(value, key) {
		//   console.log("formData / " + key + ": " + value);
		// });
		
	    $.ajax({
			type : 'POST',
		    url: contextRoot + "/boardWrite.do",
		    //dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
			data: formData,
		    processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
		    contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
		    success: function(result){
				
				// 등록 성공한 경우
		        if(result == 'fail') {
						alert("등록에 실패하였습니다. 다시 시도해 주세요.");
				} else {
					alert("온라인 문의 등록이 완료되었습니다. 담당자가 확인 후 연락드리겠습니다.")
					location.reload();
				}
				
		    },
		    error: function(result){
		        alert("에러가 발생했습니다.")
		    }
		 }); //옵션값대로 ajax비동기 동작을 시키고
	     return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});
});

function notNullCheck() {

	// 카테고리
	var categoryTypeSelected = checkRadioButton('categoryType');
	//console.log("categoryType : " + categoryTypeSelected);
	$('#categoryTypeCd').val(categoryTypeSelected);

	const categoryTypeCd = $('#categoryTypeCd').val();
	if(categoryTypeCd == ""){
		alert("문의분야를 선택해주세요");
		$('#categoryTypeCheck1').focus();
		return false;
	}

	// 제목
	const title = $('#title').val();
	if(title == ""){
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}

	// 연락처
	const phone = $('#writerPhone').val();
	const mail = $('#writerMail').val();
	if(phone == "" && mail == ""){
		alert("연락처와 이메일 중 하나는 필수로 입력해주세요.");
		if(phone == ""){
			$('#writerPhone').focus();
		} else {
			$('#writerMail').focus();
		}
		return false;
	}

	// 허용되지 않는 도메인과 키워드 정의
	const invalidDomains = ["example.com"];
	const invalidKeywords = ["test","Test","example"];

	// 이메일 도메인 확인
	var domainCheck = invalidDomains.some(domain => mail.includes(domain));
	// 이메일 키워드 확인
	var keywordCheck = invalidKeywords.some(keyword => mail.includes(keyword));

	// 이메일 형식 검증
	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	var emailPatternCheck = emailPattern.test(mail);

	if (domainCheck || keywordCheck || !emailPatternCheck) {
		alert("유효한 이메일 주소를 입력해주세요");
		$('#writerMail').focus();
		return false;
	}

	// 개인정보 수집 및 이용 동의 
	const agree = document.getElementById('agree2').checked
	if(!agree){
		alert("개인정보 수집 및 이용 방침에 동의하여야 문의 가능합니다");
		$('#agree2').focus();
		return false;
	}
	
	return true;
}