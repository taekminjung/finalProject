package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

@Mapper
public interface ReviewMapper {

	List<HashMap<String, Object>> reviewList();
	
	List<ReviewReply> reviewReplyList();

	List<Review> empReviewList(Map<String,Object> param);
	
	Review reviewOne(Review review);

	int getTotalRow();
	
	int getTotalRow2(Review review);
	
	//리뷰 작성
	int insertReview(Review review);
	
	//예약번호에 따른 프로그램정보
	HashMap<String, Object> selectReservationInfo(Review review);
	
	//회원별 작성한 리뷰리스트
	List<HashMap<String, Object>> selectMyReview(Customer customer);
	//리뷰 리플 여부 체크
	int selectReviewReplyCnt(Review review);
	//리뷰 리플 삭제
	int deleteReviewReply(Review review);
	//리뷰 삭제
	int deleteReview(Review review);
	//리뷰 수정
	int updateReview(Review review);
	//내가 쓴 리뷰 상세
	Map<String,Object> myReviewOne(Review review);
	
	List<Review> searchByReview(Map<String, Object> param);
}
