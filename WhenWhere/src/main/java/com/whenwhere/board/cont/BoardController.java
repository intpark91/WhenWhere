package com.whenwhere.board.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.whenwhere.board.service.NoticeBoardSVC;
import com.whenwhere.board.service.ReviewBoardSVC;
import com.whenwhere.board.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	/*공지 게시판 시작*/
	@Autowired
	NoticeBoardSVC noticeBoardSVC;
	
	@RequestMapping(value = "/notice")
	public String notice(Model model,HttpServletRequest request) {	
		return 	noticeBoardSVC.noticeList(model, request);
	}
	
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewrite(BoardVO boardVO,Model model) {		
		model.addAttribute("insert", noticeBoardSVC.insert(boardVO));
		return "board/write";		
	}
	
	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public String noticeRead(BoardVO boardVO,HttpServletRequest request,Model model) {
		return noticeBoardSVC.readBoard(boardVO,request,model);
	}
	
	@RequestMapping(value = "/noticedelete", method = RequestMethod.POST)
	@ResponseBody
	public String noticedelect(BoardVO boardVO,Model model) {			
		return noticeBoardSVC.delectBoard(boardVO);		
	}
	
	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticemodify(BoardVO boardVO,Model model) {		
		model.addAttribute("modify", noticeBoardSVC.modify(boardVO));
		return "board/noticeModify";		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String noticesearch(Model model,HttpServletRequest request) {		
		
		return noticeBoardSVC.searchList(request,model);		
	}
	
	@RequestMapping(value = "comment", method = RequestMethod.GET)
	public String comment(Model model,HttpServletRequest request) {				
		return noticeBoardSVC.searchList(request,model);		
	}
	

	/*공지 게시판 끝*/
	
	

	@RequestMapping(value = "/review")
	public String review() {
		return "board/reviewBoard";
	}

	@RequestMapping(value = "/event")
	public String event() {
		return "board/eventBoard";
	}

	@RequestMapping(value = "/eventWrite")
	public String eventWrite() {
		return "board/writeEvent";
	}

	@RequestMapping(value = "/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value = "/JSeditor")
	public String JSeditor() {
		return "board/JSeditor";
	}
	
	@RequestMapping(value = "/fileupload")
	public String fileupload() {
		return "board/fileupload";
	}
	
	@RequestMapping(value = "/ckeditorImageUpload")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		ReviewBoardSVC ReviewSVC = new ReviewBoardSVC();
		ReviewSVC.imageUpload(request,response,upload);
	}
}
