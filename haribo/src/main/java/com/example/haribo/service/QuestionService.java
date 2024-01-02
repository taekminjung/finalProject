package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.haribo.mapper.QuestionMapper;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	


}
