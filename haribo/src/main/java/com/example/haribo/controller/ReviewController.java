package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.ReviewReplyService;
import com.example.haribo.service.ReviewService;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

import jakarta.servlet.http.HttpSession;
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
	//회원 별 작성한 리뷰 출력
	@GetMapping("/myReviewList")
	public String selectMyReview(HttpSession session , Model model, Customer customer) {
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		List<HashMap<String, Object>> list  = reviewService.selectMyReview(customer);
		
		model.addAttribute("list", list);
		
		return "customer/myReviewList";
	}
	//리뷰 수정
	@PostMapping("/updateReview")
	public String updateReview(Review review) {
		reviewService.updateReview(review);
		
		String u = "redirect:/myReviewOne?reviewNo="+review.getReviewNo();
		return u;
	}
	
	//리뷰 삭제
	@GetMapping("/deleteReview")
	public String deleteReview(Review review,int customerNo) {
		reviewService.deleteReview(review);
		
		String u = "redirect:/myReviewList?customerNo="+customerNo;
		return u;
	}
	//내가 쓴 리뷰 상세
	@GetMapping("/myReviewOne")
	public String myReviewOne(Review review, Model model) {
		//reviewService 호출
		Map<String,Object> myReviewMap = reviewService.myReviewOne(review);
		//모델에 값 넣기
		model.addAttribute("rMap", myReviewMap.get("rMap"));
		model.addAttribute("rrList", myReviewMap.get("replyList"));
		//리턴
		return "customer/myReviewOne";
	}
}
