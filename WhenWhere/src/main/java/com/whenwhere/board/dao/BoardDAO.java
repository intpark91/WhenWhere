package com.whenwhere.board.dao;

import java.sql.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.whenwhere.board.vo.BoardVO;
import com.whenwhere.board.vo.CommentVO;
import com.whenwhere.board.vo.EventVO;
import com.whenwhere.board.vo.ImageVO;

public interface BoardDAO {
	
	public int insertBoard(BoardVO boardVO);
	public BoardVO readBoard(BoardVO boardVO);
	public int deleteBoard(BoardVO boardVO);
	public int modifyBoard(BoardVO boardVO);
	public List<BoardVO> noticeList(@Param("boardCode") String boardCode,@Param("rowcnt") int rowcnt,@Param("pageNum") int pageNum);
	public int pageTotlaCount(@Param("boardCode") String boardCode);
	public void hitBoard(int no);
	public List<BoardVO> noticeSearchList(BoardVO boardvo);
	public int getSearchCnt(BoardVO boardvo);
	public int insertComment(CommentVO commentVO);
	public List<CommentVO> commentList(BoardVO boardVO);
	public int commentdelect(int no);
	public int updatecomment(@Param("no") int no,@Param("comment") String comment);	
	public int inserteventBoard(@Param("title") String title, @Param("content") String content, @Param("auth") String auth, 
			@Param("sDate") Date sdate, @Param("eDate") Date edate, @Param("category") String boardCode,@Param("loc") String loc);
	public int insertImage(ImageVO imageVO);
	public EventVO eventDate(BoardVO boardVO);
	public int eventmodifyBoard(BoardVO boardVO);
	public int dateModify(EventVO eventVO);
	public int inserteventBoard();
	public List<BoardVO> ReviewboardList(@Param("boardCode") String boardCode,@Param("rowcnt") int rowcnt,@Param("pageNum") int pageNum);

}
