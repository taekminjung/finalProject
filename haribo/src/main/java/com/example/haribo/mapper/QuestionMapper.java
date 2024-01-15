package com.example.haribo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Question;

@Mapper
public interface QuestionMapper {
		
	int insertQuestion(Question question);
	
	int updateQuestion(Question question);
	
	int deleteQuestion(Question question);
	
	List<Question> questionList (Map<String, Object> param);

	Question questionOne(Question question);
		
	int getTotalRow(int rowPerPage);
	
	int getTotalRow2(int rowPerPage);
	
	List<Question> searchByQuestion(Map<String, Object> param);
}
