package com.example.haribo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Contact;

@Mapper
public interface ContactMapper {
		int insertContact(Contact paramContact);
}
