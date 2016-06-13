package com.whenwhere.main.vo;

import com.whenwhere.board.vo.EventVO;
import com.whenwhere.board.vo.ImageVO;

public class SearchVO {
	private RegionalFoodVO foodVO;
	private ImageVO imgVO;
	private EventVO eventVO;

	public RegionalFoodVO getFoodVO() {
		return foodVO;
	}

	public void setFoodVO(RegionalFoodVO foodVO) {
		this.foodVO = foodVO;
	}

	public ImageVO getImgVO() {
		return imgVO;
	}

	public void setImgVO(ImageVO imgVO) {
		this.imgVO = imgVO;
	}

	public EventVO getEventVO() {
		return eventVO;
	}

	public void setEventVO(EventVO eventVO) {
		this.eventVO = eventVO;
	}

}
