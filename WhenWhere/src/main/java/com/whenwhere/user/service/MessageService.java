package com.whenwhere.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.whenwhere.user.dao.MessageDAO;
import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.user.vo.MessageVO;
import com.whenwhere.util.PaginationVO;

@Service
public class MessageService {

	private static final int ROWCNT = 10;
	private static final int LINKCNT = 5;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String sendMsg(MessageVO msg) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		dao.sendMsg();

		boolean ok = true;
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}

	public PaginationVO getTotalPages(HttpSession session) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		PaginationVO pagination = new PaginationVO();
		
		if (member == null) {
			System.out.println("session에 로그인 된 회원이없음");
			return null;
		}
		
		int totalRows = dao.getRowsByReceiver(member.getEmail());
		
		pagination.setTotalPage(totalRows/ROWCNT);
		System.out.println(pagination.getTotalPage());
		
		
		return pagination;
	}

	public void getMsgList(Model model, HttpSession session, int page) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		PaginationVO pn = new PaginationVO();
		if (member == null) {
			System.out.println("session에 로그인 된 회원이없음");
			return;
		}
		List<MessageVO> msgList = dao.getMsgList(member.getEmail(), ROWCNT, page);
		
		
		int totalRows = dao.getRowsByReceiver(member.getEmail());
		int totalPages = totalRows/ROWCNT+1;
		int nav = (page-1)/LINKCNT+1;
		
		pn.setTotalPage(totalPages);
		pn.setLinkCnt(LINKCNT);
		pn.setRows(ROWCNT);
		pn.setCurrPage(page);
		pn.setLinkBegin((nav-1)*LINKCNT+1);
		if(totalPages<nav*LINKCNT){
			pn.setLinkEnd(totalPages);
		}else{
			pn.setLinkEnd(nav*LINKCNT);
		}
		
		if(nav>1) pn.setPrev(true); else pn.setPrev(false);
		if((totalPages-1)/LINKCNT+1!=nav) pn.setNext(true); else pn.setNext(false);
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pagination", pn);
	}
}
