package com.whenwhere.board.vo;

import java.sql.Date;
import java.util.List;

public class BoardVO {
	private int no;
<<<<<<< HEAD
	private String category;
	private String title;
	private Date wdate;
	private String auth;
	private String content;
	private int hit;
	private int recommend;
	private int eventNo;
	private List<CommentVO> comments;
=======
	private String boardName;
	private String category;
	private String title;
	private Date wdate;
	private Date wdate2;
	private String auth;
	private String content;
	private int hit;
	private int recommend;
	private int eventNo;
	private List<CommentVO> comments;

	
	
	public Date getWdate2() {
		return wdate2;
	}

	public void setWdate2(Date wdate2) {
		this.wdate2 = wdate2;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
>>>>>>> refs/heads/main_js

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public List<CommentVO> getComments() {
		return comments;
	}

	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}
}
