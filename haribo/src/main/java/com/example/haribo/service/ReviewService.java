package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.ReviewMapper;
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
}
