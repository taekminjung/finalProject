package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

@Mapper
public interface QuestionReplyMapper {
	
	int insertQuestionReply(QuestionReply questionReply);
	
	int deleteQuestionReply(QuestionReply questionReply);

	List<QuestionReply> selectquestionReply(Question question);

	List<QuestionReply> questionReply(QuestionReply questionReply);

}
