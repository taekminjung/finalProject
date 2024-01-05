package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ContactService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.service.ReviewService;
import com.example.haribo.vo.Contact;
import com.example.haribo.vo.Program;

@Controller
public class HomeController {
	@Autowired private ContactService contactService;
	@Autowired private ReviewService reviewService;
	@Autowired private ProgramService programService;
	
	@GetMapping("/home")
	public String home(Model model, Program program) {
		//리뷰 출력
			HashMap<String, Object> rMap = reviewService.reviewListMap();
		//프로그램 출력
			List<Program> plist = programService.selectProgram(program);
			System.out.println(rMap+"<-- home.rMap");
			//view로 보낼 모델에 담기
			model.addAttribute("plist", plist);
			model.addAttribute("list", rMap.get("list"));
			model.addAttribute("rpList", rMap.get("rpList"));
		return "public/home";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "public/login";
	}@PostMapping("/addcontact")
	public String insertContact(Contact paramContact) {
		System.out.println("\u001B[42m"+paramContact);
		//서비스 호출
		int insertContact = contactService.insertContact(paramContact);
		
		return "public/home";
	}
	
}
