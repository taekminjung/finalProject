package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.BranchMapper;
import com.example.haribo.mapper.CustomerMapper;
import com.example.haribo.mapper.PaymentMapper;
import com.example.haribo.mapper.ProgramReservationMapper;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Payment;
import com.example.haribo.vo.Program;
import com.example.haribo.vo.ProgramDate;
import com.example.haribo.vo.ProgramReservation;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class ProgramReservationService {
	@Autowired
	private ProgramReservationMapper programReservationMapper;
	@Autowired
	private BranchMapper branchMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	CustomerMapper customerMapper;
	//회원 별 예약한 프로그램 조회
	public List<Map<String,Object>> programReservationDateByCustomerNo(Customer customer, 
																		Integer targetYear, 
																		Integer targetMonth){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("customerNo", customer.getCustomerNo());
		paramMap.put("targetYear", targetYear);
		paramMap.put("targetMonth", targetMonth+1);
		
		List<Map<String,Object>> proList = programReservationMapper.selectProgramReservationDateByCustomerNo(paramMap);
		log.debug(proList+"");
		
		return proList;
	}
	
	//프로그램 예약하기
	public void insertProgramReservation(Integer[] programDateNoList, String customerId) {
		ProgramDate programDate = new ProgramDate();
		programDate.setProgramDateNo(programDateNoList[0]);
		Branch branch = branchMapper.branchNoByProgramDateNo(programDate);
		int branchNo = branch.getBranchNo();
		log.debug(customerId+"<--payment customerId");
		Payment custPayment = new Payment();
		custPayment.setCustomerId(customerId);
		Payment payment = paymentMapper.activePayment(custPayment);
		int paymentNo = payment.getPaymentNo();
		
		
		for(int i = 0; i < programDateNoList.length; i++) {
			log.debug(programDateNoList[i]+"");
		}
		ProgramReservation programReservation = new ProgramReservation();
		programReservation.setBranchNo(branchNo);
		programReservation.setPaymentNo(paymentNo);
		if(programDateNoList.length > 0) {
			for(int i = 0; i < programDateNoList.length; i++) {
				programReservation.setProgramDateNo(programDateNoList[i]);
				programReservationMapper.insertProgramReservation(programReservation);
			}
		}
	}
	//프로그램 중복 제거 이름 출력
	public List<Map<String,Object>> programNameList(){
		List<Map<String,Object>> list = programReservationMapper.selectProgramNameList();
		return list;
	}
	//프로그램의 지점 출력
	public List<Map<String,Object>> branchNameListByProgramName(String programName){
		List<Map<String,Object>> list = programReservationMapper.selectBranchNameByProgramName(programName);
		return list;
	}
	//프로그램이 이름과 지점 이름으로 프로그램 날짜(현재날짜와 멤버십 종료 날짜 사이)
	public List<Map<String,Object>> ProgramDateByProgramNameBranchName(String programName, String branchName, int customerNo){
		Customer customer = new Customer();
		customer.setCustomerNo(customerNo);
		String customerMembershipEnd = (customerMapper.selectCustomerInfo(customer)).get("customerMembershipEnd").toString();
		
		Map<String,Object> map = new HashMap<>();
		map.put("branchName", branchName);
		map.put("programName", programName);
		map.put("customerMembershipEnd", customerMembershipEnd);
		
		List<Map<String,Object>> list = programReservationMapper.selectProgramDateByProgramNameBranchName(map);
		return list;
	}
}
