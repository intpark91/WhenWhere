package com.whenwhere.user.service;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.user.dao.MemberDAO;

@Service
public class UserService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String nicknameCk(String nickname){
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		int rows=0;
		boolean ok = false;
		try {
			rows = dao.matchNickname(nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(rows>0){
			ok = true;
		}
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}
	
	public String emailCk(String email){
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		int rows=0;
		boolean ok = false;
		try {
			rows = dao.matchEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(rows>0){
			ok = true;
		}
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}
}
