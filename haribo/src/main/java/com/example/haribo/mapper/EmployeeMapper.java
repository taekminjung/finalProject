package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;

@Mapper
public interface EmployeeMapper {

		int insertEmployee(Employee employee);
		
		int insertEmployeeDetail(EmployeeDetail employeeDetail);

		List<Employee> employeeList (Map<String, Object> param);
		
		int deleteEmployee(Employee employee);
		
		int updateEmployee(Employee employee);
		
}
