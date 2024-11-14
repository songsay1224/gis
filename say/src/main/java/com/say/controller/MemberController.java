package com.say.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.say.model.MemberVO;
import com.say.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원가입 페이지 이동
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String loginGET() {

		return "member/join";

	}

	// 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		// 회원가입 서비스 실행

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw);
		member.setMemberPw(encodePw);

		memberservice.memberJoin(member);

		return "redirect:/main.do";

	}

	/* 로그인 */
	@RequestMapping(value = "/main.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO Ivo = memberservice.memberLogin(member);

		if (Ivo != null) {

			rawPw = member.getMemberPw();
			encodePw = Ivo.getMemberPw();

			if (true == pwEncoder.matches(rawPw, encodePw)) {

				Ivo.setMemberPw(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", Ivo); // session에 사용자의 정보 저장
				return "redirect:/open.do"; // 메인페이지 이동

			} else {

				rttr.addFlashAttribute("result", 0);
				return "redirect:/main.do";

			}

		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/main.do";
		}

	}

	// 로그아웃 기능
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main.do";

	}

}
