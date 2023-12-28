package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuestionController {
	
	@GetMapping("/questionList")
	public String questionList() {
		return "emp/questionList";
	}
}
