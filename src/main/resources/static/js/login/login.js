$(document).ready(function(){
    
    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';
	 
    $("#loginId").focus();
	    
	// 페이지 로드 시, 저장된 아이디가 있다면 아이디 입력 필드에 기본값으로 설정
	var rememberedUserId = localStorage.getItem('rememberedUserId');
	if (rememberedUserId) {
		$('#userId').val(rememberedUserId);
		$('#rememberMe').prop('checked','checked');
	}

	$("#userId").keyup(function(){
		$('.id_icon').css('color', 'var(--main-color)');

		if(this.value == ""){
			$('.id_icon').css('color', '#aaa');
		}
    });
    
	$("#userPw").keyup(function(){
		$('.pw_icon').css('color', 'var(--main-color)');

		if(this.value == ""){
			$('.pw_icon').css('color', '#aaa');
		}
    });

    /*
	 * 로그인
	 */
	$('#loginForm').submit(function(e) { //submit이 발생하면
	
		e.preventDefault();
		
		// 아이디와 비밀번호가 입력되지 않은 경우
	    if($("#userId").val().length * $("#userPw").val().length == 0){
	        alert("아이디와 비밀번호를 확인해주세요.");
	        return false;
	    }

		// 아이디 기억하기
		var userId = $('#userId').val();
		var rememberMe = $('#rememberMe').is(':checked');

		if (rememberMe) {
			localStorage.setItem('rememberedUserId', userId);
		} else {
			localStorage.removeItem('rememberedUserId');
		}
	    
		var formData =  new FormData(document.getElementById('loginForm'));
		
		//전달 객체 확인
		// formData.forEach(function(value, key) {
		//   console.log("formData / " + key + ": " + value);
		// });
		
	    $.ajax({
			type : 'POST',
		    url: contextRoot + "/login.do",
		    //dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
			data: formData,
		    processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
		    contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
		    success: function(result){
				
				//아이디 비밀번호가 일치하는 경우
		        if(result == 'success') {
						//alert("로그인 성공!");
						location.href= "/";
				} else {
						alert("아이디 또는 비밀번호가 잘못되었습니다.");
				}
				
		    },
		    error: function(result){
		        alert("에러가 발생했습니다.")
		    }
		 }); //옵션값대로 ajax비동기 동작을 시키고
	     return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});

});


