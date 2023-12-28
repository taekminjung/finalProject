package com.example.haribo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SportsEquipmentController {
	
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
}
