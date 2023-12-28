package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.TrainersService;
import com.example.haribo.vo.Branch;

@Controller
public class TrainersController {
	@Autowired TrainersService trainersService;
	
	@GetMapping("/trainers")
	public String trainersList(Model model, @RequestParam(defaultValue ="1") int currentPage,Branch branch){
		
		List<HashMap<String, Object>> list = trainersService.trainersList(currentPage, branch);
		System.out.println(list+"<--con.trainersList");
		int lastPage = trainersService.lastPage();
		
		model.addAttribute("branch", branch);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		return "public/trainers";
		
	}
}
