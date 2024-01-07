package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.QuestionReplyService;
import com.example.haribo.vo.QuestionReply;

@Controller
public class QuestionReplyController {
	@Autowired private QuestionReplyService questionreplyService;
	
	// 문의글 등록하기
	@GetMapping("/insertQuestionReply")
	public String insertQuestionReply() {
		
		return "public/";
	}
	
	@PostMapping("/insertQuestionReply")
	public String insertQuestionReply(QuestionReply questionReply) {
		questionreplyService.insertQuestionReply(questionReply);
		return "redirect:/";
	}
	
	// 문의 글 삭제하기
	@GetMapping("/deleteQuestionReply")
	public String deleteQuestionReply(QuestionReply questionReply) {
		questionreplyService.deleteQuestionReply(questionReply);
		
		return "redirect:/";
	}

	// 문의 답글 리스트
	@GetMapping("/questionReply")
	public String questionReply(Model model, QuestionReply questionReply) {
		List <QuestionReply> list = questionreplyService.questionReply(questionReply);
		model.addAttribute("list", list);
		
		return "public/questionList";
	}

}
