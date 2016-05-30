package com.whenwhere.user.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String sendEmail(String receiver, HttpSession session) throws Exception{
		session.setAttribute("receiver", receiver);
		boolean ok = emailService.certifyEmail(receiver, session);
        JSONObject jobj = new JSONObject();
        jobj.put("ok", ok);
        return jobj.toJSONString();
    }

	@RequestMapping("/certify")
	public String certified(Model model, HttpServletRequest request, @RequestParam String sessid){
		ServletContext application = request.getServletContext();
		System.out.println(sessid);
		if(application.getAttribute(sessid) == null){model.addAttribute("error", true); return "home/join";}
		
		HttpSession sess = (HttpSession) application.getAttribute(sessid);
		application.removeAttribute(sessid);
		model.addAttribute("email", sess.getAttribute("email"));
		model.addAttribute("status", true);
		return "home/join";
	}
}
