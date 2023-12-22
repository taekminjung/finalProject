package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Notice;

@Mapper
public interface NoticeMapper {
		int insertNotice(Notice notice);
		
		List<Notice> noticeList (Map<String, Object> param);
		
		
}