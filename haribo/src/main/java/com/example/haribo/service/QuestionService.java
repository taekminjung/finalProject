package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.QuestionMapper;
import com.example.haribo.mapper.QuestionReplyMapper;
import com.example.haribo.vo.Question;
import com.example.haribo.vo.QuestionReply;

@Transactional
@Service
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	@Autowired private QuestionReplyMapper questionReplyMapper;
	// 문의사항 입력
	public String insertQuestion(Question question) {
		questionMapper.insertQuestion(question);
		return "redirect:/questionList";
	}

	// 문의사항 수정
	public int updateQuestion(Question question) {
		return questionMapper.updateQuestion(question);
	}

	// 문의사항 삭제
	public void deleteQuestion(Question question, QuestionReply questionReply) {
		int row = questionReplyMapper.deleteQuestionReply(questionReply);
				
		if(row != 1) {
			throw new RuntimeErrorException(null);
		} else { 
			int row2 = questionMapper.deleteQuestion(question);		
		}
	}
	
	// 문의사항 리스트 페이징
	public List<Question> questionList(@RequestParam(defaultValue = "1") int currentPage) {
		int rowPerPage = 10;
		int beginRow = (currentPage -1) * rowPerPage;
		int totalRow = questionMapper.getTotalRow();
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		param.put("lastPage", lastPage);
		
		List<Question> list = questionMapper.questionList(param);
		return list;
	}

	// 문의사항 상세보기
	public Question questionOne(Question question) {
		return questionMapper.questionOne(question);
	}
	
	// 총 문의사항 수
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = questionMapper.getTotalRow();
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	public List<Question> searchByQuestion(Question question, int currentPage){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> map = new HashMap<>();
		map.put("rowPerPage", rowPerPage);
		map.put("beginRow", beginRow);
		map.put("questionTitle", question.getQuestionTitle());
		
		List<Question> list = questionMapper.searchByQuestion(map);
		System.out.println(list+"<--searchList");
		
		return list;
	}
	
	public int searchLastPage(Question question) {
		int rowPerPage = 10;
		int totalRow = questionMapper.getTotalRow2(question);
		int lastPage = totalRow/rowPerPage;
		if(totalRow/rowPerPage !=0) {
			lastPage += 1;
		}
		return lastPage;
	}
	
}