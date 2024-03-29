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
import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired private QuestionService questionService;
	@Autowired private QuestionReplyService questionReplyService;
	
	// 문의글 등록하기
	@GetMapping("/insertQuestion")
	public String insertQuestion(HttpSession session) {
		if(session.getAttribute("loginCustomer") == null) {
			return "redirect:/login";
		}
		return "public/insertQuestion";
	}
	
	@PostMapping("/insertQuestion")
	public String insertQuestion(HttpSession session, Question question ) {
		System.out.println(question+"<--qcon.question");
		
		questionService.insertQuestion(question);
		return "redirect:/questionList";
	}
	
	// 문의 글 수정하기
	@PostMapping("/updateQuestion")
	public String updateQuestion(Question question) {
		System.out.println(question+"<===questionNO?");
		int row = questionService.updateQuestion(question);
		if(row == 0) {
			System.out.println("업데이트 실패");
		} else {
			System.out.println("업데이트 성공");
		}
		return "redirect:/questionOne?questionNo="+question.getQuestionNo();
	}
	
	// 문의 글 삭제하기
	@GetMapping("/deleteQuestion")
	public String deleteQuestion(HttpSession session, Question question, QuestionReply questionReply) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		System.out.println(question+"<====qcon.question");
		questionService.deleteQuestion(question, questionReply);
		
		return "redirect:/employeeQuestion";
	}
	
	@GetMapping("/deleteQuestionCustomer")
	public String deleteQuestionCustomer(Question question, QuestionReply questionReply) {
		
		System.out.println(question+"<====qcon.question");
		questionService.deleteQuestion(question, questionReply);
		
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
	public String question(HttpSession session, Model model, @RequestParam(defaultValue ="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage");
		
		return "emp/employeeQuestion";
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
	
	// 문의사항 상세보기(직원)
	@GetMapping("/employeeQuestionOne")
	public String questionOneEmp(HttpSession session, Model model, Question question) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		Question Question = questionService.questionOne(question);
		List<QuestionReply> list = questionReplyService.selectquestionReply(question);
		
		model.addAttribute("Question", Question);
		model.addAttribute("list", list);
		
		return "emp/employeeQuestionOne";
	}
	
	// 문의사항 리스트(트레이너)
	@GetMapping("/trainerQuestion")
	public String trainerQuestion(HttpSession session, Model model, Question question, @RequestParam(defaultValue ="1")int currentPage) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		List<Question> list = questionService.questionList(currentPage);
		int lastPage = questionService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println(lastPage+"<--lastPage1111");
				
		return "emp/trainerQuestion";
	}
	
	// 문의사항 검색 기능 (트레이너)
	@PostMapping("/trainerQuestion")
	public String searchQuestionTrainer(Model model, Question question, @RequestParam(defaultValue="1")int currentPage) {
		List<Question> list = questionService.searchByQuestion(question, currentPage);
		int lastPage = questionService.searchLastPage(question);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list+"<---list");
		System.out.println(lastPage+"<---lastPagee");
		
		return "emp/trainerQuestion";
	}
	
	// 문의사항 상세보기(트레이너)
	@GetMapping("/trainerQuestionOne")
	public String trainerQuestionOne(HttpSession session, Model model, Question question) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		Question resultQuestion = questionService.questionOne(question);
		model.addAttribute("resultQuestion", resultQuestion);
		
		List<QuestionReply> list = questionReplyService.selectquestionReply(question);
		System.out.println(list+"<--con.replyList");
		model.addAttribute("question", question);
		model.addAttribute("list", list);
	
		return "emp/trainerQuestionOne";
	}
}
