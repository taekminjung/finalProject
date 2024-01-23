package com.example.haribo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;
import com.example.haribo.vo.Employee;

@Mapper
public interface HomeMapper {
	
	int countEmployee ();
	
	int countCustomer ();
}
