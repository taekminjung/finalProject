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
	public String insertQuestionReply(QuestionReply questionReply) {
		questionReplyMapper.insertQuestionReply(questionReply);
		return "redirect:/trainerQuestionOne";
	}

	// 문의사항 답글 삭제
	public int deleteQuestionReply(QuestionReply questionReply) {
		return 0;		
	}

	// 문의사항 답글 목록
//	public List<QuestionReply> questionReply(QuestionReply questionReply) {
//		List<QuestionReply> list = questionReplyMapper.questionReply(questionReply);
//		return list;
//	}
	
	public List<QuestionReply> selectquestionReply(Question question) {
		List<QuestionReply> list = questionReplyMapper.selectquestionReply(question);
		return list;
}
}
