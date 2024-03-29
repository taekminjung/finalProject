package com.example.haribo.controller;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.service.SportsEquipmentService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;
import com.example.haribo.vo.SportsEquipmentImg;
import com.example.haribo.vo.SportsEquipmentOrder;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SportsEquipmentController {
	@Autowired private SportsEquipmentService sportsEquipmentService;
	
	// 관리자 홈페이지 부분
	@GetMapping("/insertSportsEquipment")
	public String insertSportsEquipment(HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		return "emp/insertSportsEquipment";
	}
	
	@PostMapping("/insertSportsEquipment")
	public String insertSportsEquipment(HttpSession session, MultipartFile seImg, SportsEquipment sportsEquipment, SportsEquipmentImg sportsEquipmentImg) {
		String path = session.getServletContext().getRealPath("/upload");
		int sportsEquipmentNo = sportsEquipmentService.insertSportsEquipment(sportsEquipment);
		sportsEquipmentImg.setSportsEquipmentNo(sportsEquipmentNo);
		sportsEquipmentService.insertSportsEquipmentImg(seImg, sportsEquipmentImg, sportsEquipment, path);
		System.out.println(seImg+"<--seImg");
		
		return "redirect:/sportsEquipmentList";
	}
			
	@GetMapping("/sportsEquipmentList")
	public String sportsEquipmentList(HttpSession session, Model model, @RequestParam(defaultValue="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		List<SportsEquipment> list = sportsEquipmentService.sportsEquipmentList(currentPage);
		int lastPage = sportsEquipmentService.lastPage();
		System.out.println(lastPage+"<--lastPage");
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
				
		return "emp/sportsEquipmentList";
	}
	
	@GetMapping("/sportsEquipmentOrderCk")
	public String sportsEquipmentOrderCk(HttpSession session, Model model, @RequestParam(defaultValue="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		List<SportsEquipmentOrder> list = sportsEquipmentService.sportsEquipmentOrderCk(currentPage);
		int lastPageOrder = sportsEquipmentService.lastPageOrder();
		
		model.addAttribute("list", list);
		model.addAttribute("lastPageOrder", lastPageOrder);
		model.addAttribute("currentPage", currentPage);
		return "emp/sportsEquipmentOrderCk";
	}

	@GetMapping("/sportsEquipmentExpiredList")
	public String sportsEquipmentExpiredList(HttpSession session, Model model, @RequestParam(defaultValue="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		List<SportsEquipmentExpire> list = sportsEquipmentService.sportsEquipmentExpiredList(currentPage);
		System.out.println(list + "<-- list");
		
		int lastPageExpire = sportsEquipmentService.lastPageExpire();
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPageExpire", lastPageExpire);		
				
		return "emp/sportsEquipmentExpiredList";
	}
	
	@GetMapping("/sportsEquipmentOne")
	public String sportsEquipmentOne(HttpSession session, Model model, SportsEquipment sportsEquipment) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		SportsEquipment list = sportsEquipmentService.sportsEquipmentOne(sportsEquipment);
		model.addAttribute("list", list);
		
		return "emp/sportsEquipmentOne";
	}
	
	@GetMapping("/updateSportsEquipment")
	public String updateSportsEquipment(HttpSession session, Model model, SportsEquipment sportsEquipment) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		SportsEquipment list = sportsEquipmentService.sportsEquipmentOne(sportsEquipment);
		model.addAttribute("list", list);
		return "emp/updateSportsEquipment";
	}
	
	@PostMapping("/updateSportsEquipment")
	public String updateSportsEquipment(SportsEquipment sportsEquipment) {
		int row = sportsEquipmentService.updateSportsEquipment(sportsEquipment);
		if(row ==0) {
			System.out.println("업데이트 실패");
			return "redirect:/updateSportsEquipment?sportsEquipmentNo="+sportsEquipment.getSportsEquipmentNo();
		} else {
			System.out.println("업데이트 성공");
		}
		return "redirect:/sportsEquipmentList";
	}
	
	@PostMapping("/updateOrderStatus")
	public String updateOrderStatus(SportsEquipmentOrder sportsEquipmentorder) {
	   int row = sportsEquipmentService.updateOrderStatus(sportsEquipmentorder);

	    return "redirect:/sportsEquipmentOrderCk";
	}
	
	@GetMapping("/branchStockList")
	public String stockList(HttpSession session, Model model, @RequestParam(defaultValue="1")int currentPage, Branch branch) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		List<HashMap<String, Object>> list = sportsEquipmentService.stockList(currentPage, branch);
		
		int lastPageStock = sportsEquipmentService.lastPageStock();
		
		model.addAttribute("list", list);
		model.addAttribute("branch", branch);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPageStock", lastPageStock);
		
		return "emp/branchStockList";
	}
}
