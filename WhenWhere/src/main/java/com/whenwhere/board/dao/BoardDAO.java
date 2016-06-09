package com.whenwhere.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.whenwhere.board.vo.BoardVO;
import com.whenwhere.util.PaginationVO;

public interface BoardDAO {
	
	public int insertBoard(BoardVO boardVO);
	public BoardVO readBoard(BoardVO boardVO);
	public int deleteBoard(BoardVO boardVO);
	public int modifyBoard(BoardVO boardVO);
	public List<BoardVO> noticeList(@Param("boardCode") String boardCode,@Param("rowcnt") int rowcnt,@Param("pageNum") int pageNum);
	public int pageTotlaCount(String boardCode);
	public void hitBoard(int no);
	public List<BoardVO> noticeSearchList(BoardVO boardvo);
	public int getSearchCnt(BoardVO boardvo);
	
}
