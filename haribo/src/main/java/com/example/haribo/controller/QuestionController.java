package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.QuestionReplyService;
import com.example.haribo.service.QuestionService;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuestionController {
	@Autowired private QuestionService questionService;
	@Autowired private QuestionReplyService questionReplyService;
	
	// 문의글 등록하기
	@GetMapping("/insertQuestion")
	public String insertQuestion() {
		
		return "public/insertQuestion";
	}
	
	@PostMapping("/insertQuestion")
	public String insertQuestion(HttpSession session, Question question ) {
		System.out.println(question+"<--qcon.question");
		
		questionService.insertQuestion(question);
		return "redirect:/questionList";
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
		System.out.println(question+"<===questionNO?");
		int row = questionService.updateQuestion(question);
		if(row == 0) {
			System.out.println("업데이트 실패");
			return "redirect:/questionOne?questionNo="+question.getQuestionNo();
		} else {
			System.out.println("업데이트 성공");
		}
			return "redirect:/questionList";
	}
	
	// 문의 글 삭제하기
	@GetMapping("/deleteQuestion")
	public String deleteQuestion(Question question) {
		System.out.println(question+"<====qcon.question");
		questionService.deleteQuestion(question);
		
		return "redirect:/questionList";
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
		
		return "public/questionList";
	}
	
	// 문의사항 검색 기능 (직원)
	@PostMapping("/employeeQuestion")
	public String searchByQuestion(Model model, Question question, @RequestParam(defaultValue="1")int currentPage) {
		List<Question> list = questionService.searchByQuestion(question, currentPage);
		int lastPage = questionService.searchLastPage(question);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list+"<---list");
		System.out.println(lastPage+"<---lastPaaagggee");
		
		return "emp/employeeQuestion";
	}
	
	// 문의사항 상세보기(고객)
	@GetMapping("/questionOne")
	public String questionOne(Model model, Question question) {
		//문의 상세
		Question resultQuestion = questionService.questionOne(question);
		
		System.out.println(resultQuestion+"<---con.questionOne");
		//문의 답변 리스트
		List<QuestionReply> list = questionReplyService.selectquestionReply(question);
		
		System.out.println(list+"<--con.replyList");
		
		model.addAttribute("question", question);
		model.addAttribute("list", list);
		model.addAttribute("resultQuestion", resultQuestion);
	
		return "public/questionOne";
	}

	// 문의사항 리스트(직원)
	@GetMapping("/employeeQuestion")
	public String question(Model model, @RequestParam(defaultValue ="1")int currentPage) {
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage");
		
		return "emp/employeeQuestion";
	}
	
	
	// 문의사항 상세보기(직원)
	@GetMapping("/employeeQuestionOne")
	public String questionOneEmp(Model model, Question question) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		System.out.println(resultQuestion.getQuestionNo()+"<----getQuestionNo");
		System.out.println(resultQuestion.getQuestionTitle()+"<----getQuestionTitle");
		System.out.println(resultQuestion.getQuestionContent()+"<----getQuestionContent");
		System.out.println(resultQuestion.getCustomerId()+"<----getCustomerId");
		System.out.println(resultQuestion.getCreatedate()+"<----getCreatedate");
	
		return "emp/employeeQuestionOne";
	}
	
	// 문의사항 리스트(트레이너)
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
	
	// 문의사항 상세보기(트레이너)
	@GetMapping("/trainerQuestionOne")
	public String trainerQuestionOne(Model model, Question question) {
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		List<QuestionReply> list = questionReplyService.selectquestionReply(question);
		
		System.out.println(list+"<--con.replyList");
		model.addAttribute("question", question);
		model.addAttribute("list", list);
		System.out.println(resultQuestion.getQuestionNo()+"<----getQuestionNo");
		System.out.println(resultQuestion.getQuestionTitle()+"<----getQuestionTitle");
		System.out.println(resultQuestion.getQuestionContent()+"<----getQuestionContent");
		System.out.println(resultQuestion.getCustomerId()+"<----getCustomerId");
		System.out.println(resultQuestion.getCreatedate()+"<----getCreatedate");
	
		return "emp/trainerQuestionOne";
	}
}
