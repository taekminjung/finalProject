package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.SportsEquipmentMapper;
import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;

@Service
public class SportsEquipmentService {
	@Autowired private SportsEquipmentMapper sportsEquipmentMapper;
	
	public List<SportsEquipmentExpire> sportsEquipmentExpiredList(@RequestParam(defaultValue="1") int currentPage){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("rowPerPage", rowPerPage);
		param.put("beginRow", beginRow);
		
		List<SportsEquipmentExpire> list = sportsEquipmentMapper.sportsEquipmentExpiredList(param);
		return list;
	}
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = sportsEquipmentMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	public int lastPageExpire() {
		int rowPerPage=10;
		int totalRow = sportsEquipmentMapper.getTotalRowExpire(rowPerPage);
		int lastPageExpire = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPageExpire +=1;
		}
		return lastPageExpire;
	}
	public void insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		// TODO Auto-generated method stub
		
	}
	
	public int insertSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.insertSportsEquipment(sportsEquipment);
	}
	
	public List<SportsEquipment> sportsEquipmentList(
				@RequestParam(defaultValue="1") int currentPage){

		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("rowPerPage", rowPerPage);
		param.put("beginRow", beginRow);
		
		List<SportsEquipment> list = sportsEquipmentMapper.sportsEquipmentList(param);
		return list;
	}
	
	public int updateSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.updateSportsEquipment(sportsEquipment);	
	}	
	
	public int deleteSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.deleteSportsEquipment(sportsEquipment);
	}
}
