package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

@Mapper
public interface EmployeeMapper {

		int insertEmployee(Employee employee);
		
		int insertEmployeeDetail(EmployeeDetail employeeDetail);
		
		List<HashMap<String, Object>> employeeList (int beginRow, int rowPerPage);
		
		int deleteEmployee(Employee employee);
		
		int updateEmployee(Employee employee);
		
		Employee updateEmployeeStatus(Employee employee);
		
		int idCkEmp(String idCk);
		
		int pwCkEmp (Employee employee);
		
		int getTotalRow(int rowPerPage);
		
		int updateEmployeePw(Map<String, Object> param);
		
		Map<String,Object> loginEmployee(Employee employee);
		
		Map<String,Object> selectEmployeeInfo(Employee employee);

		
		
}
