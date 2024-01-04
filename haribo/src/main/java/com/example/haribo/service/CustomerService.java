package com.example.haribo.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.CustomerMapper;
import com.example.haribo.mapper.ProgramReservationMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerAttendance;
import com.example.haribo.vo.CustomerDetail;
import com.example.haribo.vo.CustomerImg;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private ProgramReservationMapper programReservationMapper;
	//회원 로그인
	public Map<String,Object> loginCustomer(Customer paramCustomer) {
		log.debug(paramCustomer.toString());
		
		return customerMapper.loginCustomer(paramCustomer);
	}
	
	//회원 아이디 중복 체크
	public int idCkCnt(String idCk) {
		log.debug(idCk);
		
		return customerMapper.idCkCnt(idCk);
	}
	//비밀번호 확인
	public int pwCkCnt(Customer customer) {
		
		return customerMapper.pwCkCnt(customer);
	}
	
	//회원가입
	public void insertCustomer(Customer paramCustomer, CustomerDetail paramCustomerDetail, String emailId, String emailDomain) {
		log.debug(paramCustomer.toString());
		log.debug(paramCustomerDetail.toString());
		
		String customerEmail = emailId + emailDomain;
		log.debug(customerEmail);
		int row = customerMapper.insertCustomer(paramCustomer);
		if(row != 1) {
			//실패 시 강제로 예외를 발생시켜 애노테이션 Transachional 작동
			throw new RuntimeException();
		}else {
			log.debug(paramCustomer.getCustomerNo()+"");
			paramCustomerDetail.setCustomerNo(paramCustomer.getCustomerNo());
			paramCustomerDetail.setCustomerEmail(customerEmail);
			int row2 = customerMapper.insertCustomerDetail(paramCustomerDetail);
			if(row2 != 1) {
				//실패 시 강제로 예외를 발생시켜 애노테이션 Transachional 작동
				throw new RuntimeException();
			}
		}
	}
	
	//회원 상세정보 출력
	public Map<String,Object> customerInfo(Customer paramCustomer){
		log.debug(paramCustomer.toString());
		Map<String,Object> custInfoMap = customerMapper.selectCustomerInfo(paramCustomer);
		
		//DB에서 뽑아온 email을 아이디와 도메인으로 분리시켜 다시 맵에 넣기
		String customerEmail = custInfoMap.get("customerEmail").toString();
		String emailId = customerEmail.substring(0,customerEmail.indexOf("@"));
		String emailDomain = customerEmail.substring(customerEmail.indexOf("@"));
		log.debug(emailId+"//"+emailDomain);
		custInfoMap.put("emailId", emailId);
		custInfoMap.put("emailDomain", emailDomain);
		log.debug(custInfoMap+"");
		
		return custInfoMap;
	}
	
	//회원 상세정보 수정
	public int updateCustomerInfo(CustomerDetail customerDetail, String emailId, String emailDomain) {
		String customerEmail = emailId + emailDomain;
		customerDetail.setCustomerEmail(customerEmail);
		
		if(customerDetail.getCustomerHeight() == null) {
			customerDetail.setCustomerHeight(0);
		}
		if(customerDetail.getCustomerWeight() == null) {
			customerDetail.setCustomerWeight(0);
		}
		
		return customerMapper.updateCustomerDetail(customerDetail);
	}
	
	//회원 비밀번호 수정
	public int updateCustomerPw(Customer customer, String newCustomerPw) {
		
		Map<String,Object> pwMap = new HashMap<>();
		pwMap.put("newCustomerPw", newCustomerPw);
		pwMap.put("customerId", customer.getCustomerId());
		pwMap.put("customerPw", customer.getCustomerPw());
		
		log.debug(pwMap+"");
		
		return customerMapper.updateCustomerPw(pwMap);
	}
	
	//회원 탈퇴 (active 수정, detail 및 img 삭제)
	public void deleteCustomer(Customer customer, String path) {
		String pathCust = path+"/customer";
		int row = customerMapper.updateCustomerActive(customer);
		if(row != 1) {
			throw new RuntimeException();
		}else {
			int row2 = customerMapper.deleteCustomerDetail(customer);
			if(row2 != 1) {
				throw new RuntimeException();
			}else {
				CustomerImg customerImg = new CustomerImg();
				customerImg.setCustomerNo(customer.getCustomerNo());
				int row3 = customerMapper.deleteCustomerImg(customerImg);
				if(row3 != 1) {
					throw new RuntimeException();
				}else {
					Map<String, Object> customerInfo = customerMapper.selectCustomerInfo(customer);
					String customerId = customerInfo.get("customerId").toString();
					File file = new File(pathCust+"/"+customerId+".png");
					try {
						file.delete();
					}catch(IllegalStateException e){
						throw new RuntimeException();
					}
				}
			}
		}
	}
	
	//회원 사진 변경(추가,삭제)
	public void updateCustomerImg(MultipartFile cImg, CustomerImg customerImg, String path, String customerId) {
		String pathCust = path+"/customer";
		String oName = cImg.getOriginalFilename();	//사진의 원래 이름
		String type  = oName.substring(oName.lastIndexOf("."));	//사진 원래 이름에서 확장자명 잘라내기
		String fName = customerId + type;	//유저 아이디와 확장자명으로 사진 저장명 생성
		log.debug("\u001B[43m"+fName);
		//db에 기존 사진이 있는지 확인
		int cnt = customerMapper.customerImgCnt(customerImg);
		if(cnt != 0) { // 있으면 데이터 삭제
			int row = customerMapper.deleteCustomerImg(customerImg);
			if(row != 1) {
				throw new RuntimeException();
			}else { // 저장된 파일도 삭제
				File file = new File(pathCust+"/"+fName);
				try {
					file.delete();
				}catch(IllegalStateException e){
					throw new RuntimeException();
				}
			}
		}
		if(cImg.getSize() != 0) {
			customerImg.setCustomerImgOriginName(oName);
			customerImg.setCustomerImgFileName(fName);
			customerImg.setCustomerImgSize((int)cImg.getSize());
			customerImg.setCustomerImgType(cImg.getContentType());
			
			int row2 = customerMapper.insertCustomerImg(customerImg);
			if(row2 != 1) {
				throw new RuntimeException();
			}else {
				File file = new File(pathCust+"/"+fName);
				try {
					cImg.transferTo(file);
				}catch(IllegalStateException | IOException e) {
					throw new RuntimeException();
				}
			}
		}
	}
	
	//회원 상세 정보에서 멤버십 종료 날자만 출력(기간 만료일이 지났을 경우 메세지 출력)
	public String membershipEnd(Customer customer) {
		
		Map<String, Object> customerInfo = customerMapper.selectCustomerInfo(customer);
		String customerMembershipEnd =(customerInfo.get("customerMembershipEnd")).toString();
		LocalDate endDate = ((Date)customerInfo.get("customerMembershipEnd")).toLocalDate();
		LocalDate now = LocalDate.now();
		if(endDate.compareTo(now) < 1) {
			customerMembershipEnd = "보유 중인 멤버십이 없습니다.";
		}
		return customerMembershipEnd; 
	}
	//출결 정보 유무 확인
	public int attendanceCnt(CustomerAttendance customerAttendance) {
		int cnt = customerMapper.attendanceCnt(customerAttendance);
		log.debug(cnt+"");
		return cnt;
	}
	//회원 출결(입실)
	public void insertCustomerAttendanceEnter(CustomerAttendance customerAttendance) {
		String programDate = programReservationMapper.selectProgramDateByreservationNo(customerAttendance);
		
		LocalTime nowTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String enterTime = nowTime.format(formatter);
		
		customerAttendance.setCustomerAttendanceDate(programDate);
		customerAttendance.setCustomerAttendanceEnterTime(enterTime);
		
		customerMapper.insertAttendance(customerAttendance);
	}
}
