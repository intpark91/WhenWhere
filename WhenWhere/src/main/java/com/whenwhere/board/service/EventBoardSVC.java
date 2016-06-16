package com.whenwhere.board.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.whenwhere.board.dao.BoardDAO;
import com.whenwhere.board.vo.BoardVO;
import com.whenwhere.board.vo.EventVO;
import com.whenwhere.board.vo.ImageVO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.util.PaginationVO;




@Service
public class EventBoardSVC {
	private static final int ROWCNT = 12;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public boolean insert(Model model, HttpServletRequest request) throws ParseException {
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		String auth = request.getParameter("auth");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String boardCode = request.getParameter("category");
		String loc = request.getParameter("location");
		String fileurl = (String)request.getSession().getAttribute("fileUrl");
		String fileSaveName = (String)request.getSession().getAttribute("fileSaveName");
		ImageVO imageVO = new ImageVO();
		imageVO.setBoardCode(boardCode);				
		imageVO.setFileName(fileurl);		
		Date date = null;
		Date date1 = null;
		DateFormat formatter; 		 
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = (Date)formatter.parse(sDate);
		date1 = (Date)formatter.parse(eDate);
		java.sql.Date sdate = new java.sql.Date(date.getTime());
		java.sql.Date edate = new java.sql.Date(date1.getTime());		
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		if(content.equals("")){
			return false;
		}
		
		if (boardDAO.inserteventBoard(title,content,auth,sdate,edate,boardCode,loc,fileSaveName) > 0) {
			return true;
		} else {
			return false;
		}
	}
	public String readBoard(HttpServletRequest request, Model model) {
		BoardVO boardVO = new BoardVO();		
		boardVO.setCategory(request.getParameter("category"));
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		String cmd = request.getParameter("cmd");		
		if (cmd == null) {
			String sNum = request.getParameter("no");
			
			int num=0;
			if(sNum!=null&&!sNum.equals("")){
				num = Integer.parseInt(sNum);
				if(num==0){
				MemberVO member = (MemberVO)request.getSession().getAttribute("member");
				boardVO.setAuth(member.getNickname());	
				model.addAttribute("ReadBoard", boardDAO.readBoard(boardVO));
				model.addAttribute("EventDate", boardDAO.eventDate(boardVO));				
				return "board/event/eventBoardRead";
				}
				else{
				boardVO.setNo(num);	
				hit(boardVO.getNo());
				model.addAttribute("ReadBoard", boardDAO.readBoard(boardVO));
				model.addAttribute("EventDate", boardDAO.eventDate(boardVO));
				model.addAttribute("Noticecomment",boardDAO.commentList(boardVO));
				return "board/event/eventBoardRead";		
				}
			}				
		} else {
			boardVO.setNo(Integer.parseInt(request.getParameter("no")));
			request.getSession().setAttribute("no", boardVO.getNo());
			request.getSession().setAttribute("category", boardVO.getCategory());
			
			boardVO.setTitle(request.getParameter("title"));
			model.addAttribute("EventDate", boardDAO.eventDate(boardVO));
			boardVO.setContent(request.getParameter("content"));			
			BoardVO boardvo = boardDAO.readBoard(boardVO);	
			model.addAttribute("location", this.location(request));
			model.addAttribute("updateBoard", boardvo);
			return "board/event/eventModify";
		}
		return null;
	}
	
