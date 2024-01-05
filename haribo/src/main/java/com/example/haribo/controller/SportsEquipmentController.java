package com.example.haribo.controller;
import com.example.haribo.vo.SportsEquipment;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.di_aop_controller.SportsEquipment;
import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.SportsEquipmentExpire;

@Controller
public class SportsEquipmentController {
	@Autowired SportsEquipmentService sportsEquipmentService;
	
	@GetMapping("/sportsEquipmentA")
	public String sportsEquipmentA() {
		return "emp/sportsEquipmentA";
	}
	
	@GetMapping("/sportsEquipmentB")
	public String sportsEquipmentB() {
		return "emp/sportsEquipmentB";
	}
	
	@GetMapping("/sportsEquipmentC")
	public String sportsEquipmentC() {
		return "emp/sportsEquipmentC";
	}
	
	@GetMapping("/insertSportsEquipment")
	public String insertSportsEquipment() {
		return "emp/insertSportsEquipment";
	}
	
	@PostMapping("/insertSportsEquipment")
	public String insertSportsEquipment(SportsEquipment sportsEquipment) {
		sportsEquipmentService.insertSportsEquipment(sportsEquipment);
		return "emp/adminHome";
	}
	
	@GetMapping("/sportsEquipmentList")
	public String sportsEquipmentList(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<HashMap<String, Object>> list = sportsEquipmentService.sportsEquipmentExpiredList(currentPage);
		System.out.println(list + "<-- list");
		
		int lastPage = sportsEquipmentService.lastPage();
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);		
				
		return "emp/sportsEquipmentList";
	}

	@GetMapping("/sportsEquipmentExpiredList")
	public String sportsEquipmentExpiredList(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<HashMap<String, Object>> list = sportsEquipmentService.sportsEquipmentExpiredList(currentPage);
		System.out.println(list + "<-- list");
		
		int lastPage = sportsEquipmentService.lastPage();
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);		
				
		return "emp/sportsEquipmentExpiredList";
	}
	
	// 폐기할 물품 입력하기 (form+insert)
	@GetMapping("/insertExpire")
	public String insertExpire() {
		
		return "emp/trainerExpireForm";
	}
	
	@PostMapping("/insertExpire")
	public String insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		sportsEquipmentService.insertExpire(sportsEquipmentExpire);
		return "redirect:/emp/trainerExpireForm";
	}
}
