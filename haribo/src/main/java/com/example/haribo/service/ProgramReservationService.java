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
	public void insertProgramReservation(Integer[] programDateNoList, String customerId, String branchName) {
		ProgramReservation programReservation = new ProgramReservation();
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
	//프로그램 중복 제거 이름 출력
	public List<Map<String,Object>> programNameList(){
		List<Map<String,Object>> list = programReservationMapper.selectProgramNameList();
		return list;
	}
	//프로그램의 지점 출력
	public List<Map<String,Object>> branchNameListByProgramName(String programName){
		List<Map<String,Object>> list = programReservationMapper.selectBranchNameByProgramName(programName);
		return list;
	}
	//프로그램이 이름과 지점 이름으로 프로그램 날짜
	public List<Map<String,Object>> ProgramDateByProgramNameBranchName(String programName, String branchName){
		Map<String,Object> map = new HashMap<>();
		map.put("branchName", branchName);
		map.put("programName", programName);
		
		List<Map<String,Object>> list = programReservationMapper.selectProgramDateByProgramNameBranchName(map);
		return list;
	}
}
