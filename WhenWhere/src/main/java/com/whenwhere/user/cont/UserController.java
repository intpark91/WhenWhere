package com.whenwhere.user.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.user.service.EmailService;
import com.whenwhere.user.service.MessageService;
import com.whenwhere.user.service.UserService;
import com.whenwhere.user.vo.EmailVO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.user.vo.MessageVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private MessageService msgService;
	
	/*******************************email validator***************************************/
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(String receiver, HttpSession session) throws Exception{
        return emailService.certifyEmail(receiver, session);
    }

	@RequestMapping("/certify")
	public String certified(Model model, HttpServletRequest request, @RequestParam String sessid){
		ServletContext application = request.getServletContext();
		if(application.getAttribute(sessid) == null){model.addAttribute("error", true); return "home/join";}
		HttpSession sess = (HttpSession) application.getAttribute(sessid);
		application.removeAttribute(sessid);
		model.addAttribute("email", sess.getAttribute("receiver"));
		model.addAttribute("status", true);
		return "home/join";
	}

	/**********************************Duplication check**********************************/
	@RequestMapping("/nicknameDupCk")
	@ResponseBody
	public String nicknameCk(@RequestParam String nickname) throws Exception{
        return userService.nicknameCk(nickname);
    }
	
	@RequestMapping("/emailDupCk")
	@ResponseBody
	public String emailDupCk(@RequestParam String email) throws Exception{
        return userService.emailCk(email);
    }

	@RequestMapping("/join")
	@ResponseBody
	public String join(MemberVO member){
		return userService.joinMember(member);
	}
	
	@RequestMapping("/msgPopup")
	public String msgPopup(){
		return "component/msgPopup";
	}
	
	@RequestMapping("/sendMsg")
	@ResponseBody
	public String sendMsg(MessageVO msg){
		return sendMsg(msg);
	}
	
	
}
