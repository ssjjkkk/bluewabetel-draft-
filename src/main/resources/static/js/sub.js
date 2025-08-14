$(document).ready(function() {
    var currentCategory = $('#category').val();
    var boardType = $('#boardType').val();
    var searchKeyword = $('#searchKeyword').val();

    // 탭 네임이 있는 경우 탭 활성화
    var openTabName = $('#openTabName').val();
    if(openTabName != null && openTabName != ''){
        //console.log(openTabName)
        openTab('tab-' + openTabName);
    }

    // 페이지네이션 초기화
    var currentPage = $('#currentPage').val();
    if(currentPage == ""){
        currentPage = 1;
    }
    var totalPages = $('#totalPageCount').val(); // 전체 페이지 수를 설정해주세요.
    updatePagination(currentPage, totalPages); // 초기 페이지네이션 설정

    // 페이지 이동 클릭 시 기능 적용
    $(document).on('click', '.pagenation a', function(e) {
        e.preventDefault();
        // 클릭한 페이지 정보
        var targetPage = $(this).data('page');

        const url = new URL(window.location.href);
        const searchParams = url.searchParams;
        const category = searchParams.get('openTabName')

        currentCategory = category;
        boardType = $('#boardType').val();
        searchKeyword = $('#searchKeyword').val();

        // 현재 페이지 정보 불러오기
        currentPage = $('#currentPage').val();
        // console.log("targetPage : " + targetPage);
        // console.log("currentPage : " + currentPage);
        if (targetPage !== currentPage) {
            loadBoardList(targetPage, currentCategory, boardType, searchKeyword);
        }
    });
    
    $('#searchKeyword').on('keydown', function(event){
        const url = new URL(window.location.href);
        const searchParams = url.searchParams;
        const category = searchParams.get('openTabName')

        currentCategory = category;
        boardType = $('#boardType').val();
        searchKeyword = $('#searchKeyword').val();

        if (event.key === 'Enter' || event.keyCode === 13) {
            loadBoardList(1, currentCategory, boardType, searchKeyword);
        }
    });
});

/* Tab Script */
function openTab(tabName) {

  $('#category').val(tabName.replace('tab-',''));
  //console.log("category changed : " + $('#category').val());
  if($('#openTabName') !== null){
    $('#openTabName').val(tabName.replace('tab-',''));
    loadPageTitle();
  }
  
  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName("tab-content");
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }

  // tablinks = document.getElementsByClassName("tab-link");
//  for (i = 0; i < tablinks.length; i++) {
//      tablinks[i].className = tablinks[i].className.replace(" active", "");
//  }

  //console.log(tabName.replace('tab-',''));
  //console.log(document.getElementById(tabName).className);
  // document.getElementById(tabName).className += " active";
//  if (tabName == 'tab-notice') {
//      document.getElementById('noticeSection').style.display = 'inline-flex'
//  }

  document.getElementById(tabName.replace('tab-','')).style.display = "block";
}

