package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.haribo.service.MembershipService;
import com.example.haribo.vo.Membership;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MembershipController {
			
			@Autowired	MembershipService membershipService;
			@GetMapping("/membership")
			public String selectMembership(Model model, Membership membership) {
				List<Membership> list = membershipService.selectMembership(membership);
				System.out.println(list+"<--con.membershipList");
				
				model.addAttribute("list", list);
				
				return "public/membership";
			}
}
