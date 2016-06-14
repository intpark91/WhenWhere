package com.whenwhere.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.whenwhere.user.vo.MemberVO;

public interface AdminDAO {
	public List<MemberVO> getUserList();
	public int getBoardList(String email);
	public void getLocalProductList(MemberVO member);
	public int changeUserAuth(@Param("auth") String auth,@Param("nickname") String nickname);
	public int delUser(String nickname);
}
