
let fileMaxCnt = 3;
let fileMaxSize = 10485760;
//let deleteFileIdArr = [];
	/*
	파일 등록 최대 개수는 3개
	파일 사이즈는 10MB
	파일 허용 확장자는 jpg, jpeg, png
	(properties로 관리하는게 더 용이하다.)*/

function fnAddFileDiv() {
	let orgFileDiv = $(".multipleFile");
    let fileDivCnt = $(".file-input").length;

    if (fileDivCnt >= fileMaxCnt) {
        alert("파일 등록 최대 갯수는 3개 입니다.");
        return false;
    }

    let copyFileDiv = orgFileDiv.first().clone(true);

    copyFileDiv.find("input").val("");
    copyFileDiv.find("input").attr("id", "attachFile" + fileDivCnt);
    copyFileDiv.find("input").attr("name", "attachFile" + fileDivCnt);

    $("#fileDiv").append(copyFileDiv);
}

function fnDelFileDiv() {
    if ($(".multipleFile").length <= 1) {
        return false;
    }
    $(".multipleFile")[$(".multipleFile").length - 1].remove();
}

function fnChngFile(obj) {
    let fileObj = $(obj)[0];
    let fileVal = fileObj.files[0].name;
    let fileSize = fileObj.files[0].size;
    let fileExt = fileVal.substring(fileVal.lastIndexOf(".") + 1, fileVal.length);
    let flag = true;

    if (fileSize > fileMaxSize) {
        alert("첨부파일 사이즈는 10MB까지 가능합니다.");
    } else {
        flag = false;
    }

    if (flag) {
        $(obj).val("");
    }
}

function fnFileDelete(obj, id) {
    if (confirm("파일을 삭제하시겠습니까? 게시글 수정 시 반영됩니다.")) {
        $(obj).parents(".file").remove();
        var deleteFileId = $('#deleteFileId').val();
		if(deleteFileId != "") {
			deleteFileId += "," + id;
		} else {
			deleteFileId += id;
		}
		
		$('#deleteFileId').val(deleteFileId);
    }
}


