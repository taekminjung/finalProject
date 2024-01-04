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
			public List<QuestionReply> selectquestionReply(Question question) {
				List<QuestionReply> list = questionReplyMapper.selectquestionReply(question);
				
				return list;
			}
}
