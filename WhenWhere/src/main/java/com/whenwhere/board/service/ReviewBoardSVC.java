package com.whenwhere.board.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.whenwhere.board.dao.BoardDAO;
import com.whenwhere.board.vo.BoardVO;
import com.whenwhere.board.vo.EventVO;
import com.whenwhere.board.vo.ImageVO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.util.PaginationVO;




@Service
public class ReviewBoardSVC {
	private static final int ROWCNT = 12;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	String fileUrl=null;
	static File newFile=null; 
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		
		OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Date date = new Date();
        int year = date.getYear() + 1900;
        int month = date.getMonth();
        long time = System.currentTimeMillis();
        String monthStr = "";
        if(month < 10) monthStr="0"+month;
        else monthStr = ""+month;
        
        try{ 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "c:/img/"  + year+""+monthStr+ time+ fileName;
            
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
            
            printWriter = response.getWriter();
            fileUrl = "http://localhost:8088/img/" + year+""+monthStr +time + fileName;
            String fileSaveName = year+monthStr+time+fileName;
            request.getSession().setAttribute("fileUrl", fileUrl);
            request.getSession().setAttribute("fileSaveName", fileSaveName);
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지 업로드 성공'"
                    + ")</script>");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
		
	}
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
		
		Date date = null;
		Date date1 = null;
		DateFormat formatter ; 		 
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = (Date)formatter.parse(sDate);
		date1 = (Date)formatter.parse(eDate);
		java.sql.Date sdate = new java.sql.Date(date.getTime());
		java.sql.Date edate = new java.sql.Date(date1.getTime());		
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
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
				return "board/review/reviewBoardRead";
				}
				else{
				boardVO.setNo(num);	
				hit(boardVO.getNo());
				model.addAttribute("ReadBoard", boardDAO.readBoard(boardVO));
				model.addAttribute("EventDate", boardDAO.eventDate(boardVO));
				model.addAttribute("Noticecomment",boardDAO.commentList(boardVO));
				return "board/review/reviewBoardRead";		
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
			model.addAttribute("updateBoard", boardvo);
			return "board/review/reviewModify";
		}
		return null;
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
		return "board/review/reviewBoard";
		
	}
	
	public int getTotalPageCnt(String boardCode, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		model.addAttribute("totalcount", boardDAO.pageTotlaCount(boardCode));
		if (boardDAO.pageTotlaCount(boardCode)% ROWCNT != 0) {
			return boardDAO.pageTotlaCount(boardCode) / ROWCNT +1;
		}
		return boardDAO.pageTotlaCount(boardCode) / ROWCNT;
	}
	public String recommend(HttpServletRequest request, Model model) {
		BoardDAO boardDAO = sqlSessionTemplate.getMapper(BoardDAO.class);
		String sNum = request.getParameter("no");
		JSONObject jsonobject = new JSONObject();
		int no = Integer.parseInt(sNum);
		String nickName = request.getParameter("nickName");
		String boardCode = request.getParameter("category");
			
		
		
		try{
			if(boardDAO.recommend(no,nickName,boardCode)==1){
				if(boardDAO.updaterecommend(no,boardCode)==1){
					jsonobject.put("recommend", true);
				}
			}
		}catch(Exception e){
			jsonobject.put("recommend", false);
		}
		return jsonobject.toString();
	}
	
}
