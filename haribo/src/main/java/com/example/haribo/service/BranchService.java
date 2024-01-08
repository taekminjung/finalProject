package com.example.haribo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.BranchMapper;
import com.example.haribo.vo.Branch;

@Service
public class BranchService {
		@Autowired BranchMapper branchMapper;
		//지점 목록
		public List<Branch> branchList(){
			List<Branch> blist = branchMapper.branchList();
			System.out.println(blist+"<--branchList");
			return blist;
		}
		
		//지점 재고
		public List<Branch> branchStock(){
			List<Branch> list = branchMapper.branchStock();
			return list;
		}
}
