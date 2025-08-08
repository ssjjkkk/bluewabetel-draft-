window.onload = function(){
  // 모바일 헤더
  /*
  const hamburgerButton = document.querySelector('.hamburger');
  const hamburgerButton2 = document.querySelector('.hamburger2');
  const dropdownMenu = document.querySelector('.dropdown-menu');

  hamburgerButton.addEventListener('click', function() {
      dropdownMenu.classList.toggle('active');
  });

  hamburgerButton2.addEventListener('click', function() {
      dropdownMenu.classList.toggle('active');
  });
  */

  $(".ham").on("click",function(){
      $(this).toggleClass('active');

    var menu = document.querySelector('.dropdown-menu');
    
    if (menu.classList.contains('active')) {
        menu.classList.remove('active');
        menu.classList.add('hidden');
        $('header').addClass('act');
    } else {
      menu.classList.add('active');
      menu.classList.remove('hidden');
      $('header').removeClass('act');
    }
  });

  $("#lang").on("click",function(){
    $(this).toggleClass('active');
  });

  var korLink = document.getElementById("langKor");
  korLink.href = addOrUpdateQueryParam("lang", "ko_KR");

  var engLink = document.getElementById("langEng");
  engLink.href = addOrUpdateQueryParam("lang", "en_US");

  // 날짜 포맷팅
  $('.product_box_date').each(function() {
    var originalDate = $(this).text(); // JSP에서 출력된 원래 날짜 데이터
    var convertedDate = originalDate.substring(0, 10).replaceAll('-','.'); // 원하는 형식으로 날짜 변환
    $(this).text(convertedDate); // 변환된 날짜를 요소에 설정
  });

  // input 요소의 keyup 이벤트에 공통된 formatting 함수 적용
  $('input.date-input').keyup(function() {
    var input = $(this).val();
    var formatted = formatDate(input);
    $(this).val(formatted);
  });

  $('input.datetime-input').keyup(function() {
    var input = $(this).val();
    var formatted = formatDateTime(input);
    $(this).val(formatted);
  });

  $('input.phone-input').keyup(function() {
    var input = $(this).val();
    var formatted = formatPhoneNumber(input);
    $(this).val(formatted);
  });

  // 로그아웃
	$('#logoutBtn').click(function (e){

		e.preventDefault();

		var userId = $('#userId').val();

		$.ajax({
			type : 'POST',
			url: "/logout?id=" + userId,
			//dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
			processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
			contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
			success: function(result){
				
				//console.log(result);
				//회원가입 완료
				if(result == 'success' ) {
						alert("로그아웃이 완료되었습니다. 메인 페이지로 이동합니다");
						location.href= "/";
				} else if(result == 'sessionout'){
						alert("세션이 만료되었습니다. 메인 페이지로 이동합니다");
						location.href= "/";
				} else {
            alert("로그아웃에 실패하였습니다.");
        }
				
			},
			error: function(result){
				alert("에러가 발생했습니다.")
			}
		}); //옵션값대로 ajax비동기 동작을 시키고
		return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});
}

/************************FUNCTION *****************************/

// 불러온 값 SelectBox에 적용
function settingTypeCdSelectBox(selectBoxId, value) {
	var typeCdTmp = value;
	const El = document.getElementById(selectBoxId);  //select box
	const len = El.options.length;
	//select box의 option 갯수만큼 for문 돌림
	for (let i=0; i<len; i++){  
		//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
		if(El.options[i].value == typeCdTmp){
			El.options[i].selected = true;
		}
	} 
}

// 불러온 값 raio button에 적용
function settingTypeCdRadio(radioButtonId, value) {
	var typeCdTmp = value;
  $('input[type="radio"]' + radioButtonId + '[value="' + typeCdTmp + '"]').prop('checked', true);
}

function checkRadioButton(name) {
  // 라디오 버튼 그룹을 가져옵니다.
  var radios = document.getElementsByName(name);
  var selectedValue = "";

  // 모든 라디오 버튼을 순회하며 선택된 것이 있는지 확인합니다.
  for (var i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        selectedValue = radios[i].value;
          break;
      }
  }

  return selectedValue;
}

function insertModiTimeToday() {
    // 현재 날짜 구하기
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth()+1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    var today = year + "-" + month + "-" + day;

    // 현재 날짜 세팅
    $('#regTime').val(today);
    $('#modiTime').val(today);
}

function formatDate(dateText) {
    // 숫자만 추출합니다.
    var cleaned = ('' + dateText).replace(/\D/g, '');
    // 추출된 숫자를 포맷에 맞게 변환합니다.
    var match = cleaned.match(/^(\d{4})(\d{2})(\d{2})$/);

    if (match) {
      return match[1] + '-' + match[2] + '-' + match[3];
    } else {
      return cleaned;
    }
}

function formatDateTime(dateText) {
  // 숫자만 추출합니다.
  var cleaned = ('' + dateText).replace(/\D/g, '');
  // 추출된 숫자를 포맷에 맞게 변환합니다.
  var match = cleaned.match(/^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/);

  if (match) {
    return match[1] + '-' + match[2] + '-' + match[3] + ' ' + match[4] + ':' + match[5] + ':' + match[6];
  } else {
    return cleaned;
  }
}

function formatPhoneNumber(phoneNumber) {
    // 숫자만 추출합니다.
    var cleaned = ('' + phoneNumber).replace(/\D/g, '');
    var match = "";

    if(cleaned.length == 9){
      match = cleaned.match(/^(\d{2})(\d{3})(\d{4})$/);
    } else if(cleaned.length == 10) {
      match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
    } else if(cleaned.length == 11) {
      match = cleaned.match(/^(\d{3})(\d{4})(\d{4})$/);
    }
    
    if (match) {
      return match[1] + '-' + match[2] + '-' + match[3];
    }
    return cleaned;
}

// 사업자등록번호 포맷팅
function formatBusiRegNumber(busiReg) {
    // 숫자만 추출합니다.
    var cleaned = ('' + busiReg).replace(/\D/g, '');
    // 추출된 숫자를 포맷에 맞게 변환합니다.
    var match = cleaned.match(/^(\d{3})(\d{2})(\d{5})$/);

    if (match) {
      $("#companyBusiReg").val(match[1] + '-' + match[2] + '-' + match[3]);
    } else {
      $("#companyBusiReg").val(cleaned);
    }
    return;
}

function formatCorpRegNumber(corpReg) {
    // 숫자만 추출합니다.
    var cleaned = ('' + corpReg).replace(/\D/g, '');
    // 추출된 숫자를 포맷에 맞게 변환합니다.
    var match = cleaned.match(/^(\d{6})(\d{7})$/);

    if (match) {
      $("#companyCorpReg").val(match[1] + '-' + match[2]);
    } else {
      $("#companyCorpReg").val(cleaned);
    }
    return;
}

// language 파라미터 유지를 위한 param 관리 함수, 현재 url에서 lang param을 추가하기 위함
function addOrUpdateQueryParam(param, value) {
  var currentUrl = window.location.href;
  var url = new URL(currentUrl);
  //console.log("current URL :" + url);
  var params = new URLSearchParams(url.search);

  // 파라미터 추가 또는 업데이트
  params.set(param, value);
  url.search = params.toString();

  return url.toString();
}

// 스크롤 애니메이션 함수 적용
AOS.init();