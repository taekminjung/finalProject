package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.QuestionReplyService;
import com.example.haribo.vo.QuestionReply;

@Controller
public class QuestionReplyController {
	@Autowired private QuestionReplyService questionReplyService;
	
	// 문의답글 등록하기
	@GetMapping("/insertQuestionReply")
	public String insertQuestionReply() {
		
		return "emp/trainerQuestionOne";
	}
	
	@PostMapping("/trainerQuestionOne")
	public String insertQuestionReply(QuestionReply questionReply) {
		questionReplyService.insertQuestionReply(questionReply);
		
		String a = "redirect:/trainerQuestionOne?questionNo="+questionReply.getQuestionNo();
		return a;
	}
	
	// 문의 답글 삭제하기 (트레이너)
	@PostMapping("/deleteQuestionReply")
	public String deleteQuestionReply(QuestionReply questionReply) {
		questionReplyService.deleteQuestionReply(questionReply);
		
		return "redirect:/trainerQuestionOne?questionNo="+questionReply.getQuestionNo();
	}
	
	// 문의답글 등록하기(직원)
	@GetMapping("/insertQuestionReplyEmp")
	public String insertQuestionReplyEmp() {
		return "emp/employeeQuestionOne";
	}
	
	@PostMapping("/insertQuestionReplyEmp")
	public String insertQuestionReplyEmp(QuestionReply questionReply) {
		questionReplyService.insertQuestionReply(questionReply);
		
		String a = "redirect:/employeeQuestionOne?questionNo="+questionReply.getQuestionNo();
		return a;
	}
	
	// 문의 답글 삭제하기 (직원)
	@PostMapping("/deleteQuestionReplyEmp")
	public String deleteQuestionReplyEmp(QuestionReply questionReply) {
		questionReplyService.deleteQuestionReply(questionReply);
		
		return "redirect:/employeeQuestionOne?questionNo="+questionReply.getQuestionNo();
	}
}