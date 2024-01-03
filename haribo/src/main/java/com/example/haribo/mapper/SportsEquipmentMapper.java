package com.example.haribo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SportsEquipmentMapper {
	List<HashMap<String, Object>> sportsEquipmentExpiredList (Map<String, Object>map);
}
