package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.List;

public class ChatRoomVO {
	
	private int roomNum;
	private String title;
	private int type;
	private int userNum;
	private String pwd = null;
	private List<String> userList = new ArrayList<String>();
	private String wTime;
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
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
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public List<String> getUserList() {
		return userList;
	}
	public void setUserList(List<String> userList) {
		this.userList = userList;
	}
	public String getwTime() {
		return wTime;
	}
	public void setwTime(String wTime) {
		this.wTime = wTime;
	}
	
	public boolean roomAccessCheck(){
		if(userList.size()+1<userNum){
			return true;
		}else{
			return false;
		}
	}
}
