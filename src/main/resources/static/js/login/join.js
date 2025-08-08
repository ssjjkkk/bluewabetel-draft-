$(document).ready(function() {
    
    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';
    
	/* 필수 항목 입력 검증 */
	// 아이디 검증(idchk)
	var idchk = false;
	// 비밀번호 검증(pwchk)
    var pwchk = false;
	// 비밀번호 검증(pwchkchk)
    var pwchkchk = false;
    // 이름 검증(namechk)
    var namechk = false;
    
    $("#userId").focus();

    /*
    * idchk 아이디 유효여부 확인
    */    
    $("#userId").keyup(function(){
		
        var userId = $(this).val();

		// 이메일 형식 검증
        if(userId.length > 0){
            if(userId.match(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i)){
				// 중복체크
				$.ajax({
					url: contextRoot + "/join/idchk.do",
					data: {userId: userId},
					method: "post",
					success: function(data){
						if(data == 0){
							$("#idchk").text("Ⓞ 사용 가능한 아이디입니다.");
							$("#idchk").addClass("confirm_success").removeClass("confirm_error");
							idchk = true; 
						}else if(data > 0){
							$("#idchk").text("Ⓧ 이미 사용중인 아이디 입니다.");
							$("#idchk").addClass("confirm_error").removeClass("confirm_success");
							idchk = false;
						}
					}
				});
            }else{
                $("#idchk").text("Ⓧ 수신 가능한 올바른 메일주소 형태를 입력해주세요 (예시 : abcd@example.com)");
				$("#idchk").addClass("confirm_error").removeClass("confirm_success");
                idchk = false;
            }
        }
    });
    
    /*
    * pwchk 비밀번호 유효여부 확인
    */ 
    $("#userPw").keyup(function(){
		
        var userPw = $(this).val();
        
        if(userPw.length < 8){
            $("#pwchk").text("Ⓧ 비밀번호는 8글자 이상으로 입력해 주세요.");
            $("#pwchk").addClass("confirm_error").removeClass("confirm_success");
            $("#userpwchk").attr("disabled","disabled");
            pwchk = false;
        }else{
			$("#userpwchk").removeAttr("disabled");
            pwchk = true;
        }
    });
    
    /*
    * pwchkchk 비밀번호 일치여부 확인
    */    
    $("#userpwchk").keyup(function(){
        if($("#userPw").val().length > 8 && $("#userPw").val() == $(this).val()){
            $("#pwchk").text("Ⓞ 비밀번호가 일치합니다.");
            $("#pwchk").addClass("confirm_success").removeClass("confirm_error");
            pwchkchk = true;
        }else{
            $("#pwchk").text("Ⓧ 비밀번호가 일치하지 않습니다.");
            $("#pwchk").addClass("confirm_error").removeClass("confirm_success");
            pwchkchk = false;
        }
    });

    /*
    * namechk 이름 유효여부 확인
    */
    $("#userName").keyup(function(){
        if($(this).val().length > 0){
            if($(this).val().match(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9| ]*$/)){
                $("#namechk").empty();
				$("#userName").removeClass('is-invalid');
                namechk = true;
            }else{
                $("#namechk").text("Ⓧ 영문, 한글, 숫자만 입력해주세요.");
                namechk = false;
            }
        }else{
            $("#namechk").text("Ⓧ 성명을 입력해 주세요.");
            namechk = false;
        }
    });
    
    /*
    * telchk 일반전화번호 유효여부 확인
    */
    $("#userPhone").keyup(function(){
        var tel = $("#userPhone").val().replaceAll('-','');
        
        if(tel.length > 0){
	        if(isNaN(tel)){
	            $("#telchk").text("전화번호를 숫자로 입력해 주세요.");
	            telchk = false;
	        }else{
				$('#userPhone').val(tel.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, '$1-$2-$3'));
	            $("#telchk").text("");
				$("#userPhone").removeClass('is-invalid');
	            telchk = true;
	        }
        }else{
			$("#telchk").empty();
			$("#userPhone").removeClass('is-invalid');
			telchk = true;
		}
    });
    
    $("#joinform").submit(function(e) { //submit이 발생하면
		e.preventDefault();

		if(grecaptcha.getResponse()==""){
			alert("로봇인지 아닌지 확인해주세요.");
			return false;
		}

		// console.log("idchk : " + idchk);
		// console.log("pwchkchk : " + pwchkchk);
		// console.log("namechk : " + namechk);
		
		// 입력항목 검증
        if(idchk * pwchk * pwchkchk * namechk == 0){
            alert("입력 내용을 확인해 주세요.");
            
            if(!idchk){
				$("#userId").focus();
				$("#userId").addClass('is-invalid');
			}else if(!pwchk){
				$("#userPw").focus();
				$("#userPw").addClass('is-invalid');
			}else if(!pwchkchk){
				$("#userpwchk").focus();
				$("#userpwchk").addClass('is-invalid');
			}else if(!namechk){
				$("#userName").focus();
				$("#userName").addClass('is-invalid');
			}else if(!mailchk){
				$("#userMail").focus();
				$("#userMail").addClass('is-invalid');
			}
			
			return false;
			
        }else{

			var agree1 = $('#agree1').val();
			var agree2 = $('#agree2').val();
			var agree3 = $('#agree3').val();

			if(agree1 * agree2 * agree3 == 0){
				alert("약관에 모두 동의 하셔야 가입가능합니다.");
				
				if(!agree1){
					$("#agree1").focus();
					$("#agree1").addClass('is-invalid');
				}else if(!agree2){
					$("#agree2").focus();
					$("#agree2").addClass('is-invalid');
				}else if(!agree3){
					$("#agree3").focus();
					$("#agree3").addClass('is-invalid');
				}
				
				return false;
				
			}else{
				
					var formData =  new FormData(document.getElementById('joinform'));
			
					//전달 객체 확인
					// formData.forEach(function(value, key) {
					// console.log("formData / " + key + ": " + value);
					// });
			
					$.ajax({
						type : 'POST',
						url: contextRoot + "/join/join.do",
						//dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
						data: formData,
						processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
						contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
						success: function(result){
							
							//회원가입 완료
							if(result > 0 ) {
									alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다");
									location.href= "/login";
							} else {
									alert("회원가입에 실패하였습니다.");
							}
							
						},
						error: function(result){
							alert("에러가 발생했습니다.")
						}
					}); //옵션값대로 ajax비동기 동작을 시키고
					return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
			}
        }
    });
    
});