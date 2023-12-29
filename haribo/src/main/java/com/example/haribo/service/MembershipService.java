package com.example.haribo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.haribo.mapper.MembershipMapper;
import com.example.haribo.vo.Membership;

@Service
public class MembershipService {
		@Autowired MembershipMapper membershipMapper;
		public List<Membership> selectMembership(Membership membership){
			List<Membership> list = membershipMapper.selectMembership(membership);
			
			return list;
		}
}
