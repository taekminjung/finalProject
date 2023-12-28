package com.example.haribo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.haribo.service.CustomerService;
import com.example.haribo.vo.Customer;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class CustomerRest {
	@Autowired
	private CustomerService customerService;
	
	//회원 아이디 중복 체크
	@PostMapping("/customerIdCk")
	public int customerIdCk(String idCk) {
		
		log.debug(idCk);
		int cnt = customerService.idCkCnt(idCk);
		log.debug("아이디 중복체크 ->>"+cnt);
		
		return cnt;
	}
	
	//비밀번호 확인
	@PostMapping("/customerPwCk")
	public int customerPwCk(Customer customer) {
		
		log.debug(customer+"");
		int cnt = customerService.pwCkCnt(customer);
		log.debug("비밀번호 확인 ->>"+cnt);
		return cnt;
	}
	
}
