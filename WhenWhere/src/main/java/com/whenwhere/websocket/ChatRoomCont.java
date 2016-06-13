package com.whenwhere.websocket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.user.vo.MemberVO;

@Controller
@RequestMapping(value="/chat")
public class ChatRoomCont {

	/*@Autowired
	private ChatRoomService chatService;*/
	
	@ModelAttribute("chatvo")
    public ChatRoomVO refModelTest() {
        return new ChatRoomVO();
    }
	
	/* [ makeRoom ] 
	 * 방만들기 관련 기능 method , 방이 application영역에 하나도 존재하지 않을시 hashMap 새로생성
	 * hashMap(방번호,chatVO) 들어가고 return은 방제목과, session에 저장된 닉네임을 jsonObj형태로 리턴
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/makeRoom")
	@ResponseBody
	public String makeRoom(@ModelAttribute ChatRoomVO chatVO, HttpSession session, HttpServletRequest request, Model model) throws Exception{
   
		JSONObject obj = new JSONObject();
		obj.put("ok", true);
		
		ServletContext application= (ServletContext) request.getServletContext();
		Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
		List<Integer> roomA = (ArrayList<Integer>) application.getAttribute("roomNumList");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String sessionNick = "임시닉네임";
		
		if(member != null)
			sessionNick = member.getNickname();
		
		Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("MM-dd hh:mm:ss");
	    chatVO.setwTime(sdf.format(d));
	    chatVO.getUserList().add(sessionNick);
		
		if(roomM==null){
			roomM = new HashMap();
			roomA = new ArrayList<Integer>();
			
			chatVO.setRoomNum(1);
			roomM.put(1,chatVO);
			roomA.add(1);
			
			session.setAttribute("session_roomInfo", 1);
			application.setAttribute("roomListM", roomM);
			application.setAttribute("roomNumList", roomA);
		}else{
			
			int roomLastNum = ((Integer) roomA.get(roomA.size()-1))+1;
			chatVO.setRoomNum(roomLastNum);
			
			session.setAttribute("session_roomInfo", roomLastNum);
			roomM.put(roomLastNum,chatVO);
			roomA.add(roomLastNum);
		}
		
		obj.put("title", chatVO.getTitle());
		obj.put("name", sessionNick );
		
		return obj.toJSONString();
		
	}
	
	/* [ getChatRoomList ] 
	 * 방리스트 화면에 뿌려주기 method, 사용자가 채팅페이지 접속시 ajax요청으로 실행됨
	 * 기본 10개씩 뿌려주게 했고 1페이지 불러오게함
	 * 원래 arraylist로 했을때는정렬이되어쓴데 hashmap은 안되므로 해결책필요 = 일단 arraylist에넣었음
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/getChatRoomList")
	@ResponseBody
	public String getChatRoomList(@RequestParam("page") int page, HttpServletRequest request) throws Exception{
   
		JSONArray jsonArr = new JSONArray();
		
		JSONObject obj = new JSONObject();
		obj.put("ok", true);
		jsonArr.add(obj);
		
		ServletContext application= (ServletContext) request.getServletContext();
		
		Map<Integer,ChatRoomVO> roomL = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
		List<ChatRoomVO> roomA = (ArrayList<ChatRoomVO>) application.getAttribute("roomNumList");
		
		int countbyPage = 10;
		int totalCount = 0;
		int start = (countbyPage*(page-1));
		
		if(roomL != null){
			totalCount = roomL.size();
		}
		
		if(totalCount<10){
			start = 0;
			countbyPage = totalCount;
		}
		
		System.out.println("방개수 :"+totalCount);
		while((--countbyPage)>=start){
			ChatRoomVO chat = (ChatRoomVO)roomL.get(roomA.get(countbyPage));
			
			obj = new JSONObject();
			
			obj.put("num", chat.getRoomNum());
			obj.put("title", chat.getTitle());
			obj.put("wTime", chat.getwTime());
			obj.put("type", chat.getType());
			obj.put("userNum", chat.getUserNum());
			obj.put("userNumInRoom", chat.getUserList().size());
			//obj.put("isRoomAccess", chat.roomAccessCheck());
			
			if(chat.getPwd()==null){
				obj.put("pwdCheck", false);
			}
			else{
				obj.put("pwdCheck", true);
			}
			
			jsonArr.add(obj);
		}
		
		return jsonArr.toJSONString();
	}
}
