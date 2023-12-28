package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.EmployeeMapper;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeService {
	@Autowired private EmployeeMapper employeeMapper;
	
	public Employee loginEmployee(Employee employee) {
		return employeeMapper.loginEmployee(employee);
	}
	
	public int idCkEmp(String idCk) {
		return employeeMapper.idCkEmp(idCk);
	}
	
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
	
	public List<HashMap<String, Object>> employeeList(@RequestParam(defaultValue ="1") int currentPage){
		
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		int totalRow = employeeMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		List<HashMap<String, Object>> list = employeeMapper.employeeList(beginRow, rowPerPage);
		return list;
	}
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = employeeMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	public Map<String, Object> employeeInfo(Employee employee, EmployeeDetail employeeDetail){
		Map<String,Object> empInfo = employeeMapper.selectEmployeeInfo(employee, employeeDetail);
		
		return empInfo;
	}
}