	public List<HashMap<String,Object>> location(HttpServletRequest request) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);		
		return boardDAO.getSubLocationList();
	}
	public void hit(int no){
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		boardDAO.hitBoard(no);	
	}
	
	public boolean modify(HttpServletRequest request) throws ParseException {
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		BoardVO boardVO = new BoardVO();
		boardVO.setNo(Integer.parseInt(request.getParameter("no")));
		boardVO.setTitle(request.getParameter("title"));
		boardVO.setContent(request.getParameter("content"));
		boardVO.setAuth(request.getParameter("auth"));
		boardVO.setCategory(request.getParameter("category"));
		EventVO eventVO = new EventVO();
		Date date = null;
		Date date1 = null;
		DateFormat formatter ; 		 
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = (Date)formatter.parse(sDate);
		date1 = (Date)formatter.parse(eDate);
		java.sql.Date sdate = new java.sql.Date(date.getTime());
		java.sql.Date edate = new java.sql.Date(date1.getTime());		
		eventVO.setLoc(request.getParameter("location"));
		eventVO.seteDate(edate);
		eventVO.setsDate(sdate);
		eventVO.setNo(Integer.parseInt(request.getParameter("eno")));		
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		if(boardDAO.eventmodifyBoard(boardVO)==1&&boardDAO.dateModify(eventVO)==1){
			return true;
		}else{
			return false;
		}	
	}
	public String reviewList(Model model, HttpServletRequest request) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);		
		String sPageNum = request.getParameter("page");
		if(sPageNum==null) sPageNum="1";
		int pageNum = Integer.parseInt(sPageNum);			
		String boardCode = request.getParameter("category");				
		model.addAttribute("ReviewboardList", boardDAO.ReviewboardList(boardCode,ROWCNT,pageNum));		
		final int linkSceen = 10; 		
		PaginationVO paginationVO = new PaginationVO();
		int resultpage = this.getTotalPageCnt(boardCode,model); 	
		int linkGroup =(pageNum-1)/linkSceen+1;
		int linkEnd = linkGroup*linkSceen;
		int lineBegin = linkEnd-linkSceen+1;
		if(linkEnd>resultpage)linkEnd=resultpage;
		
		paginationVO.setTotalPage(resultpage);
		paginationVO.setCurrPage(pageNum);
		paginationVO.setLinkBegin(lineBegin);
		paginationVO.setLinkEnd(linkEnd);			
		paginationVO.setNext(true);
				
		model.addAttribute("pagenation", paginationVO);
		return "board/event/eventBoard";
		
	}
	
	public int getTotalPageCnt(String boardCode, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		model.addAttribute("totalcount", boardDAO.pageTotlaCount(boardCode));
		if (boardDAO.pageTotlaCount(boardCode)% ROWCNT != 0) {
			return boardDAO.pageTotlaCount(boardCode) / ROWCNT +1;
		}
		return boardDAO.pageTotlaCount(boardCode) / ROWCNT;
	}
	
	 public String searchList(HttpServletRequest request, Model model) {
	      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
	      BoardVO boardvo = new BoardVO();
	      String sPageNum = request.getParameter("page");
	      if(sPageNum==null) sPageNum="1";
	      int pageNum = Integer.parseInt(sPageNum);      
	      String boardCode = request.getParameter("category");	
	      String searchType = request.getParameter("searchType");
	      String keyword = request.getParameter("keyword");
	      boardvo.setNo(pageNum);
	      boardvo.setCategory(boardCode);
	      boardvo.setTitle(searchType);
	      boardvo.setContent(keyword);   
	      model.addAttribute("searchboardList", boardDAO.eventSearchList(pageNum,boardCode,searchType,keyword,ROWCNT));   
	      final int linkSceen = 10;   
	      PaginationVO paginationVO = new PaginationVO();
	      int resultpage = this.serachgetTotalPageCnt(boardvo,model); 
	      int linkGroup =(pageNum-1)/linkSceen+1;
	      int linkEnd = linkGroup*linkSceen;
	      int lineBegin = linkEnd-linkSceen+1;
	      if(linkEnd>resultpage)linkEnd=resultpage;   
	      paginationVO.setTotalPage(resultpage);
	      paginationVO.setCurrPage(pageNum);
	      paginationVO.setLinkBegin(lineBegin);
	      paginationVO.setLinkEnd(linkEnd);         
	      paginationVO.setNext(true);
	      boardvo.setNo(resultpage);      
	      model.addAttribute("searchVO", boardvo);
	      model.addAttribute("searchpagenation", paginationVO);
	      return "board/event/eventBoard";
}

  public int serachgetTotalPageCnt(BoardVO boardvo, Model model) {
	      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
	      model.addAttribute("totalcount1", boardDAO.getSearchCnt(boardvo));      
	      if (boardDAO.getSearchCnt(boardvo) % ROWCNT != 0) {		    	
	         return boardDAO.getSearchCnt(boardvo) / ROWCNT + 1;
	      }	    
	      return boardDAO.getSearchCnt(boardvo) / ROWCNT;
	   }
	
}
