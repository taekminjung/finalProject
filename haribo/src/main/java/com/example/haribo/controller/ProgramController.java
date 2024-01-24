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
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.service.BranchService;
import com.example.haribo.service.CalendarService;
import com.example.haribo.service.ProgramService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;
import com.example.haribo.vo.ProgramImg;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class ProgramController {
	@Autowired private ProgramService programService;
	@Autowired private CalendarService calendarService;
	@Autowired private BranchService branchService;

	// 프로그램 추가
	@GetMapping ("/insertProgram")
	public String insertProgram(HttpSession session, Model model) {
		// 세션 검사
		if(session.getAttribute("loginEmployee") == null) {
			return "redirect:/login";
		}
		
		List<Map<String, Object>> list = programService.selectBranchNameList();
		model.addAttribute("list", list);
		
		return "emp/insertProgram";
	}
	
	@PostMapping ("/insertProgram")
	public String insertEmployee(HttpSession session, Program program, MultipartFile pImg, ProgramImg programImg) {
		log.debug(program.toString());
		log.debug(programImg.toString());

		String path = session.getServletContext().getRealPath("/upload");
		int programNo = programService.insertProgram(program);
		
		programImg.setProgramNo(programNo);
		programService.insertProgramImg(pImg, programImg, program, path);
		
		return "redirect:/programList";
	}
	
	// 프로그램 수정
	@GetMapping("/updateProgram")
	public String updateProgram(Program program, Model model) {
		// programService 호출
		HashMap<String, Object> list = programService.programOne(program);
		// view로 보낼 값 넣기
		model.addAttribute("list", list);
		
		return "emp/updateProgram";
	}
	
	@PostMapping("/updateProgram")
	public String updateProgram(HttpSession session, Program program, MultipartFile pImg, ProgramImg programImg) {
		
		String path = session.getServletContext().getRealPath("/upload");
		log.debug(path);
		int row = programService.updateProgram(program);
		if(pImg.getSize()>0) {
			programService.updateProgramImg(pImg, programImg, program, path);
		}
		return "redirect:/programList";
	}
	
	@PostMapping("/updateProgramActive")
	public String updateProgramActive(Program program) {
		int row = programService.updateProgramActive(program);
	
		return "redirect:/programList";
	}
	
	// 프로그램 삭제
	@GetMapping("/deleteProgram")
	public String deleteProgram(Program program, ProgramImg programImg, HttpSession session) {
		String path = session.getServletContext().getRealPath("/upload");
		programService.deleteProgram(program, programImg, path);
		
		return "redirect:/programList";
	}
	
	// 프로그램 리스트
	@GetMapping("/programList")
	public String programList(Model model, @RequestParam(defaultValue = "1")int currentPage, Program program) {
		List<Program> list = programService.programList(currentPage, program);
		int lastPage = programService.lastPage(program);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		System.out.println(list+"<-- programList");
		
		return "emp/programList";
	}
	
	// 프로그램 상세보기
	@GetMapping("/programOne")
	public String programOne(Model model, Program program) {	
		HashMap<String, Object> resultProgram = programService.programOne(program);
		model.addAttribute("resultProgram", resultProgram);
		return "emp/programOne";
	}

// 고객 홈페이지 부분 	
	
	// 프로그램 목록(홈페이지)
	@GetMapping("/program")
	public String program(Model model) {
		
		//프로그램 목록 출력
		List<HashMap<String,Object>> list = programService.selectProgram();
		
		//모델에 담아 view로
		model.addAttribute("list", list);
		
		return "public/program";
	}
	
	// 프로그램 상세보기
	@GetMapping("/programDetail")
	public String programDetail(Model model,Branch branch, Program program, ProgramDate programDate, @RequestParam(required = false) Integer targetYear,
			@RequestParam(required = false) Integer targetMonth) {
		//프로그램 상세보기 내용 출력
		HashMap<String, Object> map = programService.selectProgramDetail(program);
		System.out.println("\u001B[43m"+map+"<--con.dmap");	
		//프로그램 별 리뷰 출력
		List<HashMap<String, Object>> rlist = programService.selectReviewByProgram(program);
		//지점 리스트 출력
		List<Branch> list = branchService.branchList();
		
		//모델에 담기
		model.addAttribute("rlist", rlist);
		model.addAttribute("map", map);
		model.addAttribute("program", program);
		model.addAttribute("list", list);
		return "public/programDetail";
	}
	
	//프로그램 검색 기능
	@PostMapping("/program")
	public String searchByProgram(Model model, Program program) {
		List<HashMap<String,Object>> list = programService.searchByProgram(program);
		System.out.println("\u001B[43m"+list);
		
		model.addAttribute("list", list);
		
		return "public/program";
	}
	
	@GetMapping("/ScheduleByBranch")
	public String ScheduleByBranch(Model model, Branch branch, Program program, ProgramDate programDate, @RequestParam(required = false) Integer targetYear,
			@RequestParam(required = false) Integer targetMonth) {
		System.out.println(branch+"<--branch");
		System.out.println(program.getProgramNo());
		System.out.println(targetYear);
		System.out.println(targetMonth);
		//지점 리스트 출력
		List<Branch> list = branchService.branchList();
		System.out.println(list+"<===list");
		//프로그램 상세보기 내용 출력
//		HashMap<String, Object> dmap = programService.selectProgramDetail(program, branch);
//		System.out.println("\u001B[43m"+dmap+"<--con.dmap");	
		//상세보기 페이지에서 프로그램 정보와 담당 직원 사진 이름 출력
		HashMap<String, Object> map = programService.selectProgramEmp(program, branch);
		System.out.println("\u001B[43m"+map+"<-- con.emp.map");	
		//프로그램디테일페이지에 해당 프로그램 일정 출력을위한 달력
		Map<String, Object> cMap = calendarService.calendar(targetYear, targetMonth);
		System.out.println("\u001B[43m"+cMap+"<--p/con.programDetail");
		//달력에 프로그램 일정 program_date출력 및 지점 예약현황 출력
		HashMap<String, Object> pmap = new HashMap<>();
		pmap.put("branchName", branch.getBranchName());
		pmap.put("programDate", programDate);
		pmap.put("programName", program.getProgramName());
		pmap.put("branchNo", branch.getBranchNo());
		pmap.put("targetYear", (int)cMap.get("targetYear"));
		pmap.put("targetMonth", (int)cMap.get("targetMonth"));
		System.out.println("\u001B[43m"+pmap+"<--con.pmap");
		List<HashMap<String, Object>> pList = programService.selectProgramDate(pmap);
		System.out.println("\u001B[43m"+pList+"<--p/con.programDetail/List");
		//모델에 담기
		model.addAttribute("pmap",pmap);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
		model.addAttribute("cMap",cMap);
//		model.addAttribute("dmap", dmap);
		model.addAttribute("map", map);
		model.addAttribute("branch", branch);
		model.addAttribute("program", program);
		return "public/ScheduleByBranch";
	}
}
