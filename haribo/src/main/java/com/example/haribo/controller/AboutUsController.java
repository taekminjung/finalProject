package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.AboutUsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AboutUsController {
	
		@Autowired  AboutUsService aboutUsService;
		
		@GetMapping("/aboutUs")
		public String reviewList(Model model,@RequestParam(defaultValue ="1") int currentPage){
			List<HashMap<String, Object>> list = aboutUsService.reviewList(currentPage); 
			System.out.println(list+"<--controller.reviewList");
			int lastPage = aboutUsService.lastPage();
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("list", list);
			model.addAttribute("lastPage", lastPage);
			
			return "public/aboutUs";
		}
}