package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.NoticeService;
import com.example.haribo.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/insertNotice")
	public String insertNotice(HttpSession session) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		return "emp/insertNotice";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) {
		// mapper 호출
		noticeService.insertNotice(notice);
		
		return "redirect:/noticeList";
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(HttpSession session, Notice notice) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		noticeService.deleteNotice(notice);
		
		return "redirect:/noticeList";
	}
	
	@GetMapping("/updateNotice")
	public String updateNotice(HttpSession session, Notice notice, Model model) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice" , resultNotice);
		return "emp/updateNotice";
	}

	@PostMapping("/updateNotice")
	public String updateNotice(Notice notice) {
		int row = noticeService.updateNotice(notice);
		if(row==0) {
			System.out.println("업데이트 실패");
			return "redirect:/updateNotice?noticeNo="+notice.getNoticeNo();
		} else {
			System.out.println("업데이트 성공");
		}
			return "redirect:/noticeList";
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(HttpSession session, Model model, Notice notice) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice", resultNotice);
		System.out.println(resultNotice.getNoticeNo()+"<----getNoticeNo");
		System.out.println(resultNotice.getNoticeTitle()+"<----getNoticeTitle");
		System.out.println(resultNotice.getNoticeContent()+"<----getNoticeContent");
		
		return "emp/noticeOne";
	}
	@GetMapping("/customerNoticeList")
	public String publicNoticeList(Model model, @RequestParam(defaultValue ="1")int currentPage) {
				List<Notice> list = noticeService.noticeList(currentPage);
				int lastPage = noticeService.lastPage();
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("list", list);
				model.addAttribute("lastPage", lastPage);
				
		return "public/customerNoticeList";
	}
	@GetMapping("/customerNoticeOne")
	public String customerNoticeOne(Model model, Notice notice) {

		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice", resultNotice);
		System.out.println(resultNotice.getNoticeNo()+"<----getNoticeNo");
		System.out.println(resultNotice.getNoticeTitle()+"<----getNoticeTitle");
		System.out.println(resultNotice.getNoticeContent()+"<----getNoticeContent");
	
		return "public/customerNoticeOne";
	}
	
	@GetMapping("/trainerNotice")
	public String trainerNotice(HttpSession session, Model model, @RequestParam(defaultValue ="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
				List<Notice> list = noticeService.noticeList(currentPage);
				int lastPage = noticeService.lastPage();
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("list", list);
				model.addAttribute("lastPage", lastPage);
				
		return "emp/trainerNotice";
	}
	
	// 공지사항 검색 기능
	@PostMapping("/trainerNotice")
	public String trainerNotice(Model model, Notice notice,@RequestParam(defaultValue = "1") int currentPage) {
		List<Notice> list = noticeService.searchByNotice(notice, currentPage);
		System.out.println(list+"<--list");
		int lastPage = noticeService.searchLastPage(notice);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		return "emp/trainerNotice";
	}
		
	@GetMapping("/trainerNoticeOne")
	public String trainerNoticeOne(HttpSession session, Model model, Notice notice) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}

		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice", resultNotice);
		System.out.println(resultNotice.getNoticeNo()+"<----getNoticeNo");
		System.out.println(resultNotice.getNoticeTitle()+"<----getNoticeTitle");
		System.out.println(resultNotice.getNoticeContent()+"<----getNoticeContent");
	
		return "emp/trainerNoticeOne";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(HttpSession session, Model model, @RequestParam(defaultValue ="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		List<Notice> list = noticeService.noticeList(currentPage);
		int lastPage = noticeService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		System.out.println(lastPage+"<--lastPage");
		
		return "emp/noticeList";
	}
	
	// 공지사항 검색 기능
	@PostMapping("/noticeList")
	public String searchByNotice(Model model, Notice notice,@RequestParam(defaultValue = "1") int currentPage) {
		List<Notice> list = noticeService.searchByNotice(notice, currentPage);
		System.out.println(list+"<--list");
		int lastPage = noticeService.searchLastPage(notice);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		return "emp/noticeList";
	}
}
