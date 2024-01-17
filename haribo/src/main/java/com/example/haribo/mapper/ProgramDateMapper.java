package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.ProgramDate;

@Mapper
public interface ProgramDateMapper {

	// 프로그램 날짜 입력하기
	int insertProgramDate(ProgramDate programDate);

	// 프로그램 날짜 조회하기(리스트)
	List<HashMap<String,Object>> selectProgramDate(HashMap<String,Object> map);
}