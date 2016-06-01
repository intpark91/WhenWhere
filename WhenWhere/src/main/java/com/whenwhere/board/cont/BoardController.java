package com.whenwhere.board.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value = "/smart")
	public String smart() {
		return "board/smarteditor";
	}
	
	@RequestMapping(value = "/insert")
	public String insert() {
		return "board/insert";
	}
	
}
