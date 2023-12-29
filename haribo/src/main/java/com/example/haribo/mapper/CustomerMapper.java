package com.example.haribo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerDetail;

@Mapper
public interface CustomerMapper {
	// 회원 로그인
	Map<String,Object> loginCustomer(Customer customer);
	
	// 회원 아이디 중복 체크
	int idCkCnt(String idCk);
	
	// 비밀번호 확인
	int pwCkCnt(Customer customer);
	
	// 회원가입(id,pw)
	int insertCustomer(Customer customer);
	
	// 회원가입(detail)
	int insertCustomerDetail(CustomerDetail customerDetail);
	
	//회원 상세정보 출력
	Map<String,Object> selectCustomerInfo(Customer customer);
	
	//회원 상세정보 수정
	int updateCustomerDetail(CustomerDetail customerDetail);
	
	//회원 비밀번호 수정
	int updateCustomerPw(Map<String, Object> map);
	
	//회원 탈퇴 (활성화 정보 수정)
	int updateCustomerActive(Customer customer);
	
	//회원 탈퇴 (개인 정보 삭제)
	int deleteCustomerDetail(Customer customer);
}
