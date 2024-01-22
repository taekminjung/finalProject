package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;
import com.example.haribo.vo.EmployeeImg;

@Mapper
public interface EmployeeMapper {

	//직원 추가
	int insertEmployee(Employee employee);
	
	// 직원 상세정보 추가
	int insertEmployeeDetail(EmployeeDetail employeeDetail);
	
	// 트레이너 가입 지점번호
	List<Branch> insertEmployeeBranch();
	
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
	
	// 직원 아이디 확인 
	int idCkEmp(String idCk);
	
	// 직원 비밀번호 확인 
	int pwCkEmp (Employee employee);
	
	int getTotalRow(int rowPerPage);
	
	// 직원 비밀번호 수정 
	int updateEmployeePw(Map<String, Object> param);
	
	// 직원 이미지 확인여부 
	int employeeImgCnt (EmployeeImg employeeImg);
	
	// 직원 로그인
	Map<String,Object> loginEmployee(Employee employee);
	
	// 직원 마이페이지
	Map<String,Object> selectEmployeeInfo(Employee employee);

	// 직원 마이페이지 이미지명
	String selectEmployeeImgName(EmployeeImg employeeImg);

	// 트레이너 마이페이
	Map<String, Object> selectTrainerOne(Employee employee);
}