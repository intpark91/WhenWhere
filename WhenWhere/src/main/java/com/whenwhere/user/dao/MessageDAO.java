package com.whenwhere.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.whenwhere.user.vo.MessageVO;

public interface MessageDAO {
	public void sendMsg();
	public int getRowsByReceiver(String receiver);
	public List<MessageVO> getMsgList(@Param("receiver") String receiver, @Param("rows") int rows, @Param("page") int page);
	public int pageTotlaCount();
}
