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

import com.example.haribo.mapper.NoticeMapper;
import com.example.haribo.service.NoticeService;
import com.example.haribo.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/adminHome")
	public String adminHome() {
	
		return "emp/adminHome";
	}
	
	@GetMapping("/insertNotice")
	public String insertNotice() {
		
		return "emp/insertNotice";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) {
		// mapper 호출
		noticeService.insertNotice(notice);
		
		return "redirect:/noticeList";
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(Notice notice) {
		noticeService.deleteNotice(notice);
		
		return "redirect:/noticeList";
	}
	
	@GetMapping("/updateNotice")
	public String updateNotice(Notice notice, Model model) {
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
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		List<Notice> list = noticeService.noticeList(currentPage);
		int lastPage = noticeService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		return "emp/noticeList";
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, Notice notice) {
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
}
