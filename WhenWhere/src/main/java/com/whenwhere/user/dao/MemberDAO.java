package com.whenwhere.user.dao;

import com.whenwhere.user.vo.MemberVO;

public interface MemberDAO {
	public void joinMember(MemberVO member);
	public int matchNickname(String nickname);
}
