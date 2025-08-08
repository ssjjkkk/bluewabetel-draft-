package com.bluewavetel.portal.board;

import java.util.List;

import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.FileDto;
import com.bluewavetel.dto.PageDto;

public interface BoardSvi {
	/** 게시물 등록 */
	int insertBoard(BoardDto boardDto) throws Exception;
	/** 게시물 수정 */
	int updateBoard(BoardDto boardDto) throws Exception;
	/** 게시물 조회 */
	BoardDto selectBoardById(String boardId);
	/** 게시물 삭제 */
	int deleteBoard(BoardDto boardDto);
	
	/* 게시물 조회수 +1 */
	int updateViewCnt(String boardId);
	
	/** 게시물 카운트 조회 */
	PageDto selectBoardListCnt(PageDto pageDto);
	
	/** 모든 게시물 조회(Pagenation) */
	List<BoardDto> selectBoardList(PageDto pageDto);
	
	/** Main 게시물 조회 */
	List<BoardDto> selectBoardMain(BoardDto board);
	
	/** 주요 뉴스 조회 */
	List<BoardDto> selectBoardSectionMain();
	
	/** 카테고리별 최근 뉴스 조회 */
	List<BoardDto> selectBoardNew(String string, int i);
	
	/** 이전, 다음 게시글 정보 조회 */
	BoardDto selectPreviousBoard(BoardDto board);
	BoardDto selectNextBoard(BoardDto board);

	/** 게시글 첨부파일 리스트 불러오기 */
	List<FileDto> selectBoardFileList(int boardId);
	
	/** 파일 불러오기 */
	FileDto findFileById(int fileId);
	
	/** 파일 저장하기 */
	boolean saveFile(FileDto boardFile);
	
	/** 파일 삭제하기 */
	boolean deleteFile(int fileUid);
	
	PageDto selectBoardListTagCnt(PageDto pageDto);
	List<BoardDto> selectBoardListTag(PageDto pageDto);
	
}
