package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Branch;

@Mapper
public interface TrainersMapper {

		List<HashMap<String, Object>> trainersList(HashMap<String, Object> map);
		
		List<HashMap<String, Object>> trainerinfo(HashMap<String, Object> map);
		
		//지점 주소 검색(지도에 표시하기위한)
		String selectBranchAddr(Branch branch);
		
		int getTotalRow(int rowPerPage);
}
