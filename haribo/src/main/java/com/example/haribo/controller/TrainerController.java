package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainerController {
	@GetMapping("/trainerHome")
	// 트레이너 홈페이지
	public String trainerHome() {
		return "emp/trainerHome";
	}
	
	@GetMapping("/trainerNotice")
	// 트레이너 공지사항 페이지
	public String trainerNotice() {
		return "emp/trainerNotice";
	}
	
	@GetMapping("/trainerQuestion")
	// 트레이너 문의사항 페이지
	public String trainerQuestion() {
		return "emp/trainerQuestion";
	}
	
	@GetMapping("/trainerReview")
	// 트레이너 리뷰 페이지
	public String trainerReview() {
		return "emp/trainerReview";
	}
}
