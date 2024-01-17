package com.example.haribo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.ProgramDate;

@Mapper
public interface ProgramDateMapper {

	int insertProgramDate(ProgramDate programDate);

}
