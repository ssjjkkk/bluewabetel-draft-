package com.bluewavetel.portal.board;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.bluewavetel.common.CommonSvi;
import com.bluewavetel.dao.CommonDao;
import com.bluewavetel.dto.BoardDto;
import com.bluewavetel.dto.FileDto;
import com.bluewavetel.dto.PageDto;

@Repository
public class BoardSvc implements BoardSvi {
	
    @Autowired
    @Qualifier("commonDAO")
    private CommonDao commonDao;
    
    @Autowired
    private CommonSvi commonSvi;
	
    @Override
	public int insertBoard(BoardDto boardDto) throws Exception{
    	
    	/* html컨텐츠에서 텍스트, 썸네일이미지경로 추출 */
    	boardDto.setContentTxt(commonSvi.htmlContentToText(boardDto.getContent()));
    	boardDto.setContentEngTxt(commonSvi.htmlContentToText(boardDto.getContentEng()));
    	
    	int cnt = commonDao.insert("BoardMapper_insertBoard", boardDto);
    	
    	int result = 0;
    	
		if( cnt > 0) { // 게시물 등록에 성공한 경우
			result = boardDto.getBoardId();
		}
		
		return result;
	}
    
    @Override
	public int updateBoard(BoardDto boardDto) throws Exception{
    	
    	int cnt = 0;
    	
    	/* html컨텐츠에서 텍스트, 썸네일이미지경로 추출 */
    	boardDto.setContentTxt(commonSvi.htmlContentToText(boardDto.getContent()));
    	boardDto.setContentEngTxt(commonSvi.htmlContentToText(boardDto.getContentEng()));
    	
    	if( String.valueOf(boardDto.getBoardId()) != null ) {
	    	cnt = commonDao.update("BoardMapper_updateBoard", boardDto);
    	}
    	int result = 0;
    	
		if( cnt > 0) { // 게시물 등록에 성공한 경우
			result = boardDto.getBoardId();
		}
		
		return result;
	}

	@Override
	public int deleteBoard(BoardDto boardDto) {
    	
    	int cnt = 0;
    	
    	if( boardDto.getBoardId() > 0 ) {
	    	cnt = commonDao.update("BoardMapper_deleteBoard", boardDto);
    	}
		
		return cnt;
	}
	
	@Override
	public PageDto selectBoardListCnt(PageDto pageDto) {
		
		int pageNo = pageDto.getPageNo();
		int pageSize = pageDto.getPageSize();
		
		// 모든 게시물 카운트
		int totalNewsCount = commonDao.select("BoardMapper_selectBoardListCnt", pageDto);
		
		int offset = (pageNo - 1) * pageSize;
		
		// 전체 페이지 갯수 구하기
		int totalPageCount = (int) Math.ceil((double) totalNewsCount / pageSize );
		
		if(totalPageCount == 0) {
			totalPageCount = 1;
		}
		
		pageDto.setOffset(offset);
		pageDto.setTotalPageCount(totalPageCount);
		
		return pageDto;
	}
	
	@Override
	public List<BoardDto> selectBoardList(PageDto pageDto) {
		
		List<BoardDto> boardList = new ArrayList<>();
		
		boardList = commonDao.selectList("BoardMapper_selectBoardList", pageDto);
		
		if(boardList.size() > 0) {
			// 게시글 토탈 카운트 정보 담기
			boardList.get(0).setPageInfo(pageDto);
		}
		
		return boardList;
	}
	
	@Override
	public PageDto selectBoardListTagCnt(PageDto pageDto) {
		
		int pageNo = pageDto.getPageNo();
		int pageSize = pageDto.getPageSize();
		
		// 모든 게시물 카운트
		int totalNewsCount = commonDao.select("BoardMapper_selectBoardListTagCnt", pageDto);
		
		int offset = (pageNo - 1) * pageSize;
		
		// 전체 페이지 갯수 구하기
		int totalPageCount = (int) Math.ceil((double) totalNewsCount / pageSize );
		
		if(totalPageCount == 0) {
			totalPageCount = 1;
		}
		
		pageDto.setOffset(offset);
		pageDto.setTotalPageCount(totalPageCount);
		
		return pageDto;
	}
	
	@Override
	public List<BoardDto> selectBoardListTag(PageDto pageDto) {
		
		List<BoardDto> boardList = new ArrayList<>();
		
		boardList = commonDao.selectList("BoardMapper_selectBoardListTag", pageDto);
		
		if(boardList.size() > 0) {
			// 게시글 토탈 카운트 정보 담기
			boardList.get(0).setPageInfo(pageDto);
		}
		
		return boardList;
	}

	@Override
	public List<BoardDto> selectBoardMain(BoardDto board) {
		
		List<BoardDto> boardList = new ArrayList<>();
		
		boardList = commonDao.selectList("BoardMapper_selectBoardMain", board);
		
		return boardList;
	}

	@Override
	public List<BoardDto> selectBoardSectionMain() {
		
		List<BoardDto> boardList = new ArrayList<>();
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardTypeCd("A");
		boardDto.setNumber(1);
		
		boardList = commonDao.selectList("BoardMapper_selectBoardsRank", boardDto);
		
		//조휘수가 높은 뉴스 노출에서 최근 등록 뉴스로 변경
		//boardList = commonDao.selectList("BoardMapper_selectBoardSectionMain", boardDto);
		
		return boardList;
	}

	@Override
	public List<BoardDto> selectBoardNew(String typeCd, int rank) {
		List<BoardDto> boardList = new ArrayList<>();
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardTypeCd(typeCd);
		boardDto.setNumber(rank);
		
		boardList = commonDao.selectList("BoardMapper_selectBoardsRank", boardDto);
		
		return boardList;
	}

	@Override
	public BoardDto selectBoardById(String boardId) {
		
		BoardDto board = commonDao.select("BoardMapper_selectBoardById", boardId);
		
		return board;
	}

	@Override
	public int updateViewCnt(String boardId) {
		return commonDao.update("BoardMapper_updateViewCnt", boardId);
	}

	@Override
	public BoardDto selectPreviousBoard(BoardDto board) {
		return commonDao.select("BoardMapper_selectPreviousBoard", board);
	}

	@Override
	public BoardDto selectNextBoard(BoardDto board) {
		return commonDao.select("BoardMapper_selectNextBoard", board);
	}
	

	@Override
	public FileDto findFileById(int fileId) {
		return commonDao.select("BoardMapper_selectFileById", fileId);
	}

	@Override
	public List<FileDto> selectBoardFileList(int boardId) {
		return commonDao.selectList("BoardMapper_selectBoardFileAll", boardId);
	}

	@Override
	public boolean saveFile(FileDto boardFile) {
    	boolean result = false;
    	
		int cnt = commonDao.insert("BoardMapper_insertFile", boardFile);
    	
		if( cnt > 0) { // 게시물 등록에 성공한 경우
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteFile(int fileId) {
		boolean result = false;
		
		int cnt = commonDao.update("BoardMapper_deleteFileById", fileId);
		
		if(cnt > 0) {
			result = true;
		}
		
		return result;
	}
	
}
