package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.EmployeeService;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired private EmployeeService employeeService;
	
	@PostMapping("/empLogin")
	public String loginEmployee(HttpSession session, Employee employee) {
		Employee loginEmployee = employeeService.loginEmployee(employee);
		
		if(loginEmployee != null) {
			session.setAttribute("loginEmployee", loginEmployee);
		} else {
			return "redirect:/login";
		}
		//리턴
		return "redirect:/adminHome";
	}
	
	@GetMapping("/insertEmployee")
	public String addEmployee() {
		
		return "emp/insertEmployee";
	}
	
	@PostMapping("/insertEmployee")
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
	
	@GetMapping("/employeeInfo")
	public String employeeInfo(Model model, HttpSession session, Employee employee) {
		if(session.getAttribute("loginEmployee")==null) {
			return "redirect:/login";
		}
		Map<String,Object> empInfo = employeeService.employeeInfo(employee);
		model.addAttribute("empInfo", empInfo);
	
		return "emp/employeeInfo";
	}
	

	@PostMapping("/updateEmployeeStatus")
	public String updateEmployeeStatus(HttpSession session, 
			@RequestParam("employeeId") String employeeId, 
			@RequestParam("activeStatus") String activeStatus) {
	    employeeService.updateEmployeeStatus(employeeId, activeStatus);
	    return "emp/employeeList";
	}
	
	@GetMapping("/updateEmployeePw")
	public String updateEmployeePw(HttpSession session) {
		
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		return "emp/updateEmployeePw";
	}
	
	@PostMapping("/updateEmployeePw")
	public String updateEmployeePw(HttpSession session, Employee employee, String newEmployeePw) {
		int row = employeeService.updateEmployeePw(employee, newEmployeePw);
		if(row != 1) {
		String url = "redirect:/updateEmployeePw?employeeNo="+employee.getEmployeeNo();
		return url;
		}
		session.invalidate();
		
		return "redirect:/home";
	}
}
