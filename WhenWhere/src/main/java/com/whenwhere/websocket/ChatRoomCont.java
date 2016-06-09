package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
        // request.setAttirubte("chatvo", new ChatRoomVO) 선언된 클래스의 전역으로 실행
    }
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/makeRoom")
	@ResponseBody
	public String makeRoom(@ModelAttribute ChatRoomVO chatVO, HttpSession session, HttpServletRequest request, Model model) throws Exception{
   
		JSONObject obj = new JSONObject();
		obj.put("ok", true);
		
		ServletContext application= (ServletContext) request.getServletContext();
		List<ChatRoomVO> roomL = (List<ChatRoomVO>) application.getAttribute("roomList");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String sessionNick = "임시닉네임";
		
		if(member != null)
			sessionNick = member.getNickname();
		
		chatVO.getUserList().add(sessionNick);
		
		if(roomL==null){
			roomL = new ArrayList<ChatRoomVO>();
			
			chatVO.setRoonNum(1);
			roomL.add(chatVO);
		}else{
			chatVO.setRoonNum(roomL.get(roomL.size()-1).getRoonNum()+1);
			roomL.add(chatVO);
		}
		
		model.addAttribute(chatVO);
		
		return obj.toJSONString();
	}
}
