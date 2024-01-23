package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.HomeMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Employee;

@Service
public class HomeService {
	@Autowired private HomeMapper homeMapper;
	
	public int countEmployee() {
		return homeMapper.countEmployee();
	}

	public int countCustomer() {
		return homeMapper.countCustomer();
	}
}
