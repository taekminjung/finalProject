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

	// 프로그램 리뷰 댓글 입력
	public int insertReviewReply(ReviewReply reviewReply) {
		int row = reviewReplyMapper.insertReviewReply(reviewReply);
		return row;		
	}

	// 프로그램 리뷰 댓글 삭제
	public int deleteReviewReply(ReviewReply reviewReply) {
		reviewReplyMapper.deleteReviewReply(reviewReply);
		return reviewReplyMapper.deleteReviewReply(reviewReply);
	}
	
	// 프로그램 리뷰 댓글 목록
	public List<ReviewReply> selectReviewReply(Review review) {
		List<ReviewReply> list = reviewReplyMapper.selectReviewReply(review);
		return list;
	}
}
