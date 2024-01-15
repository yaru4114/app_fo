package com.bid.fo.main.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fo")
public class BidMainController {

	@RequestMapping("/main")
	public String start(Model model) {
		model.addAttribute("loginYn","N");
		return "fo/main";
	}
	
	
}
