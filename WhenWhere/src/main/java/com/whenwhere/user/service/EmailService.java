package com.whenwhere.user.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.whenwhere.user.vo.EmailVO;

@Service("emailService")
public class EmailService {
	@Autowired
	protected JavaMailSender mailSender;

	public String sendMail(EmailVO email) {
		boolean ok = false;
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.setFrom("some@one.com");
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			mailSender.send(msg);
			ok = true;
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		System.out.println("return : " + jobj.toJSONString());
		return jobj.toJSONString();
	}

	public String certifyEmail(String receiver, HttpSession session) throws Exception {
		EmailVO email = new EmailVO();
		session.setAttribute("receiver", receiver);
		email.setReceiver(receiver);
		email.setSubject("WhenWhereTeam에서 알립니다. WhenWhere회원 가입 인증 링크 입니다.");
		email.setContent("http://192.168.8.13:8088/WhenWhere/user/certify?sessid=" + session.getId());
		return sendMail(email);
	}
}
