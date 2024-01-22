package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Question;

@Mapper
public interface QuestionMapper {
	
	// 문의사항 추가 
	int insertQuestion(Question question);
	
	// 문의사항 수정 
	int updateQuestion(Question question);
	
	// 문의사항 삭제 
	int deleteQuestion(Question question);
	
	// 문의사항 목록 
	List<Question> questionList (Map<String, Object> param);

	// 문의사항 상세보기 
	Question questionOne(Question question);
	
	// 문의사항 목록 페이징 
	int getTotalRow();
	
	// 문의사항 목록 페이징 (검색 기능) 
	int getTotalRow2(Question question);
	
	// 문의사항 검색 구현 
	List<Question> searchByQuestion(Map<String, Object> param);
}