$(document).ready(function(){

    //URL 경로 조정
    //URL 경로가 복잡해질 경우 등 contextRoot 경로 설정 시에 사용
    var contextRoot = '';
	insertModiTimeToday();

	$('#boardTypeCd').change(function(e) {
		categoryTypeCheck();
	});

	$('#categoryTypeCd').change(function(e) {
    categoryTypeCheck();
  });
	
    /*
	 * 게시물 등록
	 */
	$('#boardNewBtn').click(function(e) { //submit이 발생하면
	
		e.preventDefault();

		// 메뉴, 카테고리 필수값 체크
		if(!notNullCheck()) return;
		// 등록 여부 확인 alert
        if(!confirm("등록하시겠습니까?")) return;

		CKEDITOR.instances.content.updateElement();
		CKEDITOR.instances.contentEng.updateElement();
	    
		var formData =  new FormData(document.getElementById('boardForm'));
		
		//게시물 등록일 때는 boardId 제외
		formData.delete('boardId');

		//전달 객체 확인
		formData.forEach(function(value, key) {
		  console.log("formData / " + key + ": " + value);
		});
		
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

	/* 수정 화면인 경우, selectbox값을 세팅 */
	// 불러온 boardId가 있으면 
	var boardId = $('#boardId').val();

	if(boardId != null){
		/* 메뉴 세팅 */
		var typeCdTmp = $('#typeCdTmp').val();
		const typeEl = document.getElementById('boardTypeCd');  //select box
		const typelen = typeEl.options.length;
		//select box의 option 갯수만큼 for문 돌림
		for (let i=0; i<typelen; i++){  
			//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
			if(typeEl.options[i].value == typeCdTmp){
				typeEl.options[i].selected = true;
			}
		}  
		
		/* 카테고리 세팅 */
		var categoryCdTmp = $('#categoryCdTmp').val();
		const categotyEl = document.getElementById('categoryTypeCd');  //select box
		const categorylen = categotyEl.options.length; //select box의 option 갯수
		//select box의 option 갯수만큼 for문 돌림
		for (let i=0; i<categorylen; i++){  
			//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
			if(categotyEl.options[i].value == categoryCdTmp){
				categotyEl.options[i].selected = true;
			}
		}

		categoryTypeCheck();

		/* 메인화면 노출여부 세팅 */
		var mainYn = $('#mainYnTmp').val();
		if (mainYn === 'Y') {
			$('#mainYn1').prop('checked', true);
		  } else {
			$('#mainYn2').prop('checked', true);
		  }
	}

    /*
	 * 게시물 수정
	 */
	$('#boardModBtn').click(function(e) { //submit이 발생하면
	
		e.preventDefault();

		// 메뉴, 카테고리 필수값 체크
		if(!notNullCheck()) return;
		// 수정 여부 확인 alert
        if (!confirm("게시글을 수정하시겠습니까?")) return;
	    
		CKEDITOR.instances.content.updateElement();
		CKEDITOR.instances.contentEng.updateElement();

		var formData =  new FormData(document.getElementById('boardForm'));

		var deleteFileIdArr = $('#deleteFileId').val();

		if (deleteFileIdArr.length > 0) {
			$.ajax({
				url: "/file/delete.do",
				type: 'POST',
				data: { 'deleteFileIdArr' : deleteFileIdArr },
				success: function(result) {
					if (result) {
						submitModifyForm(formData);
					} else {
						alert("문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		} else {
			submitModifyForm(formData);
		}

		return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});
});

function submitModifyForm(formData){
	//전달 객체 확인
	// formData.forEach(function(value, key) {
	// 	console.log("formData / " + key + ": " + value);
	// });
	
	// 수정 submit
	$.ajax({
		type : 'POST',
		url: "/boardModify.do",
		//dataType : 'multipart/form-data', 'json' 중에 선택가능, dataType을 정의하면 Ajax return값이 Controller에서 정의한 형식으로 돌아오지 않아서 주석처리함
		data: formData,
		processData: false, // processData를 false로 설정하여 FormData가 자동으로 처리되지 않도록 함
		contentType: false, // contentType을 false로 설정하여 jQuery가 Content-Type 헤더를 설정하지 않도록 함
		success: function(result){
			
			// 등록 성공한 경우
			if(result == 'fail') {
					alert("수정에 실패하였습니다. 다시 시도해 주세요.");
			} else {
				alert("게시글 수정이 완료되었습니다.")
				location.href= "/boardView?boardId="+ result;
			}
		},
		error: function(result){
			alert("에러가 발생했습니다.")
		}
	});
}

function categoryTypeCheck() {
	console.log($('#boardTypeCd').val());
	$('#categoryTypeCd option').toArray().forEach(option => {
      console.log('머임');
      if (option.style.display == 'none') {
          option.style.display = 'revert'
      }
  })
	if($('#boardTypeCd').val() !== 'A' && $('#boardTypeCd').val() !== 'C'){
		$('#categoryTypeCd').prop('disabled','disabled');
		document.getElementById('mainYnArea').style.display = "none";
		$('#mainYn').prop('disabled','');
		$('input[type=radio][name=mainYn]').prop('disabled','disabled');
	} else {
		$('#categoryTypeCd').prop('disabled','');
		if($('#boardTypeCd').val() == 'A'){
			document.getElementById('mainYnArea').style.display = "inline-flex";
			$('#mainYn').prop('disabled','disabled');
			$('input[type=radio][name=mainYn]').prop('disabled','');
			$('#categoryTypeCd option').toArray().forEach(option => {
			    if (option.value == '6' || option.value == '7') {
			      option.style.display = 'none'
			    }
			})
		} else if ($('#boardTypeCd').val() == 'C') {
      $('#categoryTypeCd option').toArray().forEach(option => {
          if (option.value !== '6' && option.value !== '7') {
            option.style.display = 'none'
          }
      })
      if ($('#categoryTypeCd').val() == '6') {
        document.getElementById('mainYnArea').style.display = "inline-flex";
        $('#mainYn').prop('disabled','disabled');
        $('input[type=radio][name=mainYn]').prop('disabled','');
      }
		}else {
			$('#mainYn').prop('disabled','');
			$('input[type=radio][name=mainYn]').prop('disabled','disabled');
		}
	}
}

function notNullCheck() {
	// 메뉴 
	const boardTypeCd = $('#boardTypeCd').val();
	if(boardTypeCd == ""){
		alert("메뉴를 선택해주세요");
		$('#boardTypeCd').focus();
		return false;
	}

	// 카테고리
	const categoryTypeCd = $('#categoryTypeCd').val();
	if((boardTypeCd == "A" || boardTypeCd == "C") && categoryTypeCd == ""){
		alert("카테고리를 선택해주세요");
		$('#categoryTypeCd').focus();
		return false;
	}

	// 제목
	const title = $('#title').val();
	if(title == ""){
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	
	return true;
}