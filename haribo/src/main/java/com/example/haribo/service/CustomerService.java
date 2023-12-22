package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.CustomerMapper;
import com.example.haribo.vo.Customer;
@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	//회원 로그인
	public Customer loginCustomer(Customer paramCustomer) {
		
		return customerMapper.loginCustomer(paramCustomer);
	}
}
