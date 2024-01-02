package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.AboutUsMapper;
import com.example.haribo.vo.Review;

@Service
public class AboutUsService {
	@Autowired  AboutUsMapper aboutUsMapper;
	
}
