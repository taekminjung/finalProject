package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
}
