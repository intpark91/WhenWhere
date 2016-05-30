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
}
