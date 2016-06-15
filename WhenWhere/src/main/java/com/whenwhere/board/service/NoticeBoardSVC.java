package com.whenwhere.board.service;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.whenwhere.board.dao.BoardDAO;
import com.whenwhere.board.vo.BoardVO;
import com.whenwhere.board.vo.CommentVO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.util.PaginationVO;

@Transactional
@Service("noticeBoardService")
public class NoticeBoardSVC implements BoardService {
	private static final int ROWCNT = 12;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public boolean insert(BoardVO boardVO) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		if (boardDAO.insertBoard(boardVO) == 1) {
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

			int num = 0;
			if (sNum != null && !sNum.equals("")) {
				num = Integer.parseInt(sNum);
				if (num == 0) {
					MemberVO member = (MemberVO) request.getSession().getAttribute("member");
					boardVO.setAuth(member.getNickname());
					model.addAttribute("ReadBoard", boardDAO.readBoard(boardVO));
					return "board/notice/noticeBoardRead";
				} else {
					boardVO.setNo(num);
					hit(boardVO.getNo());
					model.addAttribute("ReadBoard", boardDAO.readBoard(boardVO));
					model.addAttribute("Noticecomment", boardDAO.commentList(boardVO));
					return "board/notice/noticeBoardRead";
				}
			}
		} else {

			boardVO.setNo(Integer.parseInt(request.getParameter("no")));
			request.getSession().setAttribute("no", boardVO.getNo());
			request.getSession().setAttribute("category", boardVO.getCategory());
			boardVO.setTitle(request.getParameter("title"));
			boardVO.setContent(request.getParameter("content"));
			BoardVO boardvo = boardDAO.readBoard(boardVO);
			model.addAttribute("updateBoard", boardvo);
			return "board/notice/noticeModify";
		}
		return null;
	}

	public String delectBoard(BoardVO boardVO) {

		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		JSONObject jsonobejct = new JSONObject();
		try {
			boardDAO.deleteBoardimage(boardVO);
			boardDAO.deleteboardcomment(boardVO);
			boardDAO.deleterecommend(boardVO);
			boardDAO.deleteBoard(boardVO);
			jsonobejct.put("delect", true);
		} catch (Exception e) {
			jsonobejct.put("delect", false);
			e.printStackTrace();
		}

		return jsonobejct.toJSONString();
	}

	public boolean modify(BoardVO boardVO) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		if (boardDAO.modifyBoard(boardVO) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public String noticeList(Model model, HttpServletRequest request) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);

		String sPageNum = request.getParameter("page");
		if (sPageNum == null)
			sPageNum = "1";
		int pageNum = Integer.parseInt(sPageNum);
		String boardCode = request.getParameter("category");
		model.addAttribute("boardList", boardDAO.noticeList(boardCode, ROWCNT, pageNum));
		final int linkSceen = 10;

		PaginationVO paginationVO = new PaginationVO();
		int resultpage = this.getTotalPageCnt(boardCode, model);
		int linkGroup = (pageNum - 1) / linkSceen + 1;
		int linkEnd = linkGroup * linkSceen;
		int lineBegin = linkEnd - linkSceen + 1;
		if (linkEnd > resultpage)
			linkEnd = resultpage;

		paginationVO.setTotalPage(resultpage);
		paginationVO.setCurrPage(pageNum);
		paginationVO.setLinkBegin(lineBegin);
		paginationVO.setLinkEnd(linkEnd);
		paginationVO.setNext(true);

		model.addAttribute("pagenation", paginationVO);
		return "board/notice/noticeBoard";

	}

	public int getTotalPageCnt(String boardCode, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		model.addAttribute("totalcount", boardDAO.pageTotlaCount(boardCode));
		if (boardDAO.pageTotlaCount(boardCode) % ROWCNT != 0) {
			return boardDAO.pageTotlaCount(boardCode) / ROWCNT + 1;
		}
		return boardDAO.pageTotlaCount(boardCode) / ROWCNT;
	}

	public void hit(int no) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		boardDAO.hitBoard(no);
	}

	public String searchList(HttpServletRequest request, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		BoardVO boardvo = new BoardVO();
		String sPageNum = request.getParameter("page");
		if (sPageNum == null)
			sPageNum = "1";
		int pageNum = Integer.parseInt(sPageNum);
		String boardCode = request.getParameter("category");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		boardvo.setNo(pageNum);
		boardvo.setCategory(boardCode);
		boardvo.setTitle(searchType);
		boardvo.setContent(keyword);
		model.addAttribute("searchboardList", boardDAO.noticeSearchList(boardvo));
		final int linkSceen = 10;
		PaginationVO paginationVO = new PaginationVO();
		int resultpage = this.serachgetTotalPageCnt(boardvo, model);
		int linkGroup = (pageNum - 1) / linkSceen + 1;
		int linkEnd = linkGroup * linkSceen;
		int lineBegin = linkEnd - linkSceen + 1;
		if (linkEnd > resultpage)
			linkEnd = resultpage;
		paginationVO.setTotalPage(resultpage);
		paginationVO.setCurrPage(pageNum);
		paginationVO.setLinkBegin(lineBegin);
		paginationVO.setLinkEnd(linkEnd);
		paginationVO.setNext(true);
		boardvo.setNo(resultpage);
		model.addAttribute("searchVO", boardvo);
		model.addAttribute("searchpagenation", paginationVO);
		return "board/notice/noticeBoard";
	}

	public int serachgetTotalPageCnt(BoardVO boardvo, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		model.addAttribute("totalcount1", boardDAO.getSearchCnt(boardvo));
		if (boardDAO.getSearchCnt(boardvo) % ROWCNT != 0) {
			return boardDAO.getSearchCnt(boardvo) / ROWCNT + 1;
		}
		return boardDAO.getSearchCnt(boardvo) / ROWCNT;
	}

	public String noticecomment(HttpServletRequest request, Model model, CommentVO commentVO) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		commentVO.setBoardCode(request.getParameter("category"));
		JSONObject jsonobject = new JSONObject();
		if (boardDAO.insertComment(commentVO) == 1) {
			jsonobject.put("insert", true);
		} else {
			jsonobject.put("insert", false);
		}
		return jsonobject.toJSONString();
	}

	public String commentdelect(Model model, HttpServletRequest request) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		String sNo = request.getParameter("no");
		int no = Integer.parseInt(sNo);
		JSONObject jsonobject = new JSONObject();
		if (boardDAO.commentdelect(no) == 1) {
			jsonobject.put("cdelete", true);
		} else {
			jsonobject.put("cdelete", false);
		}
		return jsonobject.toJSONString();
	}

	public String updatecomment(Model model, HttpServletRequest request) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		String sNo = request.getParameter("no");
		int no = Integer.parseInt(sNo);
		String comment = request.getParameter("comment");
		JSONObject jsonobject = new JSONObject();
		if (boardDAO.updatecomment(no, comment) == 1) {
			jsonobject.put("update", true);
		} else {
			jsonobject.put("update", false);
		}
		return jsonobject.toJSONString();
	}

	public String recommend(HttpServletRequest request, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		String sNum = request.getParameter("no");
		int no = Integer.parseInt(sNum);
		String nickName = request.getParameter("nickName");
		String boardCode = request.getParameter("category");
		boardDAO.recommend(no, nickName, boardCode);

		return null;
	}

}
