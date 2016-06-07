package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.List;

public class ChatRoomVO {
	
	private int roonNum;
	private String title;
	private int type;
	private int userNum; //방인원
	private String pwd;
	private boolean accessChk = true;
	private List<String> userList = new ArrayList<String>();
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getuserNum() {
		return userNum;
	}
	public void setuserNum(int num) {
		this.userNum = num;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public boolean isAccessChk() {
		if(userNum > userList.size())
			return true;
		else return false;
	}
	public void setAccessChk(boolean accessChk) {
		this.accessChk = accessChk;
	}
	public List<String> getUserList() {
		return userList;
	}
	public void setUserList(List<String> userList) {
		this.userList = userList;
	}
	public int getRoonNum() {
		return roonNum;
	}
	public void setRoonNum(int roonNum) {
		this.roonNum = roonNum;
	}
	
}
