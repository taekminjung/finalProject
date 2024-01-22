package com.example.haribo.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.EmployeeMapper;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Employee;
import com.example.haribo.vo.EmployeeDetail;
import com.example.haribo.vo.EmployeeImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class EmployeeService {
	@Autowired private EmployeeMapper employeeMapper;
	
	// 직원 로그인
	public Map<String, Object> loginEmployee(Employee employee) {
		Map<String, Object> map = employeeMapper.loginEmployee(employee);
		log.debug(employee+"");
		return map;
	}
	
	// 직원 ID 중복 확인
	public int idCkEmp(String idCk) {
		return employeeMapper.idCkEmp(idCk);
	}
	
	// 직원 비밀번호 확인
	public int pwCkEmp(Employee employee) {
		return employeeMapper.pwCkEmp(employee);
	}
	
	// 직원 추가
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
	
	// 직원 지점 추가
	public List<Branch> insertEmployeebranch(){
		List<Branch> branchList = employeeMapper.insertEmployeeBranch();
		return branchList;
	}
	
	// 직원 목록 조회
	public List<HashMap<String, Object>> employeeList(@RequestParam(defaultValue ="1") int currentPage){
		
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;

		List<HashMap<String, Object>> list = employeeMapper.employeeList(beginRow, rowPerPage);
		return list;
	}
	
	// 페이징 중 마지막 페이지 조회
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = employeeMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	// 직원 상세 정보
	public Map<String, Object> employeeInfo(Employee employee){
		Map<String,Object> empInfo = employeeMapper.selectEmployeeInfo(employee);
		
		return empInfo;
	}
	
	// 직원 활성/비활성 수정
    public int updateEmployeeActive(Employee employee) {
        
        return employeeMapper.updateEmployeeActive(employee);
    }
	
    // 직원 비밀번호 수정 
	public int updateEmployeePw(Employee employee, String newEmployeePw) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("newEmployeePw", newEmployeePw);
		param.put("employeeId", employee.getEmployeeId());
		param.put("employeePw", employee.getEmployeePw());
		
		return employeeMapper.updateEmployeePw(param);
	}
	
	// 직원 사진 변경(추가, 삭제)
	public void updateEmployeeImg(MultipartFile eImg, EmployeeImg employeeImg, String employeeId, String path) {
		String pathEmp = path+"/emp";
		String oName = eImg.getOriginalFilename();
		String type = oName.substring(oName.lastIndexOf("."));
		String fName = employeeId + type;
		
		//DB에 사진이 존재하는지 확인
		int cnt = employeeMapper.employeeImgCnt(employeeImg);
		if(cnt != 0) { // 사진이 존재한다면, 사진을 삭제
			int row = employeeMapper.deleteEmployeeImg(employeeImg);
			if(row != 1) {
				throw new RuntimeException("사진 삭제 실패");
			} else { // DB에 저장되어 있는 파일도 함께 삭제
				File file = new File (pathEmp+"/"+fName);
				try {
					file.delete();
				} catch (IllegalStateException e) {
					throw new RuntimeException("사진 거의 삭제");
				}
			}
		}
		
		// 새롭게 선택된 사진 저장 경로
		if(eImg.getSize() != 0) {
			employeeImg.setEmployeeImgOriginName(oName);
			employeeImg.setEmployeeImgFileName(fName);
			employeeImg.setEmployeeImgSize((int)eImg.getSize());
			employeeImg.setEmployeeImgType(eImg.getContentType());
			
			int row2 = employeeMapper.insertEmployeeImg(employeeImg);
			if(row2 != 1) {
				throw new RuntimeException();
			} else {
				File file = new File(pathEmp+"/"+fName);
				try {
					eImg.transferTo(file);
				} catch(IllegalStateException | IOException e) {
					log.debug(e+"");
					throw new RuntimeException();
				}
			}
		}
	}
	
	// 직원 삭제
	public void deleteEmployee(Employee employee, EmployeeDetail employeeDetail, EmployeeImg employeeImg, String path) {
		String pathEmp = path+"/emp";
		
		Map<String, Object> employeeInfo = employeeMapper.selectEmployeeInfo(employee);
		String employeeId = employeeInfo.get("employeeId").toString();
		if ("N".equals(employee.getEmployeeActive())) { // 비활성일 경우, 삭제 작업을 수행
		    
			int row1 = employeeMapper.updateEmployeeActive(employee);
			if(row1 != 1) {
				throw new RuntimeException();
			} else { 
				int row2 = employeeMapper.deleteEmployeeDetail(employeeDetail);
				if(row2!=1) {
					throw new RuntimeException();
				} else {
					employeeImg.setEmployeeNo(employee.getEmployeeNo());
					int row3 = employeeMapper.deleteEmployeeImg(employeeImg);
					if(row3 > 1) {
						throw new RuntimeException();
					} else {

						File file = new File(pathEmp+"/"+employeeId+".png");
						try {
							file.delete();
						} catch ( IllegalStateException e) {
							throw new RuntimeException();
						}
					}
				}	
			}	
		}
			else {
				return;
			}
		}
	// 직원 이미지 파일명 조회
	public String employeeImgName(EmployeeImg employeeImg) {
		
		return employeeMapper.selectEmployeeImgName(employeeImg);
	}
}