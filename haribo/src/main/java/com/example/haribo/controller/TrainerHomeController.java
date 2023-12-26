package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainerHomeController {
	@GetMapping("/trainerHome")
	public String trainerHome() {
		return "emp/trainerHome";
	}
}
