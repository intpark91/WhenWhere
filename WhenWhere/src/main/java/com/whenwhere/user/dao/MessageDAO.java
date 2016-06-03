package com.whenwhere.user.dao;

import java.util.List;

import com.whenwhere.user.vo.MessageVO;

public interface MessageDAO {
	public void sendMsg();
	public List<MessageVO> getMsgList(String email);
}
