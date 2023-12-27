package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.TrainersMapper;

@Service
public class TrainersService {
		@Autowired TrainersMapper trainersMapper;
		public List<HashMap<String, Object>> trainersList(@RequestParam(defaultValue ="1") int currentPage){
			int rowPerPage = 4;
			int beginRow = (currentPage-1)*rowPerPage;
			int totalRow = trainersMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow / rowPerPage;
			if(totalRow % rowPerPage !=0) {
				lastPage +=1;
			}
			List<HashMap<String, Object>> list = trainersMapper.trainersList(beginRow, rowPerPage);
			System.out.println(list +"<--trainersList");
			return list;
		}
		public int lastPage() {
			int rowPerPage = 3;
			int totalRow = trainersMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow/rowPerPage;
			return lastPage;
		}
}
