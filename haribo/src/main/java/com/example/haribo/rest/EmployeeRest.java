package com.example.haribo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.haribo.service.EmployeeService;
import com.example.haribo.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController

public class EmployeeRest {
	@Autowired private EmployeeService employeeService;
	
	// 직원 아이디 중복 체크
	@PostMapping("/employeeIdCk")
	public int employeeIdCk(String idCk) {
		log.debug(idCk);
		int cnt = employeeService.idCkEmp(idCk);
		log.debug(cnt+"<--id중복체크");
		
		return cnt;
	}

	// 비밀번호 확인
	@PostMapping("/employeePwCk")
	public int employeePwCk(Employee employee) {
		
		int cnt = employeeService.pwCkEmp(employee);
		return cnt;
	}
}
