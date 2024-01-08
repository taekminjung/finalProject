package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramImg;

@Mapper
public interface ProgramMapper {
	
	int insertProgram(Program program);
	
	int insertProgramImg (ProgramImg programImg);

	List<Program> programList(HashMap<String, Object> param);
	
	int getTotalRow(int rowPerPage);
	
	Program programOne(Program program);
	
	int deleteProgram(Program program);
	
	int updateProgram(Program program);
	
	//프로그램 목록
	List<Program> selectProgram(Program program);
	//프로그램 상세보기
	HashMap<String, Object> selectProgramDetail(Program program);
	//상세보기에서 프로그램 정보담당직원정보
	HashMap<String, Object> selectProgramEmp(HashMap<String, Object> map);
	//상세보기에서 프로그램 검색 
	List<Program> searchByProgram(Program program);
	//프로그램 일정 출력
	List<HashMap<String, Object>> selectProgramDate(HashMap<String,Object> map);
	
}
