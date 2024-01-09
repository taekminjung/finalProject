package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.haribo.service.BranchService;
import com.example.haribo.vo.Branch;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BranchController {
		@Autowired BranchService branchService;
		
		@GetMapping("/branch")
		public String branchList(Model model) {
		
			List<Branch> blist = branchService.branchList();
			System.out.println(blist+"<--con.branchList");
	
			model.addAttribute("blist", blist);
			
			return "public/branch";
		}
		
		@GetMapping("/branchStock")
		public String branchStock(Model model) {
			
			List<Branch> list = branchService.branchStock();
			model.addAttribute("list", list);
			
			return "emp/branchStock";
		}
		
}
