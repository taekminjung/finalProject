package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;
import com.example.haribo.vo.ProgramImg;

@Mapper
public interface ProgramMapper {
	
	int insertProgram(Program program);
	
	int insertProgramDate(ProgramDate programDate);
	
	int insertProgramImg (ProgramImg programImg);

	List<Program> programList(HashMap<String, Object> param);
	
	int getTotalRow(int rowPerPage);
	
	Program programOne(Program program);
	
	int deleteProgram(Program program);
	
	int updateProgram(Program program);
	
	//프로그램 목록
	List<Program> selectProgram(Program program);
	//프로그램 상세보기
	List<Program> selectProgramDetail(Program program);
	//상세보기에서 담당직원정보
	HashMap<String, Object> selectProgramEmp(Program program);
	
}
