package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Employee;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramImg;

@Mapper
public interface ProgramMapper {
	
	// 프로그램 추가
	int insertProgram(Program program);
	
	// 프로그램 이미지 추가
	int insertProgramImg (ProgramImg programImg);

	// 프로그램 목록
	List<Program> programList(HashMap<String, Object> param);
	
	// 프로그램 목록 페이징
	int getTotalRow(Program program);
	
	// 프로그램 상세페이지
	HashMap<String,Object> programOne(Program program);
	
	// 프로그램 이미지 확인여부
	int programImgCnt(ProgramImg programImg);
	
	// 프로그램 삭제
	int deleteProgram(Program program);
	
	// 프로그램 이미지 삭제
	int deleteProgramImg(ProgramImg programImg);
	
	// 프로그램 수정
	int updateProgram(Program program);
	
	// 프로그램 활성/비활성 수정
	int updateProgramActive (Program program);
	
	// 프로그램 이미지명
	String selectProgramImgName(ProgramImg programImg);
	
	//프로그램 목록
	List<HashMap<String,Object>> selectProgram();
	//프로그램 상세보기
	HashMap<String, Object> selectProgramDetail(Program program);
	//상세보기에서 프로그램 정보담당직원정보
	HashMap<String, Object> selectProgramEmp(HashMap<String, Object> map);
	//상세보기에서 프로그램 검색 
	List<HashMap<String,Object>> searchByProgram(Program program);
	//프로그램 일정 출력
	List<HashMap<String, Object>> selectProgramDate(HashMap<String,Object> map);

	// 지점별 값 불러오기
	List<Map<String, Object>> selectBranchNameList();
	
	// 지점별 값을 통해 트레이너명 불러오기 
	List<Map<String, Object>> selectEmployeeNameByBranchNo(int branchNo);
	
	// 트레이너 프로그램 목록
	List<Program> selectProgramListByTrainer(Employee employee);
}