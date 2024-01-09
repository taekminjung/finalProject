package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.ReviewReplyService;
import com.example.haribo.service.ReviewService;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	@Autowired ReviewReplyService reviewReplyService;
	
	// 리뷰 리스트
	@GetMapping("/reviewList")
	public String reviewList(Model model) {
		HashMap<String, Object> rMap = reviewService.reviewListMap();
		
		model.addAttribute("list", rMap.get("list"));
		model.addAttribute("rpList", rMap.get("rpList"));
		
		return "public/reviewList";
	}
	
	// 리뷰 리스트 (트레이너)
	@GetMapping("/trainerReview")
	public String trainerReview(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		List<Review> trainerlist = reviewService.empReviewList(currentPage);
		int lastPage = reviewService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("trainerlist", trainerlist);
		model.addAttribute("lastPage", lastPage);
		
		return "emp/trainerReview";
	}
	
	
	// 리뷰 상세보기 (트레이너)
	@GetMapping("/trainerReviewOne")
	public String trainerReviewOne(Model model, Review review) {
		Review resultReview = reviewService.reviewOne(review);
		model.addAttribute("resultReview", resultReview);
		List<ReviewReply> rpList = reviewReplyService.selectReviewReply(review);
		model.addAttribute("rpList", rpList);
		
		return "emp/trainerReviewOne";
	}
	
	// 리뷰 작성하기
	@GetMapping("/insertReviewForm")
	public String insertReviewForm(Model model, Review review) {
		HashMap<String, Object> map = reviewService.selectReservationInfo(review);
		
		model.addAttribute("map", map);
		model.addAttribute("review", review);
		return "customer/insertReview";
	}
	
	@PostMapping("/insertReview")
	public String insertReview(Review review) {
		
		int row = reviewService.insertReview(review);
		
		return "redirect:/reviewList";
	}		
}
