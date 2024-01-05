package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;

@Mapper
public interface SportsEquipmentMapper {
	List<HashMap<String, Object>> sportsEquipmentExpiredList (int beginRow, int rowPerPage);
	
	int getTotalRow(int rowPerPage);
	
	int insertExpire(SportsEquipmentExpire sportsEquipmentExpire);	
	
	int insertSportsEquipment(SportsEquipment sportsEquipment);
	
	List<SportsEquipment> sportsEquipmentList (Map<String, Object> map);
}
