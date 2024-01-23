package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.BranchService;
import com.example.haribo.service.ContactService;
import com.example.haribo.service.HomeService;
import com.example.haribo.service.PaymentService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.service.ReviewService;
import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.Payment;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.SportsEquipmentOrder;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired private ContactService contactService;
	@Autowired private ReviewService reviewService;
	@Autowired private ProgramService programService;
	@Autowired private BranchService branchService;
	@Autowired private PaymentService paymentService;
	@Autowired private SportsEquipmentService sportsEquipmentService;
	@Autowired private HomeService homeService;
	
	@GetMapping("/home")
	public String home(Model model) {
		//리뷰 출력
			HashMap<String, Object> rMap = reviewService.reviewListMap();
		//프로그램 출력
			List<HashMap<String, Object>> plist = programService.selectProgram();
			//상담폼에 지점출력
			List<Branch> blist = branchService.branchList();
			System.out.println(blist+"<==homcon.blist");
			System.out.println(rMap+"<-- home.rMap");
			//view로 보낼 모델에 담기
			model.addAttribute("blist", blist);
			model.addAttribute("plist", plist);
			model.addAttribute("list", rMap.get("list"));
			model.addAttribute("rpList", rMap.get("rpList"));
		return "public/home";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "public/login";
	}
	
	
	@GetMapping("/adminHome")
	public String monthlyRevenue(HttpSession session, Model model, 
								@RequestParam(required = false) Integer targetYear) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		Map<String,Object> list = paymentService.monthlyRevenue(targetYear);
		int countEmployee = homeService.countCustomer();
		int countCustomer = homeService.countEmployee();
		int notAccept = sportsEquipmentService.countSportsEquipment();
		
		model.addAttribute("emp",countEmployee);
		model.addAttribute("cus",countCustomer);
		model.addAttribute("year", list.get("year"));
		model.addAttribute("jan", list.get("1월"));
		model.addAttribute("feb", list.get("2월"));
		model.addAttribute("mar", list.get("3월"));
		model.addAttribute("apr", list.get("4월"));
		model.addAttribute("may", list.get("5월"));
		model.addAttribute("jun", list.get("6월"));
		model.addAttribute("jul", list.get("7월"));
		model.addAttribute("aug", list.get("8월"));
		model.addAttribute("sep", list.get("9월"));
		model.addAttribute("oct", list.get("10월"));
		model.addAttribute("nov", list.get("11월"));
		model.addAttribute("dec", list.get("12월"));
		model.addAttribute("notAccept", notAccept);
		System.out.println(list.get("1월") + "Dd");
	System.out.println(list.get("1월")+"<-----");
System.out.println(countEmployee+"countEmployeesdfsd");
		
		return "emp/adminHome";
	}
	
}
