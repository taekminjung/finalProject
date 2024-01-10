package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerAttendance;
import com.example.haribo.vo.CustomerDetail;
import com.example.haribo.vo.CustomerImg;
import com.example.haribo.vo.Review;

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
	
	//회원 멤버십 종료일 수정
	int updateCustomerMembershipEnd(CustomerDetail customerDetail);
	
	//회원 사진 유무 확인
	int customerImgCnt(CustomerImg customerImg);
	
	//회원 사진 삭제
	int deleteCustomerImg(CustomerImg customerImg);
	
	//회원 사진 추가
	int insertCustomerImg(CustomerImg customerImg);
	
	//회원 출결 (입실)
	int insertAttendance(CustomerAttendance customerAttendance);
	
	//회원 출결 (퇴실)
	int updateAttendance(CustomerAttendance customerAttendance);
	
	//회원 사진 이름 출력
	String selectCustomerImgName(CustomerImg customerImg);
}
