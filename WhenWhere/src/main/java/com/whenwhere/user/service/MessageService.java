package com.whenwhere.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
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
		boolean ok = false;
		int rows=0;
		try {
			 rows = dao.sendMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject jobj = new JSONObject();
			jobj.put("ok", ok);
			jobj.put("receiver", msg.getReceiver());
			return jobj.toJSONString();
		}
		
		if (rows > 0) {
			ok = true;
		}
		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);
		return jobj.toJSONString();
	}

	public PaginationVO getTotalPages(HttpSession session) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		PaginationVO pagination = new PaginationVO();

		if (member == null) {
			System.out.println("session에 로그인한 유저가 없습니다.");
			return null;
		}

		int totalRows = dao.getRowsByReceiver(member.getEmail());
		pagination.setTotalPage(totalRows / ROWCNT);

		return pagination;
	}

	public void getMsgList(Model model, HttpSession session, int page, String type) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		PaginationVO pn = new PaginationVO();
		if (member == null) {
			System.out.println("session에 로그인한 유저가 없습니다.");
			return;
		}
		List<MessageVO> msgList = dao.getMsgList(member.getNickname(), ROWCNT, page, type);

		int totalRows = dao.getRowsByReceiver(member.getEmail());
		int totalPages = totalRows / ROWCNT + 1;
		int nav = (page - 1) / LINKCNT + 1;

		pn.setTotalPage(totalPages);
		pn.setLinkCnt(LINKCNT);
		pn.setRows(ROWCNT);
		pn.setCurrPage(page);
		pn.setLinkBegin((nav - 1) * LINKCNT + 1);
		if (totalPages < nav * LINKCNT) {
			pn.setLinkEnd(totalPages);
		} else {
			pn.setLinkEnd(nav * LINKCNT);
		}

		if (nav > 1)
			pn.setPrev(true);
		else
			pn.setPrev(false);
		if ((totalPages - 1) / LINKCNT + 1 != nav)
			pn.setNext(true);
		else
			pn.setNext(false);

		model.addAttribute("msgList", msgList);
		model.addAttribute("pagination", pn);
	}

	public String getNewMsg(Model model, HttpSession session) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MemberVO member = (MemberVO) session.getAttribute("member");
		boolean ok = true;

		if (member == null) {
			System.out.println("session에 로그인한 유저가 없습니다.");
			return null;
		}

		List<MessageVO> msgList = new ArrayList<MessageVO>();
		try {
			msgList = dao.getNewMsg(member.getNickname(), "0");
		} catch (Exception e) {
			e.printStackTrace();
			ok = false;
		}

		JSONObject jobj = new JSONObject();
		if (msgList.size() > 0) {
			JSONArray jArr = new JSONArray();
			for (int i = 0; i < msgList.size(); i++) {
				JSONObject tempObj = new JSONObject();
				tempObj.put("no", msgList.get(i).getNo());
				tempObj.put("sender", msgList.get(i).getSender());
				tempObj.put("title", msgList.get(i).getTitle());
				tempObj.put("wdate", msgList.get(i).getWdate().toString());
				jArr.add(tempObj);
			}
			jobj.put("cnt", msgList.get(0).getCnt());
			jobj.put("newMsgs", jArr);
		} else {
			jobj.put("cnt", 0);
		}
		jobj.put("ok", ok);

		return jobj.toJSONString();
	}

	public void getMsg(Model model, int num, String type) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		MessageVO message = dao.getMsg(num);
		System.out.println(type);
		if (type.equals("read")) {
			dao.updateMsgStatus(num, type);
		}
		model.addAttribute("message", message);
	}

	public String deleteMsg(int num) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		boolean ok = false;
		int rows = dao.deleteMsg(num);

		if (rows > 0) {
			ok = true;
		}

		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);

		return jobj.toJSONString();
	}

	public String updateMsgStatus(int num, String type) {
		MessageDAO dao = sqlSessionTemplate.getMapper(MessageDAO.class);
		boolean ok = false;
		int rows = dao.updateMsgStatus(num, type);

		if (rows > 0) {
			ok = true;
		}

		JSONObject jobj = new JSONObject();
		jobj.put("ok", ok);

		return jobj.toJSONString();
	}
}
