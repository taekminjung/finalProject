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

import com.example.haribo.service.CalendarService;
import com.example.haribo.service.EmployeeService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired private EmployeeService employeeService;
	@Autowired private CalendarService calendarService;
	@Autowired private ProgramService programService;
	
	// 직원, 트레이너 로그인
	@PostMapping("/empLogin")
	public String loginEmployee(HttpSession session, Employee employee) {
	    log.debug(employee+"");
	    Map<String, Object> loginEmployee = employeeService.loginEmployee(employee);

	    // 세션에 로그인 정보 넣기 / 앞글자 : a-관리자, t-트레이너
	    if (loginEmployee != null) {
	        session.setAttribute("loginEmployee", loginEmployee);
	   
	        // 로그인된 직원 또는 트레이너의 아이디 가져오기
	        String employeeId = (String) loginEmployee.get("employeeId");

	        // 첫 글자를 대문자로 통일하여 확인
	        char firstCharacter = Character.toUpperCase(employeeId.charAt(0));

	        // 첫 글자에 따라 리다이렉트
	        if (firstCharacter == 'A') {
	            return "redirect:/adminHome"; // A로 시작하는 경우 adminHome으로 리다이렉트
	        } else if (firstCharacter == 'T') {
	            return "redirect:/trainerHome"; // T로 시작하는 경우 trainerHome으로 리다이렉트
	        }
	    }

	    // 로그인 실패나 기타 조건이 맞지 않을 경우 기본 로그인 페이지로 리다이렉트
	    return "redirect:/login";
	}
	
	// 직원, 트레이너 추가
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
	
	// 직원 리스트 출력
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
	
	// 직원 상세정보
	@GetMapping("/employeeInfo")
	public String employeeInfo(Model model, HttpSession session, Employee employee) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		// 서비스 호출
		Map<String,Object> empInfo = employeeService.employeeInfo(employee);
		model.addAttribute("empInfo", empInfo);
	
		return "emp/employeeInfo";
	}
	
	// 직원 상태(활성화/비활성화) 수정
	@PostMapping("/updateEmployeeStatus")
	public String updateEmployeeStatus(HttpSession session, 
			@RequestParam("employeeId") String employeeId, 
			@RequestParam("activeStatus") String activeStatus) {
		log.debug(employeeId+activeStatus);
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