// 페이지 변경 시 목록을 불러오는 함수
function loadBoardList(pageNo, currentCategory, boardTypeCd, searchKeyword) {
    // lang
    var url = new URL(window.location.href);
    var params = new URLSearchParams(url.search);
    var lang = params.get("lang");
    if(lang == null) {
       lang = $('#slang').val();
    }
    var title = "";

    // 로딩바 시작
    var loadingBar = $('#loader');

    loadingBar.addClass('active');

    var totalPages = "";
    var pagePerSize = 8;
    if(boardTypeCd == 'A'){
        pagePerSize = 8;
    }else if( boardTypeCd == 'B' || boardTypeCd == 'D'){
        pagePerSize = 10;
    }else if (boardTypeCd == 'C'){
        pagePerSize = 9;
    }

    setTimeout(function(){
        $.ajax({
            url: '/loadBoardList', // 서버의 URL 경로
            type: 'GET',
            data: {
                pageNo: pageNo,
                pageSize: pagePerSize,
                category: currentCategory,
                boardType: boardTypeCd,
                searchKeyword : searchKeyword
            },
            success: function(result) {

                //console.log(result);
                var dataList = "";
                var newsHtml = "";
                var totalPages = "";
                
                if(boardTypeCd == 'A'){ // 제품소개
                    dataList = $('#'+ currentCategory);
                } else if (boardTypeCd == 'B'){ // R&D
                    dataList = $('#'+ currentCategory);
                } else if (boardTypeCd == 'C') { // 뉴스, 공지
                    dataList = $('#'+ currentCategory);
                }

                //비우기
                dataList.empty();
                //console.log(result.length);

                if(result.length == 0){

                    $('#totalPageCount').val(1);
                    if(boardTypeCd == 'A' || (boardTypeCd == 'C' && currentCategory == 'news')){ // 제품소개, 뉴스
                        newsHtml += '<span style="display:inline-block;width:100%;text-align:center;">게시글이 없습니다.</span>'
                    } else {
                        newsHtml += '<tr><td style="text-align:center;">게시글이 없습니다.</td></tr>'
                    }
                } else {
                    if(boardTypeCd == 'A'){ // 제품소개
                        newsHtml += '<div class="product_group">'

                        $.each(result, function (index, item) {
                            if (item.thumnailImg == null || item.thumnailImg == '') {
                                item.thumnailImg = './img/common/noImage.png';
                            }

                            if(lang == "en_US" && item.titleEng != ""){
                                title = item.titleEng;
                            } else {
                                title = item.title;
                            }

                            // 받은 데이터를 리스트로 표시
                            newsHtml += 
                            '<a href="/boardView?boardId=' + item.boardId + '">' +
                            '<article class="product_box">' +
                            '<img src="' + item.thumnailImg + '" width="100%">' +
                            '<div class="product_info">' +
                            '<h3 class="product_box_title">' + title + '</h3>' +
                            '<div class="product_box_subinfo">' +
                            '<p>' + item.subTitle + '</p>' +
                            '</div></div>' +
                            '</article>' +
                            '</a>'
            
                            if(index == 0){
                                totalPages = item.pageInfo.totalPageCount;
                                //console.log("totalPages : " + totalPages);
                                if(totalPages == 0 || totalPages == null){
                                    $('#totalPageCount').val(1);
                                } else {
                                    $('#totalPageCount').val(totalPages);
                                }
                            }
                        });
                        newsHtml += '</div>'
                    } else if (boardTypeCd == 'B'){ //적용사례
                        newsHtml += '<div class="product_group2">'

                        $.each(result, function (index, item) {

                            if(item.thumnailImg == null) {
                                item.thumnailImg = './img/common/noImage.png';
                            }

                            if(lang == "en_US" && item.titleEng != ""){
                                title = item.titleEng;
                            } else {
                                title = item.title;
                            }
                            // 받은 데이터를 리스트로 표시
                            newsHtml += 
                            '<a href="/boardView?boardId=' + item.boardId + '">' +
                            '<article class="product_box" ' +
                            'style="background-image:url(' + item.thumnailImg + ');">'+
                            '<div class="product_info">' +
                            '<h3 class="product_box_title">' + title + '</h3>' +
                            '<div class="product_box_subinfo">' +
                            '<p <span class="product_box_date">' + item.regTime.substring(0,10).replaceAll('-','.') + '</span> | 조회수 : ' + item.viewCnt + '</p>' +
                            '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg>' +
                            '</div></div>' +
                            '</article>' +
                            '</a>'

                            if(index == 0){
                                totalPages = item.pageInfo.totalPageCount;
                                //console.log("totalPages : " + totalPages);
                                if(totalPages == 0 || totalPages == null){
                                    $('#totalPageCount').val(1);
                                } else {
                                    $('#totalPageCount').val(totalPages);
                                }
                            }
                        });
                        newsHtml += '</div>'
                    } else if (boardTypeCd == 'C' && currentCategory == 'news') {
                        newsHtml += '<div class="product_group">'
                        $.each(result, function (index, item) {

                            if (item.thumnailImg == null || item.thumnailImg == '') {
                                item.thumnailImg = './img/common/noImage.png';
                            }

                            if(lang == "en_US" && item.titleEng != ""){
                                title = item.titleEng;
                            } else {
                                title = item.title;
                            }

                            // 받은 데이터를 리스트로 표시
                            newsHtml +=
                            '<a href="/boardView?boardId=' + item.boardId + '">' +
                            '<article class="product_box">' +
                            '<img src="' + item.thumnailImg + '" width="100%">' +
                            '<div class="product_info">' +
                            '<h3 class="product_box_title">' + title + '</h3>' +
                            '<div class="product_box_subinfo">' +
                            '<p>' + item.subTitle + '</p>' +
                            '</div></div>' +
                            '</article>' +
                            '</a>'

                            if(index == 0){
                                totalPages = item.pageInfo.totalPageCount;
                                //console.log("totalPages : " + totalPages);
                                if(totalPages == 0 || totalPages == null){
                                    $('#totalPageCount').val(1);
                                } else {
                                    $('#totalPageCount').val(totalPages);
                                }
                            }
                        });
                        newsHtml += '</div>'
                    } else if (boardTypeCd == 'C' && currentCategory != 'news') {
                        newsHtml += '<colgroup><col width="5%"><col><col width="10%"><col width="5%"></colgroup>'
                        $.each(result, function (index, item) {

                            if(lang == "en_US" && item.titleEng != ""){
                                title = item.titleEng;
                            } else {
                                title = item.title;
                            }

                            // 받은 데이터를 리스트로 표시
                            newsHtml +=
                            '<tr>' +
                            '<td>' + item.number + '</td>' +
                            '<td><a href="/boardView?boardId=' + item.boardId + '">' + title + '</a></td>' +
                            '<td class="product_box_date">' + item.regTime.substring(0,10).replaceAll('-','.') + '</td>' +
                            '<td><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#0085CF"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg></td>' +
                            '</tr>'

                            if(index == 0){
                                totalPages = item.pageInfo.totalPageCount;
                                //console.log("totalPages : " + totalPages);
                                if(totalPages == 0 || totalPages == null){
                                    $('#totalPageCount').val(1);
                                } else {
                                    $('#totalPageCount').val(totalPages);
                                }
                            }
                        });
                        newsHtml += '</div>'
                    } else if (boardTypeCd == 'E'){
                        newsHtml += '<colgroup><col width="5%"><col><col width="10%"><col width="5%"></colgroup>'
                        $.each(result, function (index, item) {

                            if(lang == "en_US" && item.titleEng != ""){
                                title = item.titleEng;
                            } else {
                                title = item.title;
                            }

                            // 받은 데이터를 리스트로 표시
                            newsHtml += 
                            '<tr>' +
                            '<td>' + item.number + '</td>' +
                            '<td><a href="/boardView?boardId=' + item.boardId + '">[' + item.categoryTypeNm + '] ' + title + '</a></td>' +
                            '<td class="product_box_date">' + item.regTime.substring(0,10).replaceAll('-','.') + '</td>' +
                            '<td><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#0085CF"><path d="m547.69-267.69-28.31-28.77L682.92-460H200v-40h482.92L519.38-663.54l28.31-28.77L760-480 547.69-267.69Z"/></svg></td>' +
                            '</tr>'

                            if(index == 0){
                                totalPages = item.pageInfo.totalPageCount;
                                //console.log("totalPages : " + totalPages);
                                if(totalPages == 0 || totalPages == null){
                                    $('#totalPageCount').val(1);
                                } else {
                                    $('#totalPageCount').val(totalPages);
                                }
                            }
                        });
                        newsHtml += '</div>'
                    }
                }

                dataList.append(newsHtml);

                currentPage = pageNo;
                totalPages = $('#totalPageCount').val();

                $('#currentPage').val(pageNo);
                updatePagination(pageNo, totalPages);
            },
            error: function() {
                alert('목록을 불러오는데 실패했습니다.');
            },
            complete: function() {
                loadingBar.removeClass('active');
            }
        });

    }, 1000); // 로딩중을 1초 동안 강제로 노출
}

