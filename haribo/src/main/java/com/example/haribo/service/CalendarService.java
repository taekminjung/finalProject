package com.example.haribo.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CalendarService {
	public Map<String,Object> calendar (Integer targetYear, Integer targetMonth){
		//타겟 월의 1일
		Calendar firstD = Calendar.getInstance();
		firstD.set(Calendar.DATE, 1);
		
		//타켓 년 월 
		if(targetYear != null && targetMonth != null) {
			firstD.set(Calendar.YEAR,targetYear);
			firstD.set(Calendar.MONTH,targetMonth);
			
		}
		// ex) java 2023/0 -> 2022/12, java 2023/12 -> 2024/1
		targetYear = firstD.get(Calendar.YEAR);
		targetMonth = firstD.get(Calendar.MONTH);
		log.debug("\u001B[43m"+targetYear);
		log.debug("\u001B[43m"+targetMonth);
		
		//타겟 월의 마지막 일
		int lastDate = firstD.getMaximum(Calendar.DATE);
		log.debug("\u001B[43m"+lastDate);
		
		//타켓 월의 시작 공백
		int beginBlank = firstD.get(Calendar.DAY_OF_WEEK) - 1; // 요일의 매핑값(일요일1,월요일2...토요일7) - 1
		log.debug("\u001B[43m"+beginBlank);
		
		//타켓 월의 끝 공백
		int endBlank = 0;
		if((beginBlank + lastDate) % 7 != 0) {
			endBlank = 7 - ((beginBlank + lastDate) % 7) ;
		}
		log.debug("\u001B[43m"+endBlank);
		
		//전체 TD의 수
		int totalTd = beginBlank + lastDate + endBlank;
		log.debug("\u001B[43m"+totalTd);
		
		//CustomerController로 보낼 resultMap에 값 넣기
		Map<String, Object> calMap = new HashMap<>();
		calMap.put("targetYear", targetYear);
		calMap.put("targetMonth", targetMonth);
		calMap.put("lastDate", lastDate);
		calMap.put("beginBlank", beginBlank);
		calMap.put("endBlank", endBlank);
		calMap.put("totalTd", totalTd);
		
		return calMap;
	}
}
