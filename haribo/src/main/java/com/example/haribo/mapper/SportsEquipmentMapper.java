package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.SportsEquipmentExpire;

@Mapper
public interface SportsEquipmentMapper {
	List<HashMap<String, Object>> sportsEquipmentExpiredList (int beginRow, int rowPerPage);
	
	int getTotalRow(int rowPerPage);
	
	int insertExpire(SportsEquipmentExpire sportsEquipmentExpire);	
}