// 페이지네이션 업데이트 함수
function updatePagination(currentPage, totalPages) {
    $('#pagenation_area').empty();

    // console.log("new currentPage : " + currentPage);
    // console.log("new totalPages : " + totalPages);

    var prevDisabled = (currentPage === 1) ? 'disabled' : '';
    var nextDisabled = (currentPage == totalPages) ? 'disabled' : '';
    
    // 현재 페이지 기준으로 페이지 번호를 동적으로 생성
    var startPage = Math.max(1, currentPage - 2);
    var endPage = Math.min(totalPages, startPage + 4);

    var paginationHtml = '<ul class="pagenation">' +
                            '<li class="page-item ' + prevDisabled + '"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '"><i class="fa-solid fa-chevron-left"></i></a></li>';
                            
    for (var i = startPage; i <= endPage; i++) {
        var activeClass = (i === currentPage) ? 'active' : '';
        paginationHtml += '<li class="page-item ' + activeClass + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
    }

    paginationHtml += '<li class="page-item ' + nextDisabled + '"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '"><i class="fa-solid fa-chevron-right"></i></a></li>' +
                        '</ul>';
    
    $('#pagenation_area').html(paginationHtml);
}

// 탭 변경에 따른 화면 타이틀 변경
function loadPageTitle(){
    const subPath = $('#openTabName').val(); // 'path'

    // lang
    var url = new URL(window.location.href);
    var params = new URLSearchParams(url.search);
    var lang = params.get("lang");
    
    //product / case 구분
    var pathName = url.pathname.replace('/','');
    //console.log(pathName);

    //console.log("Param Language : " + lang);
    if(lang == null) {
       lang = $('#slang').val();
    }
    //console.log("Session Language : " + lang);
    
    var title = "";

    if(lang == "en_US"){
        title = subPath;
    } else {
        if(subPath =='Inspection') {
            title = "비파괴 검사"
        } else if(subPath == 'Analyzer') {
            title = "측정기"
        } else if(subPath == 'Sensor') {
            title = "센서"
        } else if(subPath == 'Etc') {
            title = "기타";
        }
    }
    
    $('#bc').text(title);
    if(pathName == 'case'){
        if(lang == "en_US"){
            $('#h1').text(title + " Applications");
        } else {
            $('#h1').text(title + " 적용사례");
        }
    } else {
        $('#h1').text(title);
    }
}

// To the Top Scroll
window.onscroll = function() {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
      document.getElementById("scrollTopBtn").style.display = "flex";
      if(document.getElementById("logoutBtn") != null) {
        document.getElementById("logoutBtn").style.display = "flex";
      }
    } else {
      document.getElementById("scrollTopBtn").style.display = "none";
      if(document.getElementById("logoutBtn") != null) {
        document.getElementById("logoutBtn").style.display = "none";
      }
    }
}
  
function scrollToTop() {
    document.body.scrollTop = 0; /* For Safari */
    document.documentElement.scrollTop = 0; /* For Chrome, Firefox, IE and Opera */
}