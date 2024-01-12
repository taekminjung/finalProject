package com.example.haribo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.CalendarService;
import com.example.haribo.service.EmployeeService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;
import com.example.haribo.vo.SportsEquipmentOrder;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class TrainerHomeController {
	@Autowired private EmployeeService employeeService;
	@Autowired private CalendarService calendarService;
	@Autowired private ProgramService programService;
	@Autowired SportsEquipmentService sportsEquipmentService;
	
	// 트레이너 홈페이지
	@GetMapping("/trainerHome")
	public String trainerHome() {
		return "emp/trainerHome";
	}
	
	// 트레이너 상세정보
	@GetMapping("/trainerOne")
	public String trainerOne(Model model, Employee employee) {
		// 서비스 호출
		Map<String,Object> trainerOne = employeeService.trainerOne(employee);
		model.addAttribute("trainerOne", trainerOne);
		return "emp/trainerOne";
	}
	
	// 트레이너 홈페이지 부분
	
//	// 트레이너 지점 별 재고 현황 확인하기
//	@GetMapping("/trainerStock")
//	public String trainerStockList(Model model, @RequestParam(defaultValue="1") int currentPage, SportsEquipment sportseEquipment) {
//		List<HashMap<String, Object>> stockList = sportsEquipmentService.trainerStockList(currentPage, sportseEquipment);
//		
//		int lastPageSp = sportsEquipmentService.lastPageSp();
//	
//		model.addAttribute("stockList", stockList);
//		model.addAttribute("lastPageSp", lastPageSp);
//		model.addAttribute("currentPage", currentPage);
//		
//		return "emp/trainerStock";
//	}
		
	// 트레이너 물품 발주 입력하기(form+insert) + sportsEquipmentOrderForm에 본사가 발주한 물품 리스트 출력
	@GetMapping("/sportsEquipmentOrderForm")
	public String sportsEquipmentOrderFormList(Model model) {
		List<SportsEquipment> orderList = sportsEquipmentService.sportsEquipmentOrderFormList();
		model.addAttribute("orderList", orderList);
				
		return "emp/sportsEquipmentOrderForm";
	}

	@PostMapping("/sportsEquipmentOrderForm")
	public String sportsEquipmentOrderFormSubmit(SportsEquipmentOrder sportsEquipmentOrder) {
		sportsEquipmentService.sportsEquipmentOrderForm(sportsEquipmentOrder);
		
		return "redirect:/trainerStock";
	}
	
	// 폐기할 물품 입력하기 (form+insert)
	@GetMapping("/trainerExpireForm")
	public String insertExpire(Model model) {
		List<SportsEquipment> expireList = sportsEquipmentService.trainerExpireFormList();
		model.addAttribute("expireList", expireList);
		return "emp/trainerExpireForm";
	}
	
	@PostMapping("/trainerExpireForm")
	public String insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		sportsEquipmentService.insertExpire(sportsEquipmentExpire);
		return "redirect:/trainerStock";
	}
}
