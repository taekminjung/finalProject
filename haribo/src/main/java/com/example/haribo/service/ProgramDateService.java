package com.example.haribo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.ProgramDateMapper;
import com.example.haribo.vo.ProgramDate;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional

public class ProgramDateService {
	@Autowired private ProgramDateMapper programDateMapper;

	// 프로그램 날짜 추가하기(트레이너)
	public void insertProgramDate(ProgramDate paramProgramDate, Integer targetYear, Integer targetMonth, Integer[] d) {
		for(int i=0; i<d.length; i++) {
			String programDate = LocalDate.of(targetYear, targetMonth, d[i]).toString();
			paramProgramDate.setProgramDate(programDate);
			programDateMapper.insertProgramDate(paramProgramDate);
		}
	}

	// 프로그램 날짜 리스트
	public List<ProgramDate> programDateList(ProgramDate programDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
