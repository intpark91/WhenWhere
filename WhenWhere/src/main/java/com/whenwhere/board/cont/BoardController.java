package com.whenwhere.board.cont;

<<<<<<< HEAD
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
=======
import java.text.ParseException;

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
import com.whenwhere.board.vo.CommentVO;



@Controller
@RequestMapping("/board")
public class BoardController {
	

	@Autowired
	NoticeBoardSVC noticeBoardSVC;
	@Autowired
	ReviewBoardSVC reviewboardSVC;
	
	
	@RequestMapping(value = "/notice")
	public String notice(Model model,HttpServletRequest request) {			
		return 	noticeBoardSVC.noticeList(model, request);
	}
	
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewrite(BoardVO boardVO,Model model,HttpServletRequest request) {		
		model.addAttribute("insert", noticeBoardSVC.insert(boardVO));
		return "board/notice/noticewrite";		
	}
	
	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public String noticeRead(BoardVO boardVO,HttpServletRequest request,Model model) {
		return noticeBoardSVC.readBoard(request,model);
	}
	
	@RequestMapping(value = "/noticedelete", method = RequestMethod.POST)
	@ResponseBody
	public String noticedelect(BoardVO boardVO,Model model) {			
		return noticeBoardSVC.delectBoard(boardVO);		
	}
	
	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticemodify(BoardVO boardVO,Model model) {		
		model.addAttribute("modify", noticeBoardSVC.modify(boardVO));
		return "board/notice/noticeModify";		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String noticesearch(Model model,HttpServletRequest request) {				
		return noticeBoardSVC.searchList(request,model);		
	}
	
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	@ResponseBody
	public String noticecomment(CommentVO commentVO,Model model,HttpServletRequest request) {				
		return noticeBoardSVC.noticecomment(request,model,commentVO);		
	}
	
	@RequestMapping(value = "/noticewriteform")
	public String noticewriteform(HttpServletRequest request, Model model) { 
	String category = request.getParameter("category");
	model.addAttribute("category", category);
	return "board/notice/noticewrite";
	}	
	
	@RequestMapping(value = "/commentdelect")
	@ResponseBody
	public String commentdelect(Model model,HttpServletRequest request) {
		
	return noticeBoardSVC.commentdelect(model,request);
	}	

	@RequestMapping(value = "/updatecomment",method = RequestMethod.POST)
	@ResponseBody
	public String updatecomment(Model model,HttpServletRequest request) {
		
	return noticeBoardSVC.updatecomment(model,request);
	}	
	/*���� ���� �Խ��� ��*/
		
	/*Ŀ�´�Ƽ �Խ��� ����*/
	@RequestMapping(value = "/commuity")
	public String community(Model model,HttpServletRequest request) {			
		return 	noticeBoardSVC.noticeList(model, request);
	}
	/*Ŀ�´�Ƽ �Խ��� ��*/
	
	/*���� �Խ��� ����*/
	
	@RequestMapping(value = "/review")
	public String review(Model model,HttpServletRequest request) {		
		return reviewboardSVC.reviewList(model, request);
	}
	
	@RequestMapping(value = "/reviewwrite")
	public String reViewWrite() {
		return "board/review/reviewwrite";	
	}
	
	@RequestMapping(value = "/reviewinsert",method = RequestMethod.POST)
	public String reviewinsert(Model model,HttpServletRequest request, @RequestParam(required=false) MultipartFile upload) throws ParseException {
		model.addAttribute("insert", reviewboardSVC.insert(model,request));
		return "board/review/reviewwrite";	
	}
	
	@RequestMapping(value = "/reviewRead")
	public String reviewRead(Model model,HttpServletRequest request) {
		
		return reviewboardSVC.readBoard(request, model);	
	}
	
	@RequestMapping(value = "/reviewmodify", method = RequestMethod.POST)
	public String reviewmodify(HttpServletRequest request,Model model) throws ParseException {		
		model.addAttribute("modify", reviewboardSVC.modify(request));
		return "board/notice/noticeModify";		
	}
	
	/*���� �Խ��� ��*/


>>>>>>> refs/heads/main_js

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
