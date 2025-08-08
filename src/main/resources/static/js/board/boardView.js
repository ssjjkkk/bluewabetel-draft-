$(document).ready(function(){

    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';

	//Key 값 불러오기
	var boardId = $('#boardId').val();

	// 날짜 포맷팅
	var dbDatetime = $('#modiTime').val();
	$('#modiTime').val(dbDatetime.substring(0, 10).replaceAll('-','.'));

	var boardTypeCd = $('#boardTypeCd').val();
	var categoryTypeEngNm = $('#categoryTypeEngNm').val();
	if(boardTypeCd == 'A' || boardTypeCd == 'B'){
		$('#tab-'+ categoryTypeEngNm).addClass(' active');
	}

	// 서브타이틀 높이 결정
	settingSubtitleRows();

    /*
	 * 게시물 등록
	 */
	$('#boardForm').submit(function(e) { //submit이 발생하면
	
		e.preventDefault();

        if (!confirm("등록하시겠습니까?")) {
            return;
        }
	    
		var formData =  new FormData(document.getElementById('boardForm'));
		
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
					alert("게시글 등록이 완료되었습니다.")
					location.href= "/boardView?boardId="+ result ;
				}
				
		    },
		    error: function(result){
		        alert("에러가 발생했습니다.")
		    }
		 }); //옵션값대로 ajax비동기 동작을 시키고
	     return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});

    /*
	 * 게시물 삭제
	 */
	$('#boardDelBtn').click(function(e) {
		
		var boardType = $('#boardTypeCd').val();

		e.preventDefault();

        if (!confirm("게시물을 삭제 하시겠습니까?")) {
            return;
        }
	    
		var formData =  new FormData(document.getElementById('boardForm'));
		
		//전달 객체 확인
		// formData.forEach(function(value, key) {
		//   console.log("formData / " + key + ": " + value);
		// });
		
	    $.ajax({
			type : 'POST',
		    url: contextRoot + "/boardDelete.do",
		    //dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
			data: formData,
		    processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
		    contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
		    success: function(result){
				
				// 삭제에 성공한 경우
		        if(result == 'fail') {
						alert("삭제 실패하였습니다. 다시 시도해 주세요.");
				} else {
					alert("게시글 삭제가 완료되었습니다.")

					if(boardType == 'A'){
						location.href= "/product?openTabName=Inspection" ;
					} else if(boardType == 'B') {
						location.href= "/case?openTabName=Inspection" ;
						
					} else if(boardType == 'C') {
						location.href= "/notice" ;

					} else if(boardType == 'D') {
						location.href= "/board" ;

					} else if(boardType == 'E') {
						location.href= "/inquiryAdmin" ;
					} else {
						location.href= "/" ;
					}
				}
				
		    },
		    error: function(result){
		        alert("에러가 발생했습니다.")
		    }
		 }); //옵션값대로 ajax비동기 동작을 시키고
	     return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});

});

function settingSubtitleRows() {
	var textarea = document.getElementById('subTitle');
	if(textarea != null) {
		var lines = textarea.value.split('\n').length; // 개행 문자 개수 계산
		textarea.rows = lines; // 계산된 개수를 rows 값으로 설정
	}
}