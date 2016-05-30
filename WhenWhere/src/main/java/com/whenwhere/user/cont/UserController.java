package com.whenwhere.user.cont;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.user.service.UserService;
import com.whenwhere.user.vo.MemberVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("/join")
	@ResponseBody
	public String join(MemberVO member){
		
		return null;
	}

}
