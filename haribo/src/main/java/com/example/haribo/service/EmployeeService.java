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
	
	public Map<String, Object> loginEmployee(Employee employee) {
		Map<String, Object> map = employeeMapper.loginEmployee(employee);
		log.debug(employee+"");
		return map;
	}
	
	public int idCkEmp(String idCk) {
		return employeeMapper.idCkEmp(idCk);
	}
	
	public int pwCkEmp(Employee employee) {
		return employeeMapper.pwCkEmp(employee);
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
	
	public List<Branch> insertEmployeebranch(){
		List<Branch> branchList = employeeMapper.insertEmployeeBranch();
		return branchList;
	}
	
	public List<HashMap<String, Object>> employeeList(@RequestParam(defaultValue ="1") int currentPage){
		
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;

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
	
	public Map<String, Object> employeeInfo(Employee employee){
		Map<String,Object> empInfo = employeeMapper.selectEmployeeInfo(employee);
		
		return empInfo;
	}
	
    public int updateEmployeeActive(Employee employee) {
        
        return employeeMapper.updateEmployeeActive(employee);
    }
	
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
		if(cnt != 0) {
			int row = employeeMapper.deleteEmployeeImg(employeeImg);
			if(row != 1) {
				throw new RuntimeException("사진 삭제 실패");
			} else {
				File file = new File (pathEmp+"/"+fName);
				try {
					file.delete();
				} catch (IllegalStateException e) {
					throw new RuntimeException("사진 거의 삭제");
				}
			}
		}
		
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
	
	public void deleteEmployee(Employee employee, EmployeeDetail employeeDetail, EmployeeImg employeeImg, String path) {
		String pathEmp = path+"/emp";
		
		Map<String, Object> employeeInfo = employeeMapper.selectEmployeeInfo(employee);
		String employeeId = employeeInfo.get("employeeId").toString();
		if ("N".equals(employee.getEmployeeActive())) {
		    
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

	public String employeeImgName(EmployeeImg employeeImg) {
		
		return employeeMapper.selectEmployeeImgName(employeeImg);
	}
}