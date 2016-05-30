package com.whenwhere.user.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.whenwhere.user.vo.EmailVO;

@Service("emailService")
public class EmailService {
	@Autowired
	protected JavaMailSender mailSender;

	public boolean sendMail(EmailVO email) throws Exception {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.setFrom("someone@paran.com"); // 송신자를 설정해도 소용없지만 없으면 오류가 발생한다
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));

			mailSender.send(msg);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean certifyEmail(String receiver, HttpSession session) throws Exception {
		EmailVO email = new EmailVO();
		email.setReceiver(receiver);
		email.setSubject("Email 인증 요청입니다.");
		email.setContent("http://192.168.8.13:8088/myBoard_spring/join/certify?sessid=" + session.getId());
		return sendMail(email);
	}
}
