package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

@Mapper
public interface ReviewReplyMapper {
	
	int insertReviewReply(ReviewReply reviewReply);
	
	int deleteReviewReply(ReviewReply reviewReply);
	
	List<ReviewReply> selectReviewReply(Review review);
}
