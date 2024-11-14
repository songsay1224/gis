package com.say.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.say.mapper.MemberMapper;

import com.say.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/*.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper memberMapper; // MemberMapper.java 인터페이스 의존성 주입

	// 회원가입 쿼리 테스트 메서드
	/*
	 * @Test public void memberJoin() throws Exception { MemberVO member = new
	 * MemberVO();
	 * 
	 * member.setMemberId("AT11"); // 회원 id member.setMemberPw("1111"); // 회원 비밀번호
	 * 
	 * memberMapper.memberJoin(member); // 쿼리 메서드 실행
	 * 
	 * }
	 */
	
	  /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void memberLogin() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        member.setMemberId("y5");
        member.setMemberPw("y5");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        //member.setMemberId("test1123");
        //member.setMemberPw("test1321321");
        
        memberMapper.memberLogin(member);
        System.out.println("결과 값 : " + memberMapper.memberLogin(member));
        
    }
 
	
	

}