$(document).ready(function() {
    var currentPage = "";
    var totalPages = $('#totalPageCount').val(); // 전체 페이지 수를 설정해주세요.
    var currentCategory = $('#category').val();

    // 페이지 이동 기능 적용
    $(document).on('click', '.pagenation a', function(event) {
        event.preventDefault();
        var targetPage = $(this).data('page');
        if (targetPage !== currentPage) {
            loadJobInfoList(targetPage, currentCategory);
        }

    });

    updatePagination(1, totalPages); // 초기 페이지네이션 설정

    jobTypeKeyword();
    calcDday();

});

// 뉴스 목록을 불러오는 함수
function loadJobInfoList(pageNo, currentCategory) {

    var totalPages = "";

    $.ajax({
        url: '/loadJobInfoList', // 서버의 URL 경로
        type: 'GET',
        data: {
            pageNo: pageNo,
            pageSize: 5,
            category: currentCategory,
        },
        success: function(result) {

            //console.log(result);

            var dataList = $('#'+ currentCategory); // 서버에서 받은 HTML로 뉴스 목록 업데이트

            dataList.empty();

            var jobInfoHtml = "";

            $.each(result, function (index, item) {
                if(index == 0){
                    jobInfoHtml += '<div class="job_type_info">'
                    if(item.pageInfo.categoryNm === null){
                        jobInfoHtml += '<span class="job_type">전체</span>'
                    } else {
                        jobInfoHtml += '<span class="job_type">'+ item.pageInfo.categoryNm +'</span>'
                    }
                    jobInfoHtml += '<span class="job_info_counts">채용정보 <span style="color:#093696;">'+ item.pageInfo.totalListCount +'</span>건</span>'
                    jobInfoHtml += '</div>'
                }
            });

            jobInfoHtml += '<div class="job_group">'

            $.each(result, function (index, item) {

                if(item.jobInfoId !== 0) {
                    // 받은 데이터를 리스트로 표시
                    jobInfoHtml += 
                    '<a href="/jobView?jobInfoId=' + item.jobInfoId + '">' +
                    '<article class="job_box" style="background-image:url("../img/bg_job_company'+ index+'.png")">' +
                        '<div class="job_box_layout">' +
                            '<h3 class="job_box_title">'+ item.companyNameKor + '</h3>' +
                            '<p class="job_box_title">'+ item.jobTitle +'</p>' +
                            '<div class="job_box_dday_area">' +
                            '<p class="job_box_dday">' + item.jobEndDate +'</p>' +
                            '</div>' +
                        '</div>' +
                        '<div class="job_box_layout">' +
                            '<div class="job_box_company_logo">' +
                                '<img src="' + item.companyImg + '">' +
                            '</div>' +
                            '<div class="job_box_company_info">' +
                                '<div class="job_box_type_nm">' + item.jobTypeNm + '</div>' +
                                '<span class="job_detail"><img src="/img/icon_sm_location.png">' + item.jobPlace + '</span>'+
                                '<span class="job_detail"><img src="/img/icon_sm_briefcase.png">' + item.jobCareerTypeNm + '</span>' +
                                '<span class="job_detail"><img src="/img/icon_sm_education.png">' + item.jobEduTypeNm + '</span>' +
                                '<div class="job_box_button">공고 살펴보기</div>' +
                            '</div>' +
                        '</div>' +
                    '</article>' +
                    '</a>'
                }
                
                if(index == 0){
                    totalPages = item.pageInfo.totalPageCount;
                    //console.log("totalPages : " + totalPages);
                    $('#totalPageCount').val(totalPages);
                }
            });
            jobInfoHtml += '</div>'

            dataList.append(jobInfoHtml);

            currentPage = pageNo;
            updatePagination(pageNo, totalPages);

            jobTypeKeyword();
            calcDday();

        },
        error: function() {
            alert('뉴스 목록을 불러오는데 실패했습니다.');
        }
    });
}

// 페이지네이션 업데이트 함수
function updatePagination(currentPage, totalPages) {
    $('#pagenation_area').empty();

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

function jobTypeKeyword() {
    // 직무 키워드 표현
    var originalDiv = $('.job_box_type_nm');
    var content = originalDiv.html();
    var values = content.split(',');
    var newDiv = $('<div class="job_type_nm_area">');

    // 각 값에 대해 새로운 span 요소를 생성하고 추가합니다.
    $.each(values, function(index, value) {
        var span = $('<span class="job_type_nm">').text(value.trim()); // 값의 양쪽 공백을 제거하여 추가합니다.
        newDiv.append(span);
    });

    originalDiv.after(newDiv);
    originalDiv.remove();
}

function calcDday() {
    // dday 계산
    $('.job_box_dday').each(function() {
        var endDateText = $(this).text().substring(0,10); // JSP에서 출력된 원래 날짜 데이터
        
        if(endDateText.substring(0,4) == '9999'){
            $(this).text("채용시까지");
        } else {
            var endDate = new Date(endDateText);
            var TodayDate = new Date();

            // 날짜 차이 계산 (밀리초 단위)
            var timeDiff = endDate.getTime() - TodayDate.getTime();

            // 밀리초를 날짜 단위로 변환하여 D-day 계산
            var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

            if( daysDiff < 0 ){
                $(this).text("마감");
            } else {
                $(this).text("D-" + daysDiff); // 변환된 날짜를 요소에 설정
            }
        }
    });
}