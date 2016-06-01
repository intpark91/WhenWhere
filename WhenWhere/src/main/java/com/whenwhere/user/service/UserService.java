package com.whenwhere.user.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.user.dao.MemberDAO;
import com.whenwhere.user.vo.MemberVO;

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
	
	public String joinMember(MemberVO member){
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		boolean ok = true;
		dao.joinMember(member);
		
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}
	
	public String login(MemberVO member, HttpSession session){
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		boolean ok = false;
		try {
			member.setEmail(URLDecoder.decode(member.getEmail(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println("decoded email : "  + member.getEmail());
		MemberVO loginedMember = dao.login(member);
		if(loginedMember!=null){
			System.out.println("loginedMember is not null");
			ok=true;
			session.setAttribute("member", loginedMember);
		}
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		System.out.println(jobj.toJSONString());
		return jobj.toJSONString();
	}
}
