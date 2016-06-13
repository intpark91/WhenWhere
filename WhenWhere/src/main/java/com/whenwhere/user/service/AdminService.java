package com.whenwhere.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.user.dao.AdminDAO;
import com.whenwhere.user.dao.MemberDAO;
import com.whenwhere.user.vo.MemberVO;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String getUserList(int page) {
		
		JSONArray jarr = new JSONArray();
		JSONObject jobj = new JSONObject();
		jobj.put("ok", true);
		jarr.add(jobj);
		
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		List<MemberVO> memberList = dao.getUserList();
		
		for(int i=0;i<memberList.size();i++){
			jobj = new JSONObject();
			
			jobj.put("email", memberList.get(i).getEmail());
			jobj.put("phone", memberList.get(i).getPhoneNumber());
			jobj.put("authority", memberList.get(i).getAuthority());
			jobj.put("nickname", memberList.get(i).getNickname());
			
			jarr.add(jobj);
		}
		
		return jarr.toJSONString();
	}

	public String changeUserAuth(String value,String nickname) {
		
		boolean ok = false;
		JSONObject jobj = new JSONObject();
		jobj.put("ok", true);
		
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		int rows = dao.changeUserAuth(value,nickname);

		if (rows > 0) {
			ok = true;
		}
		
		jobj.put("ok", ok);
		
		return jobj.toString();
	}
}
