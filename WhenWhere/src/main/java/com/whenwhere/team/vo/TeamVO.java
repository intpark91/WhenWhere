package com.whenwhere.team.vo;

import java.util.Date;

public class TeamVO {
	private int no;
	private String teamname;
	private String subject;
	private Date sdate;
	private Date edate;
	private String loc_code;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
	}

}
