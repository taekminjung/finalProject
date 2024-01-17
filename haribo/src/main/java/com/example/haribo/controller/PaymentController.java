package com.example.haribo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.PaymentService;
import com.example.haribo.vo.Payment;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	@Autowired private PaymentService paymentService;
	//결제 내역 추가
	@PostMapping("/insertPayment")
	public String insertPayment(HttpSession session, Payment payment, int customerNo) {
		
		System.out.println("\u001B[32m"+payment+"<-- con.payment");
		paymentService.insertPayment(payment);
		
		String u = "redirect:/customerSchedule?customerNo="+customerNo;
		return u;
	}
	
	@GetMapping("/adminHome")
	public String monthlyRevenue(HttpSession session, Model model, Payment payment) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> list = paymentService.monthlyRevenue();

		model.addAttribute("jan", list.get("1월"));
		model.addAttribute("feb", list.get("2월"));
		model.addAttribute("mar", list.get("3월"));
		model.addAttribute("apr", list.get("4월"));
		model.addAttribute("may", list.get("5월"));
		model.addAttribute("jun", list.get("6월"));
		model.addAttribute("jul", list.get("7월"));
		model.addAttribute("aug", list.get("8월"));
		model.addAttribute("sep", list.get("9월"));
		model.addAttribute("oct", list.get("10월"));
		model.addAttribute("nov", list.get("11월"));
		model.addAttribute("dec", list.get("12월"));
		System.out.println(list.get("1월") + "Dd");
		
		return "emp/adminHome";
	}
}
