package com.example.haribo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.QuestionMapper;
import com.example.haribo.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;

	public List<Question> questionList(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	public int lastPage() {
		// TODO Auto-generated method stub
		return 0;
	}

	public static void insertQuestion(Question question) {
		// TODO Auto-generated method stub
		return;
	}

	public Question questionOne(Question question) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateQuestion(Question question) {
		// TODO Auto-generated method stub
		return 0;
	}

	public void deleteQuestion(Question question) {
		// TODO Auto-generated method stub
		
	}

	
	


}
