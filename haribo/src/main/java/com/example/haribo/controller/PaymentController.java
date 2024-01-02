package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String insertPayment(Payment payment) {
		System.out.println("\u001B[32m"+payment+"<-- con.payment");
		paymentService.insertPayment(payment);
		
		return "customer/customerSchedule";
	}
}
