package com.whenwhere.util;

public class PaginationVO {
	private int rows;
	private int currPage;
	private int totalPage;
	private int linkBegin;
	private int linkEnd;
	private int linkCnt;
	private boolean isPrev;
	private boolean isNext;

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLinkBegin() {
		return linkBegin;
	}

	public void setLinkBegin(int linkBegin) {
		this.linkBegin = linkBegin;
	}

	public int getLinkEnd() {
		return linkEnd;
	}

	public void setLinkEnd(int linkEnd) {
		this.linkEnd = linkEnd;
	}

	public int getLinkCnt() {
		return linkCnt;
	}

	public void setLinkCnt(int linkCnt) {
		this.linkCnt = linkCnt;
	}

	public boolean isPrev() {
		return isPrev;
	}

	public void setPrev(boolean isPrev) {
		this.isPrev = isPrev;
	}

	public boolean isNext() {
		return isNext;
	}

	public void setNext(boolean isNext) {
		this.isNext = isNext;
	}
}
