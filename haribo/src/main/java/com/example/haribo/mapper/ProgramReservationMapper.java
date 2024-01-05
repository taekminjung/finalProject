package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.CustomerAttendance;
import com.example.haribo.vo.ProgramReservation;

@Mapper
public interface ProgramReservationMapper {
	//회원별 프로그램 예약 일 뽑기
	List<Map<String,Object>> selectProgramReservationDateByCustomerNo(Map<String,Object> map);
	
	String selectProgramDateByreservationNo(CustomerAttendance customerAttendance);
	
	int insertProgramReservation(ProgramReservation programReservation);
	
	List<Map<String,Object>> selectProgramNameList();
	
	List<Map<String,Object>> selectBranchNameByProgramName(String programName);
	
	List<Map<String,Object>> selectProgramDateByProgramNameBranchName(Map<String,Object> map);
}
