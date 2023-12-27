package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainersMapper {

		List<HashMap<String, Object>> trainersList(int beginRow, int rowPerPage);
		
		int getTotalRow(int rowPerPage);
}
