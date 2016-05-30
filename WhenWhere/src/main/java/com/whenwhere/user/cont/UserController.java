package com.whenwhere.user.cont;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.user.service.EmailService;
import com.whenwhere.user.service.UserService;
import com.whenwhere.user.vo.EmailVO;
import com.whenwhere.user.vo.MemberVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/join")
	@ResponseBody
	public String join(MemberVO member){
		
		return null;
	}
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(EmailVO email) throws Exception{
		System.out.println("in send");
    	System.out.println("!!!" + email.getReceiver());
       
        boolean result = emailService.sendMail(email);
        JSONObject jobj = new JSONObject();
        jobj.put("ok", result);
        return jobj.toJSONString();
	}

}
