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
import com.example.haribo.service.CustomerService;
import com.example.haribo.service.ProgramReservationService;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerAttendance;
import com.example.haribo.vo.CustomerDetail;
import com.example.haribo.vo.CustomerImg;
import com.example.haribo.vo.Review;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ProgramReservationService programReservationService;
	//회원 로그인
	@PostMapping("/login")
	public String loginCustomer(HttpSession session, Customer paramCustomer) {
		log.debug("\u001B[42m"+paramCustomer);
		
		//서비스 호출
		Map<String,Object> loginCustomer = customerService.loginCustomer(paramCustomer);
		log.debug("\u001B[42m"+loginCustomer);
		
		//세션에 로그인 정보 넣기
		if(loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
		}else {
			return "redirect:/login";
		}
		
		//리턴
		return "redirect:/home";
	}
	
	//회원 로그아웃
	@GetMapping("/logout")
	public String logoutCustomer(HttpSession session) {
		//세션 정보 삭제
		session.invalidate();
		
		//리턴
		return "redirect:/home";
	}
	
	//회원가입
	@GetMapping("/insertCustomer")
	public String insertCustomer(HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") != null) {
			return "redirect:/home";
		}
		return "public/insertCustomer";
	}
	@PostMapping("/insertCustomer")
	public String insertCustomer(Customer customer, CustomerDetail customerDetail, String emailId, String emailDomain) {
		
		log.debug(customer.toString());
		log.debug(customerDetail.toString());
		log.debug(emailId+emailDomain);
		
		//서비스 호출
		customerService.insertCustomer(customer, customerDetail, emailId, emailDomain);
		
		//리턴
		return "redirect:/home";
	}
	
	//회원 상세 정보 출력
	@GetMapping("/customerInfo")
	public String customerInfo(HttpSession session, Customer customer, Model model) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		
		//서비스 호출
		Map<String,Object> custInfoMap = customerService.customerInfo(customer);
		log.debug(custInfoMap+"");
		model.addAttribute("custInfoMap", custInfoMap);
		
		//리턴
		return "customer/customerInfo";
	}
	
	//회원 일정 출력
	@GetMapping("/customerSchedule")
	public String customerSchedule(HttpSession session, Model model, Customer customer,
									@RequestParam(required = false) Integer targetYear,
									@RequestParam(required = false) Integer targetMonth) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		//CalendarService 호출
		Map<String, Object> calMap = calendarService.calendar(targetYear, targetMonth);
		//ProgramReservationService 호출
		List<Map<String,Object>> proList = programReservationService.programReservationDateByCustomerNo(customer,(int)calMap.get("targetYear"),(int)calMap.get("targetMonth"));
		log.debug(proList+"");
		//model
		model.addAttribute("calMap", calMap);
		model.addAttribute("proList", proList);
		//리턴
		return "customer/customerSchedule";
	}
	
	//회원 상세정보 수정
	@PostMapping("/updateCustomerInfo")
	public String updateCustomerInfo(CustomerDetail customerDetail, String emailId, String emailDomain) {
		
		log.debug("updateCon->"+customerDetail+emailId+emailDomain);
		//CustomerService 호출
		customerService.updateCustomerInfo(customerDetail, emailId, emailDomain);
		
		//리턴
		String u = "redirect:/customerInfo?customerNo="+customerDetail.getCustomerNo();
		return u;
	}
	
	//회원 비밀번호 수정
	@GetMapping("/updateCustomerPw")
	public String updateCustomerPw(HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		
		return "customer/updateCustomerPw";
	}
	
	@PostMapping("/updateCustomerPw")
	public String updateCustomerPw(HttpSession session, Customer customer, String newCustomerPw) {
		
		log.debug(customer+newCustomerPw);
		
		//customerService 호출
		int row = customerService.updateCustomerPw(customer, newCustomerPw);
		if(row != 1) {
			String u = "redirect:/updateCustomerPw?customerNo="+customer.getCustomerNo();
			return u;
		}
		session.invalidate();
		
		//리턴
		return "redirect:/home";
	}
	
	//회원탈퇴(active를 N으로 바꾸고 detail만 삭제)
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		
		//리턴
		return "customer/deleteCustomer";
	}
		
	@PostMapping("/deleteCustomer")
	public String deleteCustomer(HttpSession session,Customer customer) {
		String path = session.getServletContext().getRealPath("/upload");
		//customerService 호출
		customerService.deleteCustomer(customer, path);
		session.invalidate();
		
		//리턴
		return "redirect:/home";
	}
	
	//회원사진 변경(추가,삭제)
	@PostMapping("/updateCustomerImg")
	public String updateCustomerImg(HttpSession session, MultipartFile cImg, CustomerImg customerImg, String customerId) {
		log.debug("\u001B[43m"+cImg.getName());
		log.debug("\u001B[43m"+cImg.getOriginalFilename());
		log.debug("\u001B[43m"+cImg.getContentType());
		log.debug("\u001B[43m"+cImg.getSize());
		
		String path = session.getServletContext().getRealPath("/upload");
		log.debug("\u001B[43m"+path);
		customerService.updateCustomerImg(cImg, customerImg, path, customerId);
		
		String u = "redirect:/customerSchedule?customerNo="+customerImg.getCustomerNo();
		return u;
	}
	
	//회원 출결(입실)
	@GetMapping("/insertAttendance")
	public String insertAttendance(CustomerAttendance customerAttendance, int customerNo) {
		customerService.insertCustomerAttendanceEnter(customerAttendance);
		
		String u = "redirect:/customerSchedule?customerNo="+customerNo;
		return u;
	}
	//회원 출결(퇴실)
	@GetMapping("/updateAttendance")
	public String updateAttendance(CustomerAttendance customerAttendance, int customerNo) {
		customerService.updateCustomerAttendanceExit(customerAttendance);
		
		String u = "redirect:/customerSchedule?customerNo="+customerNo;
		return u;
	}
	//회원 별 작성한 리뷰 출력
		@GetMapping("/myReviewList")
		public String selectMyReview(HttpSession session , Model model, Customer customer) {
			int customerNo = (int)((Map)session.getAttribute("loginCustomer")).get("customerNo");

			List<HashMap<String, Object>> list  = customerService.selectMyReview(customerNo);
			System.out.println(list+"<==con.reviewList");
			model.addAttribute("list", list);
			
			String u = "customer/myReviewList";
			return u;
		}
		//리뷰 수정
		@GetMapping("/updateReview")
		public int updateReview(Review review) {
			
		}
		//리뷰 삭제
		@GetMapping("/deleteReview")
		public String deleteReview(Review review) {
			customerService.deleteReview(review);
			
			return "redirect:/myReviewList";
		}
		
		
}
