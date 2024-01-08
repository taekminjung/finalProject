package com.example.haribo.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.haribo.service.ProgramReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class ProgramRest {
	@Autowired
	private ProgramReservationService programReservationService;
	
	//해당 프로그램의 지점 출력
	@GetMapping("/branchNameByProgramName")
	public List<Map<String,Object>> branchNameByProgramName(String programName){
		log.debug(programName);
		List<Map<String,Object>> branchNameList = programReservationService.branchNameListByProgramName(programName);
		log.debug(branchNameList+"");
		return branchNameList;
	}
	
	//해당 프로그램,지점 이름으로 프로그램 날짜 출력
	@GetMapping("/programDateByProgramNameBranchName")
	public List<Map<String,Object>> programDateByProgramNameBranchName(HttpSession session, String programName,String branchName){
		int customerNo = (int)(((Map)session.getAttribute("loginCustomer")).get("customerNo"));
		List<Map<String,Object>> programDateList = programReservationService.ProgramDateByProgramNameBranchName(programName, branchName, customerNo);
		return programDateList;
	}
}
