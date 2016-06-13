package com.whenwhere.board.service;


import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.whenwhere.board.dao.BoardDAO;
import com.whenwhere.board.vo.BoardVO;

import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.util.PaginationVO;

@Service("noticeBoardService")
public class NoticeBoardSVC implements BoardService {
   private static final int ROWCNT = 12;
   
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;

   public boolean insert(BoardVO boardVO) {
      boardVO.setCategory("1");
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      if (boardDAO.insertBoard(boardVO) == 1) {
         return true;
      } else {
         return false;
      }
   }

   public String readBoard(BoardVO boardVO, HttpServletRequest request, Model model) {
      boardVO.setCategory("1");
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      String cmd = request.getParameter("cmd");
      if (cmd == null) {
         hit(boardVO.getNo());
         MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
         if(memberVO!=null)
         boardVO.setAuth(memberVO.getNickname());
         BoardVO boardvo = boardDAO.readBoard(boardVO);
         model.addAttribute("ReadBoard", boardvo);      
         return "board/noticeBoardRead";
      } else {
         BoardVO boardvo = boardDAO.readBoard(boardVO);
         model.addAttribute("updateBoard", boardvo);
         return "board/noticeModify";
      }
   }

   public String delectBoard(BoardVO boardVO) {
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      JSONObject jsonobejct = new JSONObject();
      if (boardDAO.deleteBoard(boardVO) == 1) {
         jsonobejct.put("delect", true);
      } else {
         jsonobejct.put("delect", false);
      }
      return jsonobejct.toJSONString();
   }

   public boolean modify(BoardVO boardVO) {
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      if(boardDAO.modifyBoard(boardVO)==1){
         return true;
      }else{
         return false;
      }   
   }
   public String noticeList(Model model, HttpServletRequest request) {
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      
      String sPageNum = request.getParameter("page");
      if(sPageNum==null) sPageNum="1";
      int pageNum = Integer.parseInt(sPageNum);      
      String boardCode = "1";
      
      model.addAttribute("boardList", boardDAO.noticeList(boardCode,ROWCNT,pageNum));
      
      final int linkSceen = 10; //留곹겕�뒗 紐녾컻媛� 蹂댁씪 寃껋씤吏�
      
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
      return "board/noticeBoard";
      
      
   }
   
   public int getTotalPageCnt(String boardCode, Model model) {
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      model.addAttribute("totalcount", boardDAO.pageTotlaCount(boardCode));
      if (boardDAO.pageTotlaCount(boardCode)% ROWCNT != 0) {
         return boardDAO.pageTotlaCount(boardCode) / ROWCNT +1;
      }
      return boardDAO.pageTotlaCount(boardCode) / ROWCNT;
   }
   
   public void hit(int no){
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      boardDAO.hitBoard(no);   
   }

   public String searchList(HttpServletRequest request, Model model) {
      BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
      BoardVO boardvo = new BoardVO();
      String sPageNum = request.getParameter("page");
      if(sPageNum==null) sPageNum="1";
      int pageNum = Integer.parseInt(sPageNum);      
      String boardCode = "1";
      String searchType = request.getParameter("searchType");
      String keyword = request.getParameter("keyword");
      boardvo.setNo(pageNum);
      boardvo.setCategory(boardCode);
      boardvo.setTitle(searchType);
      boardvo.setContent(keyword);   
      model.addAttribute("searchboardList", boardDAO.noticeSearchList(boardvo));   
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
      return "board/noticeBoard";
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