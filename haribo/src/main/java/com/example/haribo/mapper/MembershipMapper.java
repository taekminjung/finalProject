package com.example.haribo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.haribo.vo.Membership;

@Mapper
public interface MembershipMapper {
	//멤버십 출력
	List<Membership> selectMembership(Membership membership);
	//멤버십 상세 출력
	List<Membership> selectMembershipDetail(Membership membership);
}
