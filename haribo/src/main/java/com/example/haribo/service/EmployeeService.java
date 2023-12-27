package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.EmployeeMapper;
import com.example.haribo.mapper.NoticeMapper;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeService {
	@Autowired private EmployeeMapper employeeMapper;
	
	public void addEmployee(Employee employee, EmployeeDetail employeeDetail) {
		int row = employeeMapper.insertEmployee(employee);
		if(row != 1) {
			//실패 시 강제로 예외를 발생시켜 @transactional 작동
			throw new RuntimeException();
		}	else {
			log.debug(employee.getEmployeeNo()+"<--");
			employeeDetail.setEmployeeNo(employee.getEmployeeNo());
			int row2 = employeeMapper.insertEmployeeDetail(employeeDetail);
			if(row2 != 1) {
				// 실패 시 강제로 예외를 발생시켜 @transactional 작동
				throw new RuntimeException();
			}
		}
	}
		
}
