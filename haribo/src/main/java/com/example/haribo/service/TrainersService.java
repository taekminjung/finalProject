package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.BranchMapper;
import com.example.haribo.mapper.TrainersMapper;
import com.example.haribo.vo.Branch;

@Service
public class TrainersService {
		@Autowired TrainersMapper trainersMapper;
		//트레이너 리스트
		public List<HashMap<String, Object>> trainersList(@RequestParam(defaultValue ="1") int currentPage, Branch branch){
			int rowPerPage = 4;
			int beginRow = (currentPage-1)*rowPerPage;
			int totalRow = trainersMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow / rowPerPage;
			if(totalRow % rowPerPage !=0) {
				lastPage +=1;
			}
			HashMap<String, Object> map = new HashMap<>();
			map.put("beginRow", beginRow);
			map.put("rowPerPage", rowPerPage);
			map.put("branchNo", branch.getBranchNo());
			
			List<HashMap<String, Object>> list = trainersMapper.trainersList(map);
			System.out.println(list +"<--trainersList");
			return list;
		}
		//페이징할때 마지막 페이지 계산
		public int lastPage() {
			int rowPerPage = 3;
			int totalRow = trainersMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow/rowPerPage;
			return lastPage;
		}
		public String selectBranchAddr(Branch branch) {
			String branchAddr = trainersMapper.selectBranchAddr(branch);
			
			return branchAddr;
			
		}
}
