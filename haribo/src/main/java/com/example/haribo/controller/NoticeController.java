package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.mapper.NoticeMapper;
import com.example.haribo.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeMapper noticeMapper;
	
	@GetMapping(value ="/insertNotice")
	public String insertNotice() {
		
		return "insertNotice";
	}
	
	@PostMapping(value ="insertNotice")
	public String insertNotice(Notice notice) {
		// mapper 호출
		noticeMapper.insertNotice(notice);
		return "redirect:/noticeList";
	}
}
