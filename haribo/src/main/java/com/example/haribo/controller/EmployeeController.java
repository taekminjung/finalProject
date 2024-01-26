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
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.service.EmployeeService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;
import com.example.haribo.vo.EmployeeImg;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired private EmployeeService employeeService;
	// 직원, 트레이너 로그인
	@PostMapping("/empLogin")
	public String loginEmployee(HttpSession session, Employee employee) {
	    log.debug(employee+"");
	    Map<String, Object> loginEmployee = employeeService.loginEmployee(employee);

	    // 세션에 로그인 정보 넣기
	    if (loginEmployee != null) {
	    	
	        session.setAttribute("loginEmployee", loginEmployee);

	        String employeeLevel = loginEmployee.get("employeeLevel").toString();
	        
	        if ("1".equals(employeeLevel)) {
	            return "redirect:/adminHome";
	        } else if ("0".equals(employeeLevel)) {
	            return "redirect:/trainerHome";
	        }
	    }

	    // 로그인 실패나 기타 조건이 맞지 않을 경우 기본 로그인 페이지로 리다이렉트
	    return "redirect:/login";
	}
	
	
	// 직원, 트레이너 추가
	@GetMapping("/insertEmployee")
	public String addEmployee(Model model, HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		List<Branch> branchList = employeeService.insertEmployeebranch();
		model.addAttribute("branchList", branchList);
		
		return "emp/insertEmployee";
	}
	
	@PostMapping("/insertEmployee")
	public String addEmployee(Employee employee, EmployeeDetail employeeDetail, Branch branch) {
		log.debug(employee.toString());
		log.debug(employeeDetail.toString());
		
		employeeService.addEmployee(employee, employeeDetail);
		
		return "redirect:/employeeList";
	}
	
	// 직원 리스트 출력
	@GetMapping("/employeeList")
	public String employeeList(HttpSession session, Model model, @RequestParam(defaultValue="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
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
	
	@PostMapping("/updateEmployeeImg")
	public String updateEmployeeImg(HttpSession session, MultipartFile eImg, EmployeeImg employeeImg, String employeeId) {
		log.debug("\u001B[43m"+eImg.getName());
		log.debug("\u001B[43m"+eImg.getOriginalFilename());
		log.debug("\u001B[43m"+eImg.getContentType());
		log.debug("\u001B[43m"+eImg.getSize());
		
		String path = session.getServletContext().getRealPath("/upload");
		employeeService.updateEmployeeImg(eImg, employeeImg, employeeId, path);
		
		String u = "redirect:/employeeInfo?employeeNo="+employeeImg.getEmployeeNo();
		return u;
		
	}
	
   	//직원탈퇴 (비활성화된 경우 detail 삭제)
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(HttpSession session) {
		if(session.getAttribute("loginEmployee")== null) {
			return "redirect:/login";
		}
		return "emp/employeeList";
	}
	
	@PostMapping("/deleteEmployee")
	public String deleteEmployee(HttpSession session, Employee employee, EmployeeDetail employeeDetail, EmployeeImg employeeImg) {
		String path = session.getServletContext().getRealPath("/upload");
		//employeeService 호출
		employeeService.deleteEmployee(employee, employeeDetail, employeeImg, path);
		return "redirect:/employeeList";
	}
}
