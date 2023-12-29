package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.ProgramMapper;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class ProgramService {
	@Autowired private ProgramMapper programMapper;
	
	public void insertProgram(Program program, ProgramDate programDate) {
		int row = programMapper.insertProgram(program);
		if(row != 1) {
			throw new RuntimeException();
		} else {
			log.debug(program.getProgramNo()+"<--");
		programDate.setProgramNo(program.getProgramNo());
		int row2 = programMapper.insertProgramDate(programDate);
		if(row2 != 1) {
			throw new RuntimeException();
			}
		}
	}
	
	public List<Program> programList(@RequestParam(defaultValue = "1") int currentPage){
		
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int totalRow = programMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage +=1;
		}
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		
		List<Program> list = programMapper.programList(param);
		return list;
	}

	public int lastPage() {
		int rowPerPage = 5;
		int totalRow = programMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	public int updateProgram(Program program) {
		return programMapper.updateProgram(program);
	}
	
	public int deleteProgram(Program program) {
		return programMapper.deleteProgram(program);
	}
	
	public Program programOne(Program program) {
		return programMapper.programOne(program);
	}
	
	//고객 홈페이지에서 프로그램리스트 출력
	public List<Program> selectProgram(Program program){
		List<Program> list = programMapper.selectProgram(program);
		
		return list;
	}
	//고객홈페이지에서 프로그램 상세보기 페이지
	public HashMap<String, Object> selectProgramDetail(Program program){
		HashMap<String, Object> dlist = programMapper.selectProgramDetail(program);
		System.out.println("\u001B[43m"+dlist+"<--ser.dlist");
		
		return dlist;
	}
	//프로그램상세보기페이지에서 프로그램정보와 담당 직원정보 출력
	public HashMap<String, Object> selectProgramEmp(Program program){
		HashMap<String, Object> map = programMapper.selectProgramEmp(program);
		
		System.out.println("\u001B[43m"+map+"<--ser.map");
		
		return map;
	}
	public List<Program> searchByProgram(Program program){
		List<Program> list = programMapper.searchByProgram(program);
		System.out.println("\u001B[43m"+list+"<--ser.list");
		return list;
	}
}
