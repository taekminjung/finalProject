package com.example.haribo.controller;

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
	
	@GetMapping("/insertNotice")
	public String insertNotice() {
		
		return "insertNotice";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) {
		// mapper 호출
		noticeService.insertNotice(notice);
		return "redirect:/noticeList";
	}
	
	@GetMapping("/adminTest")
	public String adminTest() {
		return "adminTest";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		
		return noticeService.noticeList(model, currentPage);
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, Notice notice) {
		Notice resultNotice = noticeService.noticeOne(notice);
		model.addAttribute("resultNotice", resultNotice);
		System.out.println(resultNotice.getNoticeNo()+"<----getNoticeNo");
		System.out.println(resultNotice.getNoticeTitle()+"<----getNoticeTitle");
		System.out.println(resultNotice.getNoticeContent()+"<----getNoticeContent");
		
		return "noticeOne";
	}
	
}
