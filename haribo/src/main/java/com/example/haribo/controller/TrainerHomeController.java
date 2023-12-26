package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainerHomeController {
	@GetMapping("/trainerHome")
	// 트레이너 전용 홈페이지
	public String trainerHome() {
		return "emp/trainerHome";
	}
}
