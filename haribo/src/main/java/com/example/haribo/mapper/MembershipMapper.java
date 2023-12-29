package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Membership;

@Mapper
public interface MembershipMapper {
	List<Membership> selectMembership(Membership membership);
}
