package com.example.haribo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.BranchService;
import com.example.haribo.service.CalendarService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProgramController {
	@Autowired private ProgramService programService;
	@Autowired private CalendarService calendarService;
	@Autowired private BranchService branchService;
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
	
	@GetMapping("/updateProgram")
	public String updateProgram(Program program, Model model) {
		// programService 호출
		Program originProgram = programService.programOne(program);
		// view로 보낼 값 넣기
		model.addAttribute("originProgram", originProgram);
		
		return "emp/updateProgram";
	}
	
	@PostMapping("/updateProgram")
	public String updateProgram(Program program) {
		int row = programService.updateProgram(program);
		if(row==0) {
			System.out.println("프로그램 업데이트 실패");
			return "redirect:/updateProgram?programNo=" + program.getProgramNo();
		} else {
			System.out.println("프로그램 업데이트 성공");
		}
		return "redirect:/programList";
	}
	
	@GetMapping("/deleteProgram")
	public String deleteProgram(Program program) {
		programService.deleteProgram(program);
		
		return "redirect:/programList";
	}
	
	@GetMapping("/programList")
	public String programList(Model model, @RequestParam(defaultValue = "1")int currentPage) {
		List<Program> list = programService.programList(currentPage);
		int lastPage = programService.lastPage();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		System.out.println(list+"<-- programList");
		
		return "emp/programList";
	}
	
	@GetMapping("/programOne")
	public String programOne(Model model, Program program) {
		Program resultProgram = programService.programOne(program);
		model.addAttribute("resultProgram", resultProgram);
		System.out.println(resultProgram.getProgramNo() + "<-- 프로그램 번호");
		System.out.println(resultProgram.getProgramName() + "<-- 프로그램 이름");
		System.out.println(resultProgram.getProgramMaxCustomer() + "<-- 프로그램 수용인원");
		//System.out.println(resultProgram.getProgramMemo() + "<-- 프로그램 상세설명");
	
		return "emp/programOne";
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
	public String programDetail(Model model,Branch branch, Program program, ProgramDate programDate, @RequestParam(required = false) Integer targetYear,
			@RequestParam(required = false) Integer targetMonth) {
		//프로그램 상세보기 내용 출력
		HashMap<String, Object> dmap = programService.selectProgramDetail(program);
		System.out.println("\u001B[43m"+dmap+"<--con.dmap");	
		//상세보기 페이지에서 프로그램 정보와 담당 직원 사진 이름 출력
		HashMap<String, Object> map = programService.selectProgramEmp(program);
		System.out.println("\u001B[43m"+map);	
		//프로그램디테일페이지에 해당 프로그램 일정 출력을위한 달력
		Map<String, Object> cMap = calendarService.calendar(targetYear, targetMonth);
		System.out.println("\u001B[43m"+cMap+"<--p/con.programDetail");
		//달력에 프로그램 일정 program_date출력
		List<HashMap<String, Object>> pList = programService.selectProgramDate(programDate, (int)cMap.get("targetYear"), (int)cMap.get("targetMonth"));
		System.out.println("\u001B[43m"+pList+"<--p/con.programDetail/List");
		//지점 리스트 출력
		List<Branch> list = branchService.branchList();
		
		//모델에 담기
		
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
		model.addAttribute("cMap",cMap);
		model.addAttribute("dmap", dmap);
		model.addAttribute("map", map);
		model.addAttribute("program", program);
		return "public/programDetail";
	}
	//프로그램 검색 기능
		@PostMapping("/program")
		public String searchByProgram(Model model, Program program) {
			List<Program> list = programService.searchByProgram(program);
			System.out.println("\u001B[43m"+list);
			
			model.addAttribute("list", list);
			
			return "public/program";
		}
		
		//프로그램 사진 추가
//		@PostMapping("/insertProgramImg")
//		public String insertProgramImg(HttpSession session, MultipartFile pImg, ProgramImg programImg) {
//			return u;
//		}
		@GetMapping("/ScheduleByBranch")
		public String ScheduleByBranch(Model model, Branch branch, Program program, ProgramDate programDate, @RequestParam(required = false) Integer targetYear,
				@RequestParam(required = false) Integer targetMonth) {
			//지점 리스트 출력
			List<Branch> list = branchService.branchList();
			//프로그램 상세보기 내용 출력
			HashMap<String, Object> dmap = programService.selectProgramDetail(program);
			System.out.println("\u001B[43m"+dmap+"<--con.dmap");	
			//상세보기 페이지에서 프로그램 정보와 담당 직원 사진 이름 출력
			HashMap<String, Object> map = programService.selectProgramEmp(program);
			System.out.println("\u001B[43m"+map);	
			//프로그램디테일페이지에 해당 프로그램 일정 출력을위한 달력
			Map<String, Object> cMap = calendarService.calendar(targetYear, targetMonth);
			System.out.println("\u001B[43m"+cMap+"<--p/con.programDetail");
			//달력에 프로그램 일정 program_date출력 및 지점 예약현황 출력
			List<HashMap<String, Object>> pList = programService.selectProgramDate(programDate, (int)cMap.get("targetYear"), (int)cMap.get("targetMonth"));
			System.out.println("\u001B[43m"+pList+"<--p/con.programDetail/List");
			//모델에 담기
			model.addAttribute("list", list);
			model.addAttribute("pList",pList);
			model.addAttribute("cMap",cMap);
			model.addAttribute("dmap", dmap);
			model.addAttribute("map", map);
			model.addAttribute("program", program);
			return "public/ScheduleByBranch";
		}
}
