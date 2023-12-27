package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.EmployeeService;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired private EmployeeService employeeService;
	
	@GetMapping("/addEmployee")
	public String addEmployee() {
		
		return "emp/addEmployee";
	}
	
	@PostMapping("/addEmployee")
	public String addEmployee(Employee employee, EmployeeDetail employeeDetail) {
	log.debug(employee.toString());
	log.debug(employeeDetail.toString());
	
	employeeService.addEmployee(employee, employeeDetail);
	
	return "redirect:/employeeList";
	}
	
	@GetMapping("/employeeList")
	public String employeeList(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<HashMap<String, Object>> list = employeeService.employeeList(currentPage);
		System.out.println(list+"<--employeeList");
		int lastPage = employeeService.lastPage();
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "emp/employeeList";
	}
	
}
