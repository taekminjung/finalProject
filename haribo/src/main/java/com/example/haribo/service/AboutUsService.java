package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.AboutUsMapper;
import com.example.haribo.vo.Review;

@Service
public class AboutUsService {
	@Autowired  AboutUsMapper aboutUsMapper;
		public List<HashMap<String, Object>> reviewList(@RequestParam(defaultValue ="1") int currentPage){
			
			int rowPerPage = 3;
			int beginRow = (currentPage-1)*rowPerPage;
			int totalRow = aboutUsMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow / rowPerPage;
			if(totalRow % rowPerPage !=0) {
				lastPage +=1;
			}
			List<HashMap<String, Object>> list = aboutUsMapper.reviewList(beginRow, rowPerPage);
			System.out.println(list+"<--reviewList");
			return list;
		}
		public int lastPage() {
			int rowPerPage = 3;
			int totalRow = aboutUsMapper.getTotalRow(rowPerPage);
			int lastPage = totalRow/rowPerPage;
			return lastPage;
		}
}
