package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Notice;

@Mapper
public interface NoticeMapper {
	
		// 공지 추가
		int insertNotice(Notice notice);

		// 공지사항 목록 페이징
		int getTotalRow(int rowPerPage);
		
		// 공지사항 목록 페이징(검색 이후)
		int getTotalRow2(Notice notice);

		// 공지사항 상세정보 
		Notice noticeOne(Notice notice);
		
		// 공지사항 삭제 
		int deleteNotice(Notice notice);
		
		// 공지사항 수정 
		int updateNotice(Notice notice);

		// 공지사항 목록 
		List<Notice> noticeList (Map<String, Object> param);

		// 공지사항 검색 기능 
		List<Notice> searchByNotice(Map<String, Object> param);

}
