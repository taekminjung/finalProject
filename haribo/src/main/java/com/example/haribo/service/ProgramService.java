package com.example.haribo.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.ProgramMapper;
import com.example.haribo.mapper.ReviewMapper;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramImg;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class ProgramService {
	@Autowired private ProgramMapper programMapper;
	@Autowired private ReviewMapper reviewMapper;
	
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
	
	public void updateProgramImg(MultipartFile pImg, ProgramImg programImg, Program program, String path) {
		String pathEmp = path+"/emp";
		String oName = pImg.getOriginalFilename();  //사진의 원래 이름
		String type = oName.substring(oName.lastIndexOf(".")); // 사진 원래이름 파일 확장자명
		String fName = program.getProgramName()+type;
		log.debug(fName);
		
		// db에 사진 있는지 확인여부
		int cnt = programMapper.programImgCnt(programImg);
		if(cnt != 0) { // 사진이 있다면, 삭제
			log.debug("디비삭제");
			int row1 = programMapper.deleteProgramImg(programImg);
			if(row1 != 1) {
				throw new RuntimeException();
			} else { // 저장된 파일도 삭제
				log.debug("파일삭제");
				File file = new File(pathEmp+"/"+fName);
				try {
					file.delete();
				} catch(IllegalStateException e) {
					throw new RuntimeException();
				}
			}
		}
		if(pImg.getSize() != 0) {
			programImg.setProgramImgOriginName(oName);
			programImg.setProgramImgFileName(fName);
			programImg.setProgramImgSize((int)pImg.getSize());
			programImg.setProgramImgType(pImg.getContentType());
			
			int row2 = programMapper.insertProgramImg(programImg);
			if(row2 !=1) {
				throw new RuntimeException();
			} else {
				File file = new File (pathEmp+'/'+fName);
				try {
					pImg.transferTo(file);
				} catch(IllegalStateException | IOException e) {
					throw new RuntimeException();
				}
			}
		}
	}
	
	public int updateProgramActive(Program program) {
		return programMapper.updateProgramActive(program);
	}
	
	// 프로그램 삭제
	public void deleteProgram(Program program, ProgramImg programImg, String path) {
	    try {
	        String programPath = path + "/emp";

	        programImg.setProgramNo(program.getProgramNo());
	        int row1 = programMapper.deleteProgramImg(programImg);
	        if (row1 != 1) {
	            throw new RuntimeException("Failed to delete program_img record.");
	        }

	        String programName = program.getProgramName();
	        File file = new File(programPath + "/" + programName + ".png");
	        if (!file.exists()) {
	            log.warn("Program image file not found: " + file.getPath());
	        } else if (!file.delete()) {
	            log.warn("Failed to delete program image file: " + file.getPath());
	        }

	        int row2 = programMapper.deleteProgram(program);
	        if (row2 != 1) {
	            throw new RuntimeException("Failed to delete program record.");
	        }
	    } catch (Exception e) {
	        throw new RuntimeException();
	    }
	}
	
	public Program programOne(Program program) {
		return programMapper.programOne(program);
	}
	
	//고객 홈페이지에서 프로그램리스트 출력
	public List<HashMap<String,Object>> selectProgram(Program program){
		List<HashMap<String,Object>> list = programMapper.selectProgram(program);
		
		return list;
	}
	//고객홈페이지에서 프로그램 상세보기 페이지
	public HashMap<String, Object> selectProgramDetail(Program program){
		HashMap<String, Object> map = programMapper.selectProgramDetail(program);
		
		return map;
	}
	//프로그램 상세보기 페이지에서 해당 프로그램 리뷰 출력
	public List<HashMap<String, Object>> selectReviewByProgram(Program program){
		List<HashMap<String, Object>> rlist = reviewMapper.selectReviewByProgram(program);
		
		return rlist;
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
	//프로그램 검색
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
	public void insertProgramImg(MultipartFile pImg, ProgramImg programImg, Program program, String path) {
		String pathProgram = path+"/emp";
		String oName = pImg.getOriginalFilename();
		String type = oName.substring(oName.lastIndexOf("."));
		String programName = program.getProgramName();
		String fName = programName+type;
		
		programImg.setProgramImgOriginName(oName);
		programImg.setProgramImgFileName(fName);
		programImg.setProgramImgSize((int)pImg.getSize());
		programImg.setProgramImgType(pImg.getContentType());
		
		int row = programMapper.insertProgramImg(programImg);
		
		if(row!= 1) {
			System.out.println("프로그램 추가 실패");
			throw new RuntimeException();
		} else {
			File file = new File(pathProgram+"/"+fName);
			System.out.println("프로그램 추가 완료");
			try {
				pImg.transferTo(file);
			} catch(IllegalStateException | IOException e) {
				throw new RuntimeException();
			}
		}
	}

	//지점 이름 출력
	public List<Map<String, Object>> selectBranchNameList(){
		List<Map<String, Object>> list = programMapper.selectBranchNameList();
		return list;
	}
	
	public List<Map<String, Object>> selectEmployeeNameByBranchNo(int branchNo){
		List<Map<String, Object>> list = programMapper.selectEmployeeNameByBranchNo(branchNo);
		System.out.println(list+"<--ser.list");
		return list;
	}	
	
	public String selectProgramImgName(ProgramImg programImg) {
		System.out.println(programImg+"<=====programImgS");
		String programImgName = programMapper.selectProgramImgName(programImg);
		System.out.println(programImgName+"<=====programImgName");
		return programImgName;
	}
	
	// 트레이너 프로그램 리스트
	public List<Program> selectProgramListByTrainer(Employee employee){
		log.debug(employee+"");
		return programMapper.selectProgramListByTrainer(employee);
	}
}
