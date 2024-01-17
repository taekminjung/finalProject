package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Payment;

@Mapper
public interface PaymentMapper {
	//결제 내역 추가
	int insertPayment(Payment payment);
	
	//결제번호로 결제날짜,멤버십 개월 수,결제 고객 번호 출력하기
	Map<String, Object> payMap(Payment payment);
	
	//회원 아이디로 가장 최근 결제 내역의 paymentNo 출력
	Payment activePayment(Payment payment);
	
	List<Map<String,Object>> monthlyRevenue(Payment payment);
}
