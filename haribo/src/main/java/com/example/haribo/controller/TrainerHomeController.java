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

import com.example.haribo.service.CalendarService;
import com.example.haribo.service.EmployeeService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeImg;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;
import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;
import com.example.haribo.vo.SportsEquipmentOrder;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class TrainerHomeController {
	@Autowired private EmployeeService employeeService;
	@Autowired private CalendarService calendarService;
	@Autowired private ProgramService programService;
	@Autowired private SportsEquipmentService sportsEquipmentService;
	
	
	// 잊지말고 로그인 세션 추가하기 
	// 트레이너 홈페이지
	@GetMapping("/trainerHome")
	public String trainerHome(HttpSession session, Model model, Employee employee,
								@RequestParam(required = false) Integer targetYear,
								@RequestParam(required = false) Integer targetMonth,
								@RequestParam(defaultValue = "1") int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
					return "redirect:/login";
		}
		
		//Calendar Service 호출
		Map<String, Object> calMap = calendarService.calendar(targetYear, targetMonth);
		
		// programList service 호출
		List<Program> list = programService.programList(currentPage);
		
		// model 
		model.addAttribute("calMap", calMap);
		model.addAttribute("list", list);
		
		return "emp/trainerHome";
	}
	
	// 트레이너 마이페이지 + 정보수정 (사진, 비밀번호)
	// 트레이너 상세정보
	@GetMapping("/trainerOne")
	public String trainerOne(Model model, Employee employee) {
		// 서비스 호출
		Map<String,Object> empInfo = employeeService.employeeInfo(employee);
		model.addAttribute("empInfo", empInfo);
		return "emp/trainerOne";
	}
	
	// 트레이너 정보 수정
	@GetMapping("/updateTrainerPw")
	public String updateTrainerPw(HttpSession session) {
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		return "emp/updateTrainerPw";
	}
	
	@PostMapping("/updateTrainerPw")
	public String updateTrainerPw(HttpSession session, Employee employee, String newEmployeePw) {
		int row = employeeService.updateEmployeePw(employee, newEmployeePw);
		if(row != 1) {
		String url = "redirect:/updateEmployeePw?employeeNo="+employee.getEmployeeNo();
		return url;
		}
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@PostMapping("/updateTrainerImg")
	public String updateTrainerImg(HttpSession session, MultipartFile eImg, EmployeeImg employeeImg, String employeeId) {
		log.debug("\u001B[43m"+eImg.getName());
		log.debug("\u001B[43m"+eImg.getOriginalFilename());
		log.debug("\u001B[43m"+eImg.getContentType());
		log.debug("\u001B[43m"+eImg.getSize());
		
		String path = session.getServletContext().getRealPath("/upload");
		employeeService.updateEmployeeImg(eImg, employeeImg, employeeId, path);
		
		String u = "redirect:/employeeInfo?employeeNo="+employeeImg.getEmployeeNo();
		return u;
	}
	
	// 프로그램 정보 받아오기
	// 프로그램 상세보기
	@GetMapping("/trainerProgramOne")
	public String trainerProgramOne(Model model, Program program) {	
		Program resultProgram = programService.programOne(program);
		model.addAttribute("resultProgram", resultProgram);

		return "emp/trainerProgramOne";
	}
	
	// 프로그램 예약 추가하기
	@GetMapping("/trainerProgramDate")
	public String trainerProgramDate(HttpSession session, Model model, Program program, Employee employee,
						@RequestParam(required = false) Integer targetYear,
						@RequestParam(required = false) Integer targetMonth,
						@RequestParam(defaultValue = "1") int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
					return "redirect:/login";
		}
				
		//Calendar Service 호출
		Map<String, Object> calMap = calendarService.calendar(targetYear, targetMonth);
		
		// programList service 호출
		List<Program> list = programService.programList(currentPage);
		
		// model 
		model.addAttribute("calMap", calMap);
		model.addAttribute("list", list);
		
		return "emp/trainerProgramDate";
	}
	
	@PostMapping("/trainerProgramDate")
	public String trainerProgramDate(ProgramDate programDate) {
		log.debug(programDate.toString());
		programService.insertProgramDate(programDate);
		
		return "redirect:/trainerHome";
	}
	
	// 재고관리(트레이너)
	// 트레이너 지점 별 재고 현황 확인하기
	@GetMapping("/trainerStock")
	public String trainerStockList(Model model, @RequestParam(defaultValue="1") int currentPage, Branch branch) {
		List<HashMap<String, Object>> stockList = sportsEquipmentService.stockList(currentPage, branch);
		
		int lastPageStock = sportsEquipmentService.lastPageStock();
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("branch", branch);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPageStock", lastPageStock);
		
		return "emp/trainerStock";
	}
		
	// 트레이너 물품 발주 입력하기(form+insert) + sportsEquipmentOrderForm에 본사가 발주한 물품 리스트 출력
	@GetMapping("/sportsEquipmentOrderForm")
	public String sportsEquipmentOrderFormList(Model model) {
		List<SportsEquipment> orderList = sportsEquipmentService.sportsEquipmentOrderFormList();
		model.addAttribute("orderList", orderList);
				
		return "emp/sportsEquipmentOrderForm";
	}

	@PostMapping("/sportsEquipmentOrderForm")
	public String sportsEquipmentOrderFormSubmit(SportsEquipmentOrder sportsEquipmentOrder) {
		sportsEquipmentService.sportsEquipmentOrderForm(sportsEquipmentOrder);
		
		return "redirect:/trainerStock";
	}
	
	// 폐기할 물품 입력하기 (form+insert)
	@GetMapping("/trainerExpireForm")
	public String insertExpire(Model model) {
		List<SportsEquipment> expireList = sportsEquipmentService.trainerExpireFormList();
		model.addAttribute("expireList", expireList);
		return "emp/trainerExpireForm";
	}
	
	@PostMapping("/trainerExpireForm")
	public String insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		sportsEquipmentService.insertExpire(sportsEquipmentExpire);
		return "redirect:/trainerStock";
	}
}
