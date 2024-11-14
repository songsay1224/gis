package com.say.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.say.model.MemberVO;

@Mapper
public interface MemberMapper {
	/* 회원가입 */
	public void memberJoin(MemberVO member) throws Exception;;

	/* 로그인 */
	public MemberVO memberLogin(MemberVO member);
}
