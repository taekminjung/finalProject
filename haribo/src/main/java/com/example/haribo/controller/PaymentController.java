package com.example.haribo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.PaymentService;
import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.Payment;
import com.example.haribo.vo.SportsEquipmentOrder;

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

}
