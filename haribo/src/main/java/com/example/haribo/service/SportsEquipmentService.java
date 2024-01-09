package com.example.haribo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.SportsEquipmentMapper;
import com.example.haribo.vo.SportsEquipment;
import com.example.haribo.vo.SportsEquipmentExpire;
import com.example.haribo.vo.SportsEquipmentImg;
import com.example.haribo.vo.SportsEquipmentOrder;

@Service
public class SportsEquipmentService {
	@Autowired private SportsEquipmentMapper sportsEquipmentMapper;
	
	public List<SportsEquipmentExpire> sportsEquipmentExpiredList(@RequestParam(defaultValue="1") int currentPage){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("rowPerPage", rowPerPage);
		param.put("beginRow", beginRow);
		
		List<SportsEquipmentExpire> list = sportsEquipmentMapper.sportsEquipmentExpiredList(param);
		return list;
	}
	public int lastPage() {
		int rowPerPage = 10;
		int totalRow = sportsEquipmentMapper.getTotalRow(rowPerPage);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
	
	public int lastPageExpire() {
		int rowPerPage=10;
		int totalRow = sportsEquipmentMapper.getTotalRowExpire(rowPerPage);
		int lastPageExpire = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPageExpire +=1;
		}
		return lastPageExpire;
	}
	
	public int lastPageOrder() {
		int rowPerPage = 10;
		int totalRow = sportsEquipmentMapper.getTotalRowOrder(rowPerPage);
		int lastPageOrder = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPageOrder +=1;
		}
		return lastPageOrder;
	}
	
	public String sportsEquipmentOrder(SportsEquipmentOrder sportsEquipmentOrder) {
		sportsEquipmentMapper.sportsEquipmentOrder(sportsEquipmentOrder);
		return "redirect:/sportsEquipmentOrder";		
	}
	
	public String insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		sportsEquipmentMapper.insertExpire(sportsEquipmentExpire);
		return "redirect:/trainerExpireForm";
	}
	
	public int insertSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.insertSportsEquipment(sportsEquipment);
	}
	
	public void insertSportsEquipmentImg(MultipartFile seImg, SportsEquipmentImg sportsEquipmengImg, String path) {
		String pathSportsEquipment = path+"/employee";
		String oName = seImg.getOriginalFilename();
		String type = oName.substring(oName.lastIndexOf("."));
		String fName = type;
		
		sportsEquipmengImg.setSportsEquipmentImgOriginName(oName);
		sportsEquipmengImg.setSportsEquipmentImgFileName(fName);
		sportsEquipmengImg.setSportsEquipmentImgSize((int)seImg.getSize());
		sportsEquipmengImg.setSportsEquipmentImgType(seImg.getContentType());
		
		int row = sportsEquipmentMapper.insertSportsEquipmentImg(sportsEquipmengImg);
	}
	
	public List<SportsEquipment> sportsEquipmentList(
				@RequestParam(defaultValue="1") int currentPage){

		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("rowPerPage", rowPerPage);
		param.put("beginRow", beginRow);
		
		List<SportsEquipment> list = sportsEquipmentMapper.sportsEquipmentList(param);
		return list;
	}
	
	public List<SportsEquipmentOrder> sportsEquipmentOrderCk(
				@RequestParam(defaultValue="1")int currentPage){
			int rowPerPage = 10;
			int beginRow = (currentPage-1)*rowPerPage;
			
			HashMap<String, Object> param = new HashMap<>();
			param.put("rowPerPage", rowPerPage);
			param.put("beginRow", beginRow);
			
			List<SportsEquipmentOrder> list = sportsEquipmentMapper.sportsEquipmentOrderCk(param);
			return list;
	}
	
	public SportsEquipment sportsEquipmentOne(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.sportsEquipmentOne(sportsEquipment);
	}
	
	public int updateSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.updateSportsEquipment(sportsEquipment);	
	}	
	
	public int updateOrderStatus(SportsEquipmentOrder sportsEquipmentOrder) {
		return sportsEquipmentMapper.updateOrderStatus(sportsEquipmentOrder);
	}
	
	public int deleteSportsEquipment(SportsEquipment sportsEquipment) {
		return sportsEquipmentMapper.deleteSportsEquipment(sportsEquipment);
	}
}