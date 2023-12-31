package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;
import com.example.haribo.vo.SportsEquipmentImg;
import com.example.haribo.vo.SportsEquipmentOrder;

@Mapper
public interface SportsEquipmentMapper {
	List<SportsEquipmentExpire> sportsEquipmentExpiredList (Map<String, Object>param);
	
	int getTotalRow(int rowPerPage);
	
	int getTotalRowExpire(int rowPerPage);
	
	int getTotalRowOrder(int rowPerPage);
	
	int getTotalRowStock(int rowPerPage);
	
	int sportsEquipmentOrder(SportsEquipmentOrder sportsEquipmentOrder);
	
	int insertExpire(SportsEquipmentExpire sportsEquipmentExpire);	
	
	int insertSportsEquipment(SportsEquipment sportsEquipment);
	
	int insertSportsEquipmentImg(SportsEquipmentImg sportsEquipmentImg);
	
	int deleteSportsEquipment(SportsEquipment sportsEquipment);
	
	int updateSportsEquipment(SportsEquipment sportsEquipment);
	
	SportsEquipment sportsEquipmentOne(SportsEquipment sportsEquipment);
	
	List<SportsEquipment> sportsEquipmentList (Map<String, Object>param);
	
	List<SportsEquipmentOrder> sportsEquipmentOrderCk (Map<String, Object>param);
	
	List<HashMap<String,Object>> stockList (HashMap<String, Object> param);

	int updateOrderStatus(SportsEquipmentOrder sportsEquipmentOrder);
}
