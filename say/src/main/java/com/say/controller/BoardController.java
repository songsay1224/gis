package com.say.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.say.model.BoardVO;
import com.say.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bservice;

	@RequestMapping(value = "enroll.do")
	public String open() {

		return "board/enroll";

	}

	/*
	 * @GetMapping("/enroll.do") // => @RequestMapping(value = "enroll.do", method =
	 * RequestMethod.GET) public String open(Model model) {
	 * 
	 * 
	 * model.addAttribute("list", bservice.getList());
	 * 
	 * return "hdk/HelpdeskListView"; }
	 */

	/* 게시판 등록 */
	@PostMapping("/enroll.do")
	public String boardEnrollPOST(BoardVO board) {

		System.out.println("BoardVO : " + board);

		bservice.enroll(board);

		return "redirect:/open.do";
	}
	
	@GetMapping("/getCoordinate.do")
	public BoardVO getCoordinate() {
	    BoardVO coordinate = bservice.getLatestCoordinate();
	    if (coordinate == null) {
	        System.out.println("BoardVO 객체가 null입니다.");
	    } else {
	        System.out.println("BoardVO 객체: x = " + coordinate.getX() + ", y = " + coordinate.getY());
	    }
	    return coordinate;
	}


	
	

}
