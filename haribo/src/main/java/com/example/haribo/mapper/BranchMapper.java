package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Branch;
import com.example.haribo.vo.ProgramDate;

@Mapper
public interface BranchMapper {

	List<Branch> branchList();
	
	List<Branch> branchStock();
	
	//programDateNo로 branchNo 뽑기
	Branch branchNoByProgramDateNo(ProgramDate programDate);
	
	
}
