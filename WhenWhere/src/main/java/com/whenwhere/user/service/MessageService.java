package com.whenwhere.user.service;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.user.dao.MessageDAO;
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
}
