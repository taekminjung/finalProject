package com.example.haribo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ReviewService;
import com.example.haribo.vo.ProgramReservation;
import com.example.haribo.vo.Review;

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
		@GetMapping("/insertReviewForm")
		public String insertReviewForm(Model model, Review review) {
			
			model.addAttribute("review", review);
			return "customer/insertReview";
			
		}
		@PostMapping("/insertReview")
		public String insertReview(Review review) {
			
			int row = reviewService.insertReview(review);
			
			return "redirect:/reviewList";
		}
}
