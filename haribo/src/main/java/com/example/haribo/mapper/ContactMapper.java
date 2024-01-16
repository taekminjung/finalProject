package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Contact;

@Mapper
public interface ContactMapper {
		int insertContact(Contact paramContact);
		
		List<Contact> contactCustomer (HashMap<String, Object> param);
		
		int getTotalRow();
		
}
