package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.mapper.ContactMapper;
import com.example.haribo.vo.Contact;
import com.example.haribo.vo.Notice;

@Service
public class ContactService {
		@Autowired ContactMapper contactMapper;
		//상담 접수
		public int insertContact(Contact paramContact) {
			int row = contactMapper.insertContact(paramContact);
			return row;
		}
		
		public List<Contact> contactCustomerList(@RequestParam(defaultValue ="1") int currentPage){
			int rowPerPage = 10;
			int beginRow = (currentPage-1)*rowPerPage;

			HashMap<String, Object> param = new HashMap<>();
			param.put("beginRow", beginRow);
			param.put("rowPerPage", rowPerPage);
			
			List<Contact> list = contactMapper.contactCustomer(param);
			return list;
		}

		public int lastPage() {
			int rowPerPage = 10;
			int totalRow = contactMapper.getTotalRow();
			int lastPage = totalRow/rowPerPage;
			if(totalRow % rowPerPage !=0) {
				lastPage +=1;
			}
			return lastPage;
		}
}
