package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.haribo.service.MembershipService;
import com.example.haribo.vo.Membership;
import com.example.haribo.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MembershipController {
			
			@Autowired	MembershipService membershipService;
			//멤버십 출력
			@GetMapping("/membership")
			public String selectMembership(Model model, Membership membership) {
				List<Membership> list = membershipService.selectMembership(membership);
				System.out.println(list+"<--con.membershipList");
				
				model.addAttribute("list", list);
				
				return "public/membership";
			}
			//멤버십 상세,결제페이지 이동
			@GetMapping("/payment")
			public String payment(Model model, Membership membership, Payment payment,HttpSession session) {
				// 세션 검사
				if(session.getAttribute("loginCustomer") == null) {
					return "redirect:/login";
				}
				List<Membership> list = membershipService.selectMembershipDetail(membership);
				System.out.println(list+"<--con.membershipDetail");
				
				model.addAttribute("list", list);
				model.addAttribute("membership", membership);
				return "customer/payment";
			}
}
