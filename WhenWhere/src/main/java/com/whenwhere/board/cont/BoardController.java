package com.whenwhere.board.cont;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.whenwhere.board.vo.ImageVO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value = "/notice")
	public String notice() {
		return "board/noticeBoard";
	}

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
	
	@RequestMapping(value = "/noticeRead")
	public String noticeRead() {
		return "board/noticeBoardRead";
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
	public String ckeditorImageUpload(final HttpServletRequest request, ImageVO imagevo, Model model) {
		Date date = new Date();
		int year = date.getYear() + 1900;
		int month = date.getMonth();
		String monthStr ="";
		
		if(month < 10) monthStr = "0" + month;
		else monthStr = ""+month;
		@SuppressWarnings("deprecation")
		String defaultPath = request.getRealPath("/");
		String fileUploadPathTail = "ckeImage/"+year+""+monthStr;
		String fileUploadPath = defaultPath+"/"+ fileUploadPathTail;
		try{
			MultipartFile file = imagevo.getUpload();
			
		}
		
		return null;
	}
	

}
