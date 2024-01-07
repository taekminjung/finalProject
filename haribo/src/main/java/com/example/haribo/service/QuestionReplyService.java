package com.example.haribo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.QuestionReplyMapper;
import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

@Service
public class QuestionReplyService {
	@Autowired QuestionReplyMapper questionReplyMapper;
	
	public void insertQuestionReply(QuestionReply questionReply) {
		// TODO Auto-generated method stub
		
	}

	public void deleteQuestionReply(QuestionReply questionReply) {
		// TODO Auto-generated method stub
		
	}

	public List<QuestionReply> questionReplyList(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<QuestionReply> questionReply(QuestionReply questionReply) {
		List<QuestionReply> list = questionReplyMapper.questionReply(questionReply);
		return list;
	}
	
	public List<QuestionReply> selectquestionReply(Question question) {
	List<QuestionReply> list = questionReplyMapper.selectquestionReply(question);
			
	return list;
}
}
