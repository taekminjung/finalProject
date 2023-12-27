package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Review;

@Mapper
public interface AboutUsMapper {
	
	List<Review> reviewList(int beginRow, int rowPerPage);
	
	int getTotalRow(int rowPerPage);
}
