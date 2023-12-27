package com.example.haribo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.CustomerService;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerDetail;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	//회원 로그인
	@PostMapping("/login")
	public String loginCustomer(HttpSession session, Customer paramCustomer) {
		log.debug("\u001B[42m"+paramCustomer);
		
		//서비스 호출
		Customer loginCustomer = customerService.loginCustomer(paramCustomer);
		log.debug("\u001B[42m"+loginCustomer);
		
		//세션에 로그인 정보 넣기
		if(loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
		}else {
			return "redirect:/login";
		}
		
		//리턴
		return "redirect:/home";
	}
	
	//회원 로그아웃
	@GetMapping("/logout")
	public String logoutCustomer(HttpSession session) {
		//세션 정보 삭제
		session.invalidate();
		
		//리턴
		return "redirect:/home";
	}
	
	//회원가입
	@GetMapping("/addCustomer")
	public String addCustomer() {
		
		return "public/addCustomer";
	}
	@PostMapping("/addCustomer")
	public String addCustomer(Customer customer, CustomerDetail customerDetail) {
		
		log.debug(customer.toString());
		log.debug(customerDetail.toString());
		
		//서비스 호출
		customerService.addCustomer(customer, customerDetail);
		
		//리턴
		return "redirect:/home";
	}
	
	//회원 상세 정보 출력
	@GetMapping("/customerInfo")
	public String customerInfo(HttpSession session, Customer customer, Model model) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		
		//서비스 호출
		Map<String,Object> custInfoMap = customerService.getCustomerInfo(customer);
		log.debug(custInfoMap.toString());
		model.addAttribute("custInfoMap", custInfoMap);
		
		//리턴
		return "customerInfo";
	}
}
