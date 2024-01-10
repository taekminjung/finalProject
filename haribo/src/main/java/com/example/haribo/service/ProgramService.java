package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.ProgramMapper;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramImg;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class ProgramService {
	@Autowired private ProgramMapper programMapper;
	
	public int insertProgram(Program program) {
		int row = programMapper.insertProgram(program);
		if(row != 1) {
			throw new RuntimeException();
		} 
			int programNo = program.getProgramNo();
			return programNo;
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
		HashMap<String, Object> map = programMapper.selectProgramDetail(program);
		
		return map;
	}
	//프로그램상세보기페이지에서 프로그램정보와 담당 직원정보 출력
	public HashMap<String, Object> selectProgramEmp(Program program, Branch branch){
		HashMap<String, Object> map = new HashMap<>();
		map.put("programName", program.getProgramName());
		map.put("branchNo", branch.getBranchNo());
		HashMap<String, Object> dmap = programMapper.selectProgramEmp(map);
		
		System.out.println("\u001B[43m"+dmap+"<--ser.dmap");
		
		return dmap;
	}
	public List<Program> searchByProgram(Program program){
		List<Program> list = programMapper.searchByProgram(program);
		System.out.println("\u001B[43m"+list+"<--ser.list");
		return list;
	}
	//프로그램별 일정 출력을 위한 날짜 출력
	public List<HashMap<String, Object>> selectProgramDate(HashMap<String, Object> pmap){
		HashMap<String, Object> map = new HashMap<>();
		map.put("branchNo", pmap.get("branchNo"));
		map.put("programName", pmap.get("programName"));
		map.put("targetYear",(int)pmap.get("targetYear"));
		map.put("targetMonth", (int)pmap.get("targetMonth")+1);
		System.out.println("\u001B[43m"+map+"<--ser.map");
		List<HashMap<String, Object>> pMap = programMapper.selectProgramDate(map);
		
		System.out.println("\u001B[43m"+pMap+"<--ser.list");
		return pMap;
	}
	
	// 회원 사진 추가
	public void insertProgramImg(MultipartFile pImg, ProgramImg programImg, String path) {
		String pathProgram = path+"/employee";
		String oName = pImg.getOriginalFilename();
		String type = oName;
		String fName = type;
		
		programImg.setProgramImgOriginName(oName);
		programImg.setProgramImgFileName(fName);
		programImg.setProgramImgSize((int)pImg.getSize());
		programImg.setProgramImgType(pImg.getContentType());
		
		int row = programMapper.insertProgramImg(programImg);
	}

	//지점 이름 출력
	public List<Map<String, Object>> branchNameList(){
		List<Map<String, Object>> list = programMapper.selectBranchNameList();
		return list;
	}
	
	public List<Map<String, Object>> employeeNameByBranchNo(String branchNo){
		List<Map<String, Object>> list = programMapper.employeeNameByBranchNo(branchNo);
		return list;
	}	
}
