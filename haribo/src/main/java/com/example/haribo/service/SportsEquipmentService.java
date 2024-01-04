package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.SportsEquipmentMapper;
import com.example.haribo.vo.SportsEquipmentExpire;

@Service
public class SportsEquipmentService {
	@Autowired private SportsEquipmentMapper sportsEquipmentMapper;
	
	public List<HashMap<String,Object>> sportsEquipmentExpiredList(@RequestParam(defaultValue="1") int currentPage){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		List<HashMap<String, Object>> list = sportsEquipmentMapper.sportsEquipmentExpiredList(beginRow, rowPerPage);
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
	public void insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		// TODO Auto-generated method stub
		
	}


	
}
