package com.example.haribo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.ContactMapper;
import com.example.haribo.vo.Contact;

@Service
public class ContactService {
		@Autowired ContactMapper contactMapper;
		//상담 접수
		public int insertContact(Contact paramContact) {
			int row = contactMapper.insertContact(paramContact);
			return row;
		}
}
