package com.sl.springboot.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("/HelloJsp")
	public String init() {
		return "index";
	}
}
