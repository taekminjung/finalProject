package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.PaymentService;
import com.example.haribo.vo.Payment;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	//결제 내역 추가
	@PostMapping("/insertPayment")
	public String insertPayment(Payment payment) {
		
		paymentService.insertPayment(payment);
		return "";
	}
}
