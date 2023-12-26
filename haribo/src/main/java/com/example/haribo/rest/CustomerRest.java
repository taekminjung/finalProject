package com.example.haribo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.haribo.service.CustomerService;

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
		log.debug(""+cnt);
		
		return cnt;
	}
	
}
