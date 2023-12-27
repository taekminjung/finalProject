package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
		@Autowired ReviewService reviewService;
		
		@GetMapping("/reviewList")
		public String reviewList(Model model, @RequestParam(defaultValue ="1")int currentPage) {
			List<HashMap<String, Object>> list = reviewService.reviewList(currentPage);
			int lastPage = reviewService.lastPage();
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("list", list);
			model.addAttribute("lastPage", lastPage);
			
			return "public/reviewList";
		}
}
