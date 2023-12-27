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
	public Customer loginCustomer(Customer paramCustomer) {
		log.debug(paramCustomer.toString());
		
		return customerMapper.loginCustomer(paramCustomer);
	}
	
	//회원 아이디 중복 체크
	public int idCkCnt(String idCk) {
		log.debug(idCk);
		
		return customerMapper.idCkCnt(idCk);
	}
	
	//회원가입
	public void addCustomer(Customer paramCustomer, CustomerDetail paramCustomerDetail) {
		log.debug(paramCustomer.toString());
		log.debug(paramCustomerDetail.toString());
		int row = customerMapper.insertCustomer(paramCustomer);
		if(row != 1) {
			//실패 시 강제로 예외를 발생시켜 애노테이션 Transachional 작동
			throw new RuntimeException();
		}else {
			log.debug(paramCustomer.getCustomerNo()+"");
			paramCustomerDetail.setCustomerNo(paramCustomer.getCustomerNo());
			int row2 = customerMapper.insertCustomerDetail(paramCustomerDetail);
			if(row2 != 1) {
				//실패 시 강제로 예외를 발생시켜 애노테이션 Transachional 작동
				throw new RuntimeException();
			}
		}
	}
	
	//회원 상세정보 출력
	public Map<String,Object> getCustomerInfo(Customer paramCustomer){
		log.debug(paramCustomer.toString());
		Map<String,Object> custInfoMap = customerMapper.selectCustomerInfo(paramCustomer);
		log.debug(custInfoMap.toString());
		
		return custInfoMap;
	}
}
