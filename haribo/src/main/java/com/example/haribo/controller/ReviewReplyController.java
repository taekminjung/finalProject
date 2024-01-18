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
	
	// 리뷰 댓글 등록하기(트레이너)
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
	
	// 리뷰 댓글 삭제하기 (트레이너)
	@PostMapping("/deleteReviewReply")
	public String deleteReviewReply(ReviewReply reviewReply) {
		System.out.println(reviewReply+"<<=====asdas");
		reviewReplyService.deleteReviewReply(reviewReply);
			
		return "redirect:/trainerReviewOne?reviewNo="+reviewReply.getReviewNo();
	}
	
	// 리뷰 댓글 등록하기(직원)
	@GetMapping("/insertReviewReplyEmp")
	public String insertReviewReplyEmp() {
		
		return "emp/employeeReviewOne";
	}
	
	@PostMapping("/insertReviewReplyEmp")
	public String insertReviewReplyEmp(ReviewReply reviewReply) {
		reviewReplyService.insertReviewReply(reviewReply);
		
		String a = "redirect:/employeeReviewOne?reviewNo="+reviewReply.getReviewNo();
		return a;
	}
	
	// 리뷰 댓글 삭제하기(직원)
	@PostMapping("/deleteReviewReplyEmp")
	public String deleteReviewReplyEmp(ReviewReply reviewReply) {
		reviewReplyService.deleteReviewReply(reviewReply);
		
		return "redirect:/employeeReviewOne?reviewNo="+reviewReply.getReviewNo();
	}
}
