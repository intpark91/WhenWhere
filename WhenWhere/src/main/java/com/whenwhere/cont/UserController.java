package com.whenwhere.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class UserController {

	@RequestMapping(value="/main")
	public String main(){
		return "home/main";
	}
	
	@RequestMapping(value="/epilogue")
	public String epilogue(){
		return "board/epilogueBoard";
	}
	
	@RequestMapping(value="/boardlist")
	public String boardlist(){
		return "board/noticeboard";
	}
	
	@RequestMapping(value="/boardwrite")
	public String boardwrite(){
		return "board/boardwrite";
	}
	
	@RequestMapping(value="/eventboardwrite")
	public String eventboardwrite(){
		return "board/eventboardwrite";
	}
}
