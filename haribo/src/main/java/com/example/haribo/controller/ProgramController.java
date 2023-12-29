package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.ProgramService;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProgramController {
	@Autowired private ProgramService programService;
	
	@GetMapping ("/insertProgram")
	public String insertProgram() {
		return "emp/insertProgram";
	}
	
	@PostMapping ("/insertProgram")
	public String insertEmployee(Program program, ProgramDate programDate) {
		log.debug(program.toString());
		log.debug(programDate.toString());
		programService.insertProgram(program, programDate);
		
		return "redirect:/adminHome";
	}
	
	@GetMapping ("/programList")
	public String programList(Model model, @RequestParam(defaultValue = "1")int currentPage) {
		List<Program> list = programService.programList(currentPage);
		int lastPage = programService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		System.out.println(list+"<-- programList");
		return "emp/programList";
		
	}
	@GetMapping("/program")
	public String program(Model model, Program program) {
		
		//프로그램 목록 출력
		List<Program> list = programService.selectProgram(program);
		
		//모델에 담아 view로
		model.addAttribute("list", list);
		
		return "public/program";
		
	}
	@GetMapping("/programDetail")
	public String programDetail(Model model, Program program) {
		//프로그램 상세보기 내용 출력
		List<Program> list = programService.selectProgramDetail(program);
		//상세보기 페이지에서 담당 직원 사진 이름 출력
		HashMap<String, Object> map = programService.selectProgramEmp(program);
				
		//모델에 담기
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("program", program);
		return "public/programDetail";
	}
}
