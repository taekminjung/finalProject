package com.example.haribo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ProgramReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ProgramReservationContoller {
	@Autowired
	private ProgramReservationService programReservationService;
	
	//프로그램 예약하기
	@GetMapping("/insertProgramReservation")
	public String insertProgramReservation(HttpSession session, Model model) {
		//세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		
		//ProgramReservationService 호출
		List<Map<String,Object>> proList = programReservationService.programNameList();
		
		//model에 담기
		model.addAttribute("proList", proList);

		//리턴
		return "customer/insertProgramReservation";
	}
	
	@PostMapping("/insertProgramReservation")
	public String insertProgramReservation(int customerNo, String customerId, Integer[] programDateNoList) {
		log.debug(programDateNoList+"");
		programReservationService.insertProgramReservation(programDateNoList,customerId);
		String u = "redirect:/customerSchedule?customerNo="+customerNo;
		return u;
	}
}
