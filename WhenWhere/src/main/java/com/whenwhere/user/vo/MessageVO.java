package com.whenwhere.user.vo;

import java.sql.Date;

import com.whenwhere.util.PaginationVO;

public class MessageVO {
	private int no;
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private String receive_ck;
	private Date wdate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceive_ck() {
		return receive_ck;
	}

	public void setReceive_ck(String receive_ck) {
		this.receive_ck = receive_ck;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
}
