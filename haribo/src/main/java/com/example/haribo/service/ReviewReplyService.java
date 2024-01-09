package com.example.haribo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.ReviewReplyMapper;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;
@Service
public class ReviewReplyService {
	@Autowired ReviewReplyMapper reviewReplyMapper;

	// 문의사항 댓글 입력
	public String insertReviewReply(ReviewReply reviewReply) {
		reviewReplyMapper.insertReviewReply(reviewReply);
		return "redirect:/trainerReviewOne";		
	}

	// 문의사항 댓글 삭제
	public int deleteReviewReply(ReviewReply reviewReply) {
		return 0;
	}
	
	// 문의사항 댓글 목록
	public List<ReviewReply> selectReviewReply(Review review) {
		List<ReviewReply> list = reviewReplyMapper.selectReviewReply(review);
		return list;
	}
}
