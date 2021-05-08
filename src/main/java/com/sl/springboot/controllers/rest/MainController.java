package com.sl.springboot.controllers.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {

	@GetMapping(value = "/hello")
	public String hello() {
		
		return "Hello World Spring Rest Controller!";
		
	}
}
