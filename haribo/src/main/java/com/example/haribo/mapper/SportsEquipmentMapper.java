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
	
	// 폐기 대장 목록 
	List<SportsEquipmentExpire> sportsEquipmentExpiredList (Map<String, Object>param);
	
	// 운동 기구 리스트 페이징 
	int getTotalRow(int rowPerPage);
	
	// 운동 기구 폐기 리스트 페이징 
	int getTotalRowExpire(int rowPerPage);
	
	int getTotalRowOrder(int rowPerPage);
	
	int getTotalRowStock(int rowPerPage);
	
	int countSportsEquipment(SportsEquipmentOrder sportsEquipmentOrder);
	
	// 운동 기구 추가 
	int insertSportsEquipment(SportsEquipment sportsEquipment);
	
	// 운동 기구 이미지 추가 
	int insertSportsEquipmentImg(SportsEquipmentImg sportsEquipmentImg);
	
	// 운동 기구 수정 
	int updateSportsEquipment(SportsEquipment sportsEquipment);
	
	// 운동 기구 이미지명 
	String selectSportsEquipmentImgName(SportsEquipmentImg sportsEquipmentImg);
	
	// 운동 기구 상세보기 
	SportsEquipment sportsEquipmentOne(SportsEquipment sportsEquipment);
	
	// 운동 기구 목록 
	List<SportsEquipment> sportsEquipmentList (Map<String, Object>param);
	
	// 운동 기구 발주 완료 목록 
	List<SportsEquipmentOrder> sportsEquipmentOrderCk (Map<String, Object>param);
	
	// 운동 기구 재고 현황 
	List<HashMap<String,Object>> stockList (HashMap<String, Object> param);

	// 운동 기구 주문 현황 수정 
	int updateOrderStatus(SportsEquipmentOrder sportsEquipmentOrder);
	
	// 물품 발주, 폐기 폼
	List<SportsEquipment> sportsEquipmentOrderFormList();

	// 운동 기구 발주 폼 
	int sportsEquipmentOrderForm(SportsEquipmentOrder sportsEquipmentOrder);
	
	// 폐기 신청 
	int insertExpire(SportsEquipmentExpire sportsEquipmentExpire);

	// 지점별 운동 기구 현황 
	List<HashMap<String, Object>> trainerStockList(HashMap<String, Object> param);
	
	// 지점별 폐기 대장 목록 
	List<Map<String, Object>> trainerExpireFormList(SportsEquipmentOrder sportsEquipmentOrder);

	// 발주 완료된 물품 리스트 출
	List<HashMap<String, Object>> seqStateList(HashMap<String, Object> map);

	int getTotalRowseqState(int rowPerPage);
}
