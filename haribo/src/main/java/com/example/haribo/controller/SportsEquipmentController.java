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
		return "redirect:/sportsEquipmentList";
	}
	
	@GetMapping("/sportsEquipmentList")
	public String sportsEquipmentList(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<SportsEquipment> list = sportsEquipmentService.sportsEquipmentList(currentPage);
		int lastPage = sportsEquipmentService.lastPage();
		System.out.println(lastPage+"<--lastPage");
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
				
		return "emp/sportsEquipmentList";
	}

	@GetMapping("/sportsEquipmentExpiredList")
	public String sportsEquipmentExpiredList(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<SportsEquipmentExpire> list = sportsEquipmentService.sportsEquipmentExpiredList(currentPage);
		System.out.println(list + "<-- list");
		
		int lastPageExpire = sportsEquipmentService.lastPageExpire();
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPageExpire", lastPageExpire);		
				
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
	
	@GetMapping("/updateSportsEquipment")
	public String updateSportsEquipment(Model model, SportsEquipment sportsEquipment) {

		return "emp/updateSportsEquipment";
	}
	
	@PostMapping("/updateSportsEquipment")
	public String updateSportsEquipment(SportsEquipment sportsEquipment) {
		int row = sportsEquipmentService.updateSportsEquipment(sportsEquipment);
		if(row ==0) {
			System.out.println("업데이트 실패");
			return "redirect:/updateSportsEquipment?sportsEquipmentNo="+sportsEquipment.getSportsEquipmentNo();
		} else {
			System.out.println("업데이트 성공");
		}
		return "redirect:/sportsEquipmentList";
	}
	
	@GetMapping("/deleteSportsEquipment")
	public String deleteSportsEquipment(SportsEquipment sportsEquipment) {
		int row = sportsEquipmentService.deleteSportsEquipment(sportsEquipment);
		if(row==0) {
			System.out.println("삭제 실패");
		} else {
			System.out.println("삭제 성공");
		}
		return "redirect:/sportsEquipmentList";
	}
}
