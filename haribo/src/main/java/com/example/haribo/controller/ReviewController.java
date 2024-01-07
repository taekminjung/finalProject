package com.example.haribo.controller;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.haribo.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
		@Autowired ReviewService reviewService;
		
		@GetMapping("/reviewList")
		public String reviewList(Model model) {
			HashMap<String, Object> rMap = reviewService.reviewListMap();
			
			
			model.addAttribute("list", rMap.get("list"));
			model.addAttribute("rpList", rMap.get("rpList"));
			
			return "public/reviewList";
		}
}
