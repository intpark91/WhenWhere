package com.whenwhere.main.vo;

import java.sql.Date;

import com.whenwhere.board.vo.ImageVO;

public class RegionalFoodVO {
	private String name;
	private String loc;
	private Date sDate;
	private Date eDate;
	private ImageVO imgVO;
	

	public ImageVO getImgVO() {
		return imgVO;
	}

	public void setImgVO(ImageVO imgVO) {
		this.imgVO = imgVO;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
}
