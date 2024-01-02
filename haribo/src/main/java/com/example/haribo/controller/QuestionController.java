package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.QuestionService;
import com.example.haribo.vo.Notice;
import com.example.haribo.vo.Question;

@Controller
public class QuestionController {
	@Autowired private QuestionService questionService;
	/*
	@GetMapping("/questionList")
	public String questionList(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage");
		
		return "emp/questionList";
	}
	
	@GetMapping("/insertQuestion")
	public String insertQuestion() {
		
		return "public/question";
	}
	
	@PostMapping("/insertQuestion")
	public String insertQuestion(Question question) {
		//mapper 호출하기
		QuestionService.insertQuestion(question);
		
		return "redirect:/public/question";
	}
	
	@GetMapping("/trainerQuestion")
	public String trainerQuestion(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage");
				
		return "emp/trainerQuestion";
	}
	@GetMapping("/trainerQuestionOne")
	public String trainerQuestionOne(Model model, Question question) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		System.out.println(resultQuestion.getQuestionNo()+"<----getNoticeNo");
		System.out.println(resultQuestion.getQuestionTitle()+"<----getNoticeTitle");
		System.out.println(resultQuestion.getQuestionContent()+"<----getNoticeContent");
		System.out.println(resultQuestion.getCustomerId()+"<----getCustomerId");
		System.out.println(resultQuestion.getCreatedate()+"<----getCreatedate");
	
		return "emp/trainerQuestionOne";
	}
	*/
}
