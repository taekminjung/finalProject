package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
