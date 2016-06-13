package com.whenwhere.user.dao;

import com.whenwhere.user.vo.MemberVO;

public interface MemberDAO {
	public int matchNickname(String nickname);
	public int matchEmail(String email);
	public void joinMember(MemberVO member);
	public MemberVO login(MemberVO member);
}
