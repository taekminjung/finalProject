package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/home")
	public String home() {
		
		return "public/home";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "public/login";
	}
}
