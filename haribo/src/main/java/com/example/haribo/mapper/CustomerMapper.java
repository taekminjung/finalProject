package com.example.haribo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Customer;

@Mapper
public interface CustomerMapper {
	Customer loginCustomer(Customer customer);
}
