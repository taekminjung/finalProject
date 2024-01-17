package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

@Mapper
public interface ReviewMapper {

	List<HashMap<String, Object>> reviewList();
	
	List<ReviewReply> reviewReplyList();

	List<Review> empReviewList(Map<String,Object> param);
	// 트레이너 리뷰 리스트
	List<HashMap<String, Object>> trainerReviewList(HashMap<String, Object> param, String employeeId);
	
	Review reviewOne(Review review);

	int getTotalRow();
	
	//리뷰 작성
	int insertReview(Review review);
	
	//예약번호에 따른 프로그램정보
	HashMap<String, Object> selectReservationInfo(Review review);
	
	//회원별 작성한 리뷰리스트
	List<HashMap<String, Object>> selectMyReview(Customer customer);
	//프로그램 상세보기에 해당 프로그램 리뷰 출력
		List<HashMap<String, Object>> selectReviewByProgram(Program program);
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
}