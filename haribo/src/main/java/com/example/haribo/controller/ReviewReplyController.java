package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ReviewReplyService;
import com.example.haribo.vo.ReviewReply;

@Controller
public class ReviewReplyController {
	@Autowired private ReviewReplyService reviewReplyService;
	
	// 리뷰 댓글 등록하기
	@GetMapping("/insertReviewReply")
	public String insertReviewReply() {
		
		return "emp/trainerReviewOne";
	}
	
	@PostMapping("/trainerReviewOne")
	public String insertReviewReply(ReviewReply reviewReply) {
		reviewReplyService.insertReviewReply(reviewReply);
		
		String a = "redirect:/trainerReviewOne?reviewNo="+reviewReply.getReviewNo();
		return a;
				
	}
	
	// 리뷰 댓글 삭제하기
	@GetMapping("/deleteReviewReply")
	public String deleteReviewReply(ReviewReply reviewReply) {
		reviewReplyService.deleteReviewReply(reviewReply);
		
		return "redirect:/trainerReviewOne?reviewNo="+reviewReply.getReviewNo();
	}
}
