package com.say.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.say.service.BoardService;

@Controller
public class MainController {

	@Autowired
	private BoardService bservice;

	
	@RequestMapping(value = "main.do")
	public String main() {

		return "main/main";

	}

	@RequestMapping(value = "open.do")
	public String open() {

		
		System.out.println("검색어 : " );
		return "gis/open";

	}

	@GetMapping("/HelpdeskListView.do")
	// => @RequestMapping(value = "enroll.do", method = RequestMethod.GET)
	public String open(Model model) {

		model.addAttribute("list", bservice.getList());

		return "hdk/HelpdeskListView";
	}

}
