package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.QuestionService;
import com.example.haribo.vo.Question;

@Controller
public class QuestionController {
	@Autowired private QuestionService questionService;
	
	// 문의글 등록하기
	@GetMapping("/insertQuestion")
	public String insertQuestion() {
		
		return "public/insertQuestion";
	}
	
	@PostMapping("/insertQuestion")
	public String insertQuestion(Question question) {
		questionService.insertQuestion(question);
		return "redirect:/public/question";
	}
	
	// 문의 글 수정하기
	@GetMapping("/updateQuestion")
	public String updateQuestion(Question question, Model model) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion" , resultQuestion);
		
		return "public/updateQuestion";
	}

	@PostMapping("/updateQuestion")
	public String updateQuestion(Question question) {
		int row = questionService.updateQuestion(question);
		if(row == 0) {
			System.out.println("업데이트 실패");
			return "redirect:/updateQuestion?questionNo="+question.getQuestionNo();
		} else {
			System.out.println("업데이트 성공");
		}
			return "redirect:/public/questionList";
	}
	
	// 문의 글 삭제하기
	@GetMapping("/deleteQuestion")
	public String deleteQuestion(Question question) {
		questionService.deleteQuestion(question);
		
		return "redirect:/public/questionList";
	}
	

	// 문의사항 리스트(고객)
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
	// 문의사항 상세보기(고객)
	@GetMapping("/questionOne")
	public String questionOne(Model model, Question question) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		System.out.println(resultQuestion.getQuestionNo()+"<----getNoticeNo");
		System.out.println(resultQuestion.getQuestionTitle()+"<----getNoticeTitle");
		System.out.println(resultQuestion.getQuestionContent()+"<----getNoticeContent");
		System.out.println(resultQuestion.getCustomerId()+"<----getCustomerId");
		System.out.println(resultQuestion.getCreatedate()+"<----getCreatedate");
	
		return "emp/trainerQuestionOne";
	}
	
	// 문의사항 리스트(직원)
	@GetMapping("/question")
	public String question(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage");
		
		return "emp/question";
	}
	
	
	// 문의사항 상세보기(직원)
	@GetMapping("/questionOneEmp")
	public String questionOneEmp(Model model, Question question) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		System.out.println(resultQuestion.getQuestionNo()+"<----getNoticeNo");
		System.out.println(resultQuestion.getQuestionTitle()+"<----getNoticeTitle");
		System.out.println(resultQuestion.getQuestionContent()+"<----getNoticeContent");
		System.out.println(resultQuestion.getCustomerId()+"<----getCustomerId");
		System.out.println(resultQuestion.getCreatedate()+"<----getCreatedate");
	
		return "emp/questionOne";
	}
	
	// 문의글 리스트(트레이너)
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
	
	// 문의 글 상세보기(트레이너)
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
}
