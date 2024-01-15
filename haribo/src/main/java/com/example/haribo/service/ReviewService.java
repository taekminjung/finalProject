package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.ReviewMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.Review;
import com.example.haribo.vo.ReviewReply;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ReviewService {
	@Autowired ReviewMapper reviewMapper;
	
	public HashMap<String, Object> reviewListMap(){
		
		List<HashMap<String, Object>> list = reviewMapper.reviewList();
		
		List<ReviewReply> rpList = reviewMapper.reviewReplyList();
		
		HashMap<String, Object> rMap = new HashMap<>();
		rMap.put("list", list);
		rMap.put("rpList", rpList);
		
		log.debug(rMap+"");
		return rMap;
	}
	
	public int insertReview(Review review) {
		 int row = reviewMapper.insertReview(review);
		 
		 return row;
	}
	
	public HashMap<String, Object> selectReservationInfo(Review review){
		HashMap<String, Object> map = reviewMapper.selectReservationInfo(review);
		
		return map;
	}
	
	// 리뷰리스트(트레이너) 페이징
	public List<Review> empReviewList(@RequestParam(defaultValue = "1") int currentPage) {
		int rowPerPage = 10;
		int beginRow = (currentPage -1) * rowPerPage;
		int totalRow = reviewMapper.getTotalRow();
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		param.put("lastPage", lastPage);
		
		List<Review> trainerlist = reviewMapper.empReviewList(param);
		return trainerlist;
	}
	
	// 리뷰 상세보기(트레이너)
	public Review reviewOne(Review review) {
		return reviewMapper.reviewOne(review);
	}
	
	// 총 리뷰 수
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = reviewMapper.getTotalRow();
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	//고객 별 작성한 리뷰 리스트
	public List<HashMap<String, Object>> selectMyReview(Customer customer) {
		List<HashMap<String, Object>> list = reviewMapper.selectMyReview(customer);
		
		System.out.println(list+"<== ser.reviewList");
		return list;
	}
	//리뷰 수정
	public int updateReview(Review review) {
		int row = reviewMapper.updateReview(review);
	
		return row;
	}
	//리뷰 삭제
	public void deleteReview(Review review) {
		int selectReviewReplyCnt = reviewMapper.selectReviewReplyCnt(review);
		if(selectReviewReplyCnt == 0) {
			reviewMapper.deleteReview(review);
		}else {
			reviewMapper.deleteReviewReply(review);
			reviewMapper.deleteReview(review);
		}
	}
	//내가 쓴 리뷰 상세
	public Map<String,Object> myReviewOne(Review review){
		Map<String,Object> myReviewMap = new HashMap<>();
		myReviewMap.put("rMap", reviewMapper.myReviewOne(review));
		myReviewMap.put("replyList",reviewMapper.reviewReplyList());
		
		return myReviewMap;
	}
	
	public List<Review> searchByReview(Review review, Program program, int currentPage){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object>map = new HashMap<>();
		map.put("rowPerPage", rowPerPage);
		map.put("beginRow", beginRow);
		map.put("programName", program.getProgramName());
		
		List<Review> list = reviewMapper.searchByReview(map);
		
		return list;
	}
	
	public int searchLastPage(Review review) {
		int rowPerPage = 10;
		int totalRow = reviewMapper.getTotalRow2(review);
		int lastPage = totalRow/rowPerPage;
		if(totalRow/rowPerPage !=0) {
			lastPage += 1;
		}
		return lastPage;
	}
}
	