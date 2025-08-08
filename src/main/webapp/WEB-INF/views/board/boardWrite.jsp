<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<head>
    <!-- Style Sheets-->
    <link rel="stylesheet" type="text/css" href="./css/board.css">
    <script type="text/javascript" src="./js/board/boardWrite.js"></script>
    <!-- CK Editor 4-->
    <script type="text/javascript" src="./js/ckeditor4/ckeditor.js"></script>
</head>
    <div class="sub-hero" style="background-image:url('/img/bg_header.png')"></div>
    <!-- Main Content Section -->
    <div class="main-contents">
        <div class="main-full board-write">
            <div class="breadcrumb">
                <ul>
                    <li>게시글 작성</li>
                </ul>
            </div>
            <input type="hidden" id="typeCdTmp" value="${board.boardTypeCd}">
            <input type="hidden" id="categoryCdTmp" value="${board.categoryTypeCd}">
            <input type="hidden" id="mainYnTmp" value="${board.mainYn}">

            <form id="boardForm" name="boardForm" action="/boardWrite.do" method="POST" enctype="multipart/form-data">
                <span class="title_md margin-0">메뉴</span>
                <select id="boardTypeCd" name="boardTypeCd">
                    <option value="">---메뉴 선택---</option>
                    <c:forEach items="${menuList }" var="menuList" varStatus="i">
                        <option value="${menuList.typeCd}">${menuList.typeName}</option>
                    </c:forEach>
                </select>

                <span class="title_md margin-0">카테고리</span>
                <select id="categoryTypeCd" name="categoryTypeCd">
                    <option value="">---카테고리 선택---</option>
                    <c:forEach items="${categoryList }" var="categoryList" varStatus="i">
                        <option value="${categoryList.typeCd}">${categoryList.typeName}</option>
                    </c:forEach>
                </select>
                
                <span class="title_md margin-0">제목</span>
                <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="${board.title}"/>
                <span class="title_md margin-0">제목(영문)</span>
                <input type="text" id="titleEng" name="titleEng" placeholder="제목(영문)을 입력해주세요" value="${board.titleEng}"/>
                <div class="board_info">
                    <div>
                        <input type="text" id="writer" name="writer" class="board_writer" value="${user.userNickName}">
                        <input type="hidden" id="userUid" name="userUid" value="${user.userUid}">
                        <span class="board_writer"></span>
                        <input type="text" id="regTime" name="regTime" class="board_date" value="">
                        <span class="board_date"></span>
                        <input type="hidden" id="modiTime" name="modiTime" class="board_date" value="">
                        <c:if test="${not empty board.viewCnt}">
                            <span class="board_vcnt">조회수&nbsp;&nbsp;&nbsp;<c:out value="${board.viewCnt}" /></span>
                        </c:if>
                    </div>
                </div>

                <span class="title_md margin-0">부제목</span>
                <div class="board_subtitle">
                    <textarea id="subTitle" name="subTitle" rows="2" placeholder="부제목을 입력해주세요(게시글에 그대로 보여집니다)"><c:out value="${board.subTitle}" /></textarea>
                </div>
                <span class="title_md margin-0">내용</span>
                <div class="board_content">
                    <textarea name="content" id="content"><c:out value="${board.content}" /></textarea>
                </div>
                <span class="title_md margin-0">내용(영문)</span>
                <div class="board_content">
                    <textarea name="contentEng" id="contentEng"><c:out value="${board.contentEng}" /></textarea>
                </div>

                <span class="title_md margin-0">썸네일 이미지</span>

                <c:if test="${not empty board.thumnailImg}">
                    <div class="fileList">
                        <div class="file">
                            <img alt="image file" class="img-thumbnail" src="${board.thumnailImg}">
                        </div>
                    </div>
                </c:if>

                <input type="file" id="thumbnailImgFile" name="thumbnailImgFile" accept="image/*">
                <span class="board_desc">※&nbsp;&nbsp;리스트에 보여질 이미지 파일을 입력합니다. 없는 경우, 내용의 첫번째 이미지가 자동 입력됩니다.</span>

                <div class="attach_file_button_area">
                    <span class="title_md margin-0">첨부파일</span>
                    <div class="attach_file_button">
                        <a onClick="fnAddFileDiv();">+</a>
                        <a onClick="fnDelFileDiv();">-</a>
                    </div>
                </div>

                <div id="fileDiv">
                    <div class="multipleFile">
                        <input type="file" class="file-input" id="attachFile0" name="attachFile0" onchange="fnChngFile(this);" accept="image/*,application/pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv">
                    </div>
                </div>

                <c:if test="${not empty attachList}">
                    <div class="fileList">
                        <c:forEach items="${attachList }" var="attchFile" varStatus="i">
                            <div class="file">
                                <a href="/file/download?fileId=${attchFile.fileId}">
                                    <span><i class="fa-solid fa-file-lines"></i>${attchFile.fileNameOrg}</span>
                                    <c:if test="${attchFile.fileExt == 'png' || attchFile.fileExt == 'jpg' || attchFile.fileExt == 'jpeg' || attchFile.fileExt == 'gif' || attchFile.fileExt == 'bmp'}">
                                        <img alt="image file" class="img-thumbnail" src="/file/download?fileId=${attchFile.fileId}">
                                    </c:if>
                                </a>
                                <button type="button" class="btnFileDel" onClick="fnFileDelete(this, ${attchFile.fileId});">X</button>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </a>

                <span class="title_md margin-0">관련 키워드</span>
                <input type="text" id="keyword" name="keyword" placeholder="콤마(,)로 구분해서 입력해주세요" value="${board.keyword}"/>

                <span class="title_md margin-0">관련 URL1</span>
                <input type="text" id="url1" name="url1" placeholder="http://" value="${board.url1}"/>

                <span class="title_md margin-0">관련 URL2</span>
                <input type="text" id="url2" name="url2" placeholder="http://" value="${board.url2}"/>
                
                <input type="hidden" id="mainYn" name="mainYn" value="N" disabled/>
                <div id="mainYnArea" style="display:none;flex-direction: column;gap: 20px;">
                    <span class="title_md margin-0">메인화면 노출 여부</span>
                    <div class="board_radio">
                        <input type="radio" id="mainYn1" name="mainYn" value="Y">
                        <label for="mainYn1">예</label>
                        <input type="radio" id="mainYn2" name="mainYn" value="N" checked>
                        <label for="mainYn2">아니오</label>
                    </div>
                    <span class="board_desc">※&nbsp;&nbsp;메인페이지 노출 여부를 결정합니다.</span>

                    <span class="title_md margin-0">제품설명</span>
                    <div class="board_subtitle">
                        <textarea id="productDesc" name="productDesc" rows="5" placeholder="메인페이지에 보일 제품 설명을 입력해주세요"><c:out value="${board.productDesc}" /></textarea>
                    </div>

                    <span class="title_md margin-0">제품설명(영문)</span>
                    <div class="board_subtitle">
                        <textarea id="productDescEng" name="productDescEng" rows="5" placeholder="메인페이지에 보일 제품 설명을 영문으로 입력해주세요"><c:out value="${board.productDescEng}" /></textarea>
                    </div>
                </div>
                
                <input type="hidden" id="boardId" name="boardId" value="${board.boardId}"/>
                <input type="hidden" id="delYn" name="delYn" value="N"/>

                <form id="deleteForm">
                    <input type="hidden" id="deleteFileId">
                </form>

                <c:choose>
                    <c:when test="${not empty board.boardId}">
                    <span class="board_button"><input type="submit" id="boardModBtn" class="mainBtn" value="수정"></span>
                    </c:when>
                    <c:otherwise>
                    <span class="board_button"><input type="submit" id="boardNewBtn" class="mainBtn" value="등록"></span>
                    </c:otherwise>
                </c:choose>
        </form>

        </div>
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

<script>
    CKEDITOR.replace('content',
        {
            height: '600px',
            filebrowserUploadUrl:'/imgUpload.do'
        }
    );
    /*ClassicEditor.create( document.querySelector( '#boardContent' ) ); */

    CKEDITOR.replace('contentEng',
        {
            height: '600px',
            filebrowserUploadUrl:'/imgUpload.do'
        }
    );
</script>