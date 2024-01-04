package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.NoticeMapper;
import com.example.haribo.vo.Notice;

@Service
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	
	public String insertNotice(Notice notice) {
		noticeMapper.insertNotice(notice);
		return "redirect:/noticeList";
	}
	
	public int updateNotice(Notice notice) {
		return noticeMapper.updateNotice(notice);
	}
	
	public int deleteNotice(Notice notice) {
		return noticeMapper.deleteNotice(notice);
	}
	
	public Notice noticeOne(Notice notice) {
		return noticeMapper.noticeOne(notice);
	}
	
	public List<Notice> noticeList( 
				@RequestParam(defaultValue ="1") int currentPage) {
	
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;

		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		
		List<Notice> list = noticeMapper.noticeList(param);
		return list;
	}

	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = noticeMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}

	public List<Notice> searchByNotice(Notice notice){
		List<Notice> list = noticeMapper.searchByNotice(notice);
		System.out.println(list+"<--list");
		return list;

	}
//	}
//	
//	public int searchLastPage() {
//		int rowPerPage = 10;
//		int totalRow = noticeMapper.getTotalRow2(rowPerPage);
//		int lastPage = totalRow/rowPerPage;
//		if(totalRow % rowPerPage !=0) {
//			lastPage +=1;
//		}
//		return lastPage;
//	}
	
	
}
