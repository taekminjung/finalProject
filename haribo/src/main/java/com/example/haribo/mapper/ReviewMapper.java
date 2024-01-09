package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

@Mapper
public interface ReviewMapper {

	List<HashMap<String, Object>> reviewList();
	
	List<ReviewReply> reviewReplyList();

	List<Review> empReviewList(Map<String,Object> param);
	
	Review reviewOne(Review review);

	int getTotalRow(int rowPerPage);
	
	//리뷰 작성
	int insertReview(Review review);
	
	//예약번호에 따른 프로그램정보
	HashMap<String, Object> selectReservationInfo(Review review);
}
