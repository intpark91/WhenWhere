package com.whenwhere.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.whenwhere.user.vo.MessageVO;

public interface MessageDAO {
	public int sendMsg(MessageVO msg);
	public int getRowsByReceiver(String receiver);
	public List<MessageVO> getMsgList(@Param("receiver") String receiver, @Param("rows") int rows, @Param("page") int page,@Param("type") String type);
	public List<MessageVO> getNewMsg(@Param("receiver") String receiver, @Param("status") String status);
	public MessageVO getMsg(int num);
	public int updateMsgStatus(int num);
	public int deleteMsg(int num);
}
