package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;
import com.example.haribo.vo.EmployeeImg;

@Mapper
public interface EmployeeMapper {

	//직원 추가
	int insertEmployee(Employee employee);
	
	// 직원 상세정보 추가
	int insertEmployeeDetail(EmployeeDetail employeeDetail);
	
	// 직원 이미지 추가
	int insertEmployeeImg(EmployeeImg employeeImg);
	
	// 직원리스트 출력
	List<HashMap<String, Object>> employeeList (int beginRow, int rowPerPage);
	
	// 직원 상세정보 삭제
	int deleteEmployeeDetail(EmployeeDetail employeeDetail);

	// 직원 이미지 삭제
	int deleteEmployeeImg(EmployeeImg employeeImg);
	
	// 직원 정보 수정
	int updateEmployee(Employee employee);
	
	// 직원 활성/비활성 수정
	int updateEmployeeActive(Employee employee);
	
	int idCkEmp(String idCk);
	
	int pwCkEmp (Employee employee);
	
	int getTotalRow(int rowPerPage);
	
	int updateEmployeePw(Map<String, Object> param);
	
	int employeeImgCnt (EmployeeImg employeeImg);
	
	Map<String,Object> loginEmployee(Employee employee);
	
	Map<String,Object> selectEmployeeInfo(Employee employee);

	String selectEmployeeImgName(EmployeeImg employeeImg);
}