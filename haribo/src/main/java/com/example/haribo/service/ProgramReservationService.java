package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.ProgramReservationMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.ProgramReservation;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class ProgramReservationService {
	@Autowired
	private ProgramReservationMapper programReservationMapper;
	
	//회원 별 예약한 프로그램 조회
	public List<Map<String,Object>> programReservationDateByCustomerNo(Customer customer, 
																		Integer targetYear, 
																		Integer targetMonth){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("customerNo", customer.getCustomerNo());
		paramMap.put("targetYear", targetYear);
		paramMap.put("targetMonth", targetMonth+1);
		
		List<Map<String,Object>> proList = programReservationMapper.selectProgramReservationDateByCustomerNo(paramMap);
		log.debug(proList+"");
		
		return proList;
	}
	
	//프로그램 예약하기
	public void insertProgramReservation(Integer[] programDateNoList, ProgramReservation programReservation) {
		log.debug(programReservation+"");
		for(int i = 0; i < programDateNoList.length; i++) {
			log.debug(programDateNoList[i]+"");
		}
		if(programDateNoList.length > 0) {
			for(int i = 0; i < programDateNoList.length; i++) {
				programReservation.setProgramDateNo(programDateNoList[i]);
				programReservationMapper.insertProgramReservation(programReservation);
			}
		}
	}
}
