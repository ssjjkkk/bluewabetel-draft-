$(document).ready(function() {
    
    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';

	/* 회원등급 세팅 */
	//회원 명수 만큼 반복
	var userlistCount = $('#userlistCount').val();
	for (var i = 1; i <= userlistCount; i++){  
		var typeCdTmp = $('#userTypeCdTmp'+ i).val();
		const typeEl = document.getElementById('userTypeCd'+i);  //select box
		const typelen = typeEl.options.length;
		//select box의 option 갯수만큼 for문 돌림
		for (let i=0; i<typelen; i++){  
			//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
			if(typeEl.options[i].value == typeCdTmp){
				typeEl.options[i].selected = true;
			}
		}
	}
    
    $("#userform").submit(function(e) { //submit이 발생하면
		e.preventDefault();

		var userlist = document.getElementById("user_list");
		var userData = [];

		for (var i = 1; i < userlist.rows.length; i++) {
			var row = userlist.rows[i];
			userData.push({
							"userUid" : row.id,
							"userId" : row.cells[1].innerText, 
							"userName" : row.cells[2].innerText,
							"userNickName" : row.cells[3].innerText,
							"userTypeCd" : row.cells[4].querySelector('select').value,
							"delYn": "N"
						} );
		}

		$.ajax({
			type : 'POST',
			url: contextRoot + "/userlist/update.do",
			//dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
			data: JSON.stringify(userData),
			processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
			contentType: 'application/json', // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
			success: function(result){
				//회원정보 수정 완료
				if(result > 0 ) {
					alert("회원정보 수정이 완료되었습니다.");
					location.reload();
				} else {
						alert("회원정보 수정에 실패하였습니다.");
				}
			},
			error: function(result){
				alert("에러가 발생했습니다.")
			}
		}); //옵션값대로 ajax비동기 동작을 시키고
		return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
    });
    
});