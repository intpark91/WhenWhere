package com.whenwhere.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.user.dao.MessageDAO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.user.vo.MessageVO;

@Service
public class MessageService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String sendMsg(MessageVO msg){
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		dao.sendMsg();

		boolean ok = true;
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}
	
	public List<MessageVO> getMsgList(HttpSession session){
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println(member.getEmail());
		List<MessageVO> msgList = dao.getMsgList(member.getEmail());
		System.out.println(msgList.size());
		return msgList;
	}
}
