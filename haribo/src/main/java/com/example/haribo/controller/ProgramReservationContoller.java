package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ProgramReservationService;
import com.example.haribo.vo.ProgramReservation;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ProgramReservationContoller {
	@Autowired
	private ProgramReservationService programReservationService;
	
	//프로그램 예약하기
	@GetMapping("/insertProgramReservation")
	public String insertProgramReservation() {
		
		
		return "";
	}
	
	@PostMapping("/insertProgramReservation")
	public String insertProgramReservation(ProgramReservation programReservation, Integer[] programDateNoList) {
		
		programReservationService.insertProgramReservation(programDateNoList, programReservation);
		return "";
	}
}
