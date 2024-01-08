package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

@Mapper
public interface ReviewMapper {

	List<HashMap<String, Object>> reviewList();
	
	List<ReviewReply> reviewReplyList();
	
	//리뷰 작성
	int insertReview(Review review);
	//예약번호에 따른 프로그램정보
	HashMap<String, Object> selectReservationInfo(Review review);
}
