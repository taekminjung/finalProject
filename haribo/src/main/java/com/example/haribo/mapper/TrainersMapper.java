package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Branch;

@Mapper
public interface TrainersMapper {

		List<HashMap<String, Object>> trainersList(HashMap<String, Object> map);
		
		int getTotalRow(int rowPerPage);
}
