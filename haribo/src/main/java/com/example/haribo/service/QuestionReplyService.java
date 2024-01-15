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
	
	// 문의사항 답글 입력
	public int insertQuestionReply(QuestionReply questionReply) {
		int row = questionReplyMapper.insertQuestionReply(questionReply);
		return row;
	}

	// 문의사항 답글 삭제
	public int deleteQuestionReply(Question question) {
		questionReplyMapper.deleteQuestionReply(question);
		return questionReplyMapper.deleteQuestionReply(question);
	}

	public List<QuestionReply> selectquestionReply(Question question) {
		List<QuestionReply> list = questionReplyMapper.selectquestionReply(question);
		return list;
	}
}