package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AboutUsMapper {
	
	List<HashMap<String, Object>> reviewList(int beginRow, int rowPerPage);
	
	int getTotalRow(int rowPerPage);
}
