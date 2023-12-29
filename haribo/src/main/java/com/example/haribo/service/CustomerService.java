package com.example.haribo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.CustomerMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerDetail;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
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
	
	//회원 탈퇴 (active 수정, detail 삭제)
	public void deleteCustomer(Customer cusotmer) {
		int row = customerMapper.updateCustomerActive(cusotmer);
		if(row != 1) {
			throw new RuntimeException();
		}else {
			int row2 = customerMapper.deleteCustomerDetail(cusotmer);
			if(row != 1) {
				throw new RuntimeException();
			}
		}
	}
}
