package com.example.haribo.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.CustomerMapper;
import com.example.haribo.mapper.PaymentMapper;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.CustomerDetail;
import com.example.haribo.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class PaymentService {
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired 
	private CustomerMapper customerMapper;
	
	//결제 내역 추가
	public int insertPayment(Payment payment) {
		int row = paymentMapper.insertPayment(payment);
		if(row != 1) {
			throw new RuntimeException();
		}else {
			payment.setPaymentNo(payment.getPaymentNo()); 
			Map<String, Object> payMap = paymentMapper.payMap(payment);
			int customerNo = (int)payMap.get("customerNo");
			LocalDate paymentDate = ((Date)payMap.get("paymentDate")).toLocalDate();
			int membershipMonth = (int)payMap.get("membershipMonth");
			
			Customer customer = new Customer();
			customer.setCustomerNo(customerNo);
			Map<String, Object> cusMap = customerMapper.selectCustomerInfo(customer);
			LocalDate customerMembershipEnd = ((Date)cusMap.get("customerMembershipEnd")).toLocalDate();
			if(customerMembershipEnd.compareTo(paymentDate) < 0) {
				int year = paymentDate.getYear();
				int date = paymentDate.getDayOfMonth();
				int month = paymentDate.getMonthValue() + membershipMonth;
				if(month > 12) {
					month = month - 12;
					year = year + 1;
				}
				String membershipEnd = LocalDate.of(year, month, date).toString();
				CustomerDetail customerDetail = new CustomerDetail();
				customerDetail.setCustomerNo(customerNo);
				customerDetail.setCustomerMembershipEnd(membershipEnd);
				customerMapper.updateCustomerMembershipEnd(customerDetail);
			}else if(customerMembershipEnd.compareTo(paymentDate) >= 0) {
				int year = customerMembershipEnd.getYear();
				int date = customerMembershipEnd.getDayOfMonth();
				int month = customerMembershipEnd.getMonthValue() + membershipMonth;
				if(month > 12) {
					month = month - 12;
					year = year + 1;
				}
				String membershipEnd = LocalDate.of(year, month, date).toString();
				CustomerDetail customerDetail = new CustomerDetail();
				customerDetail.setCustomerNo(customerNo);
				customerDetail.setCustomerMembershipEnd(membershipEnd);
				customerMapper.updateCustomerMembershipEnd(customerDetail);
			}
		}
		return row;
	}
	
	// 월별 매출 내역
	public Map<String,Object> monthlyRevenue(Integer targetYear) {
		Calendar firstD = Calendar.getInstance();
		if(targetYear != null) {
			firstD.set(Calendar.YEAR,targetYear);
		}
		targetYear = firstD.get(Calendar.YEAR);
		Map<String,Object> month = paymentMapper.monthlyRevenue(targetYear);
		month.put("year", targetYear);
		return month;
	}
}
