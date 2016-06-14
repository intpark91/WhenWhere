package com.whenwhere.board.cont;

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

import com.whenwhere.board.service.EventBoardSVC;
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
	@Autowired
	EventBoardSVC eventboardSVC;
	
	
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
	public String reViewWrite(HttpServletRequest request, Model model) {
		String category = request.getParameter("category");
		model.addAttribute("category", category);
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
		return "board/review/reviewModify";		
	}
	
	@RequestMapping(value = "/reviewcommend", method = RequestMethod.POST)
	@ResponseBody
	public String reviewmodify(CommentVO commentVO,Model model,HttpServletRequest request) {				
		return noticeBoardSVC.noticecomment(request,model,commentVO);		
	}
	
	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	@ResponseBody
	public String recommend(Model model,HttpServletRequest request) {				
		return noticeBoardSVC.recommend(request,model);		
	}
	
	@RequestMapping(value = "/event")
	public String event(HttpServletRequest request, Model model) {
		return eventboardSVC.reviewList(model, request);
	}
	@RequestMapping(value = "/eventWrite")
	public String eventWrite(HttpServletRequest request, Model model) {
		String category = request.getParameter("category");
		model.addAttribute("category", category);
		return "board/event/eventWrite";	
	}
	
	@RequestMapping(value = "/eventInsert",method = RequestMethod.POST)
	public String eventInsert(Model model,HttpServletRequest request, @RequestParam(required=false) MultipartFile upload) throws ParseException {
		model.addAttribute("insert", eventboardSVC.insert(model,request));
		return "board/event/eventWrite";	
	}
	
	@RequestMapping(value = "/eventRead")
	public String eventRead(Model model,HttpServletRequest request) {		
		return eventboardSVC.readBoard(request, model);	
	}
	
	@RequestMapping(value = "/eventModify", method = RequestMethod.POST)
	public String eventModify(HttpServletRequest request,Model model) throws ParseException {		
		model.addAttribute("modify", eventboardSVC.modify(request));
		return "board/event/eventModify";		
	}
	
	@RequestMapping(value = "/eventSearch", method = RequestMethod.GET)
	public String evnetSearch(Model model,HttpServletRequest request) {				
		return eventboardSVC.searchList(request,model);		
	}
	
	@RequestMapping(value = "/ckeditorImageUpload")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		ReviewBoardSVC ReviewSVC = new ReviewBoardSVC();
		ReviewSVC.imageUpload(request,response,upload);
	}
}
