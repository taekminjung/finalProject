package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

@Mapper
public interface QuestionReplyMapper {
	//문의 댓글 삽입
	int insertQuestionReply(QuestionReply questionReply);
	//문의댓글 삭제
	int deleteQuestionReply(QuestionReply questionReply);
	//문의글에 댓글이 있는지 검색
	int selectQuestionReply(Question question);
	//댓글 출력
	List<QuestionReply> selectquestionReply(Question question);
}
