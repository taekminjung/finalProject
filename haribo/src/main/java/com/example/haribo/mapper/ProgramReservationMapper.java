package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;

@Mapper
public interface ProgramReservationMapper {
	//회원별 프로그램 예약 일 뽑기
	List<Map<String,Object>> selectProgramReservationDateByCustomerNo(Map<String,Object> map);
}
