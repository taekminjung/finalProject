package com.example.haribo.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.haribo.mapper.SportsEquipmentMapper;
import com.example.haribo.vo.Branch;
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
		
	public int insertSportsEquipment(SportsEquipment sportsEquipment) {
		int row = sportsEquipmentMapper.insertSportsEquipment(sportsEquipment);
		if (row != 1) {
			throw new RuntimeException();
		}	
			int sportsEquipmentNo = sportsEquipment.getSportsEquipmentNo();
			return sportsEquipmentNo;
	}
	
	public void insertSportsEquipmentImg(MultipartFile seImg, SportsEquipmentImg sportsEquipmentImg, SportsEquipment sportsEquipment, String path) {
		String pathSportsEquipment = path+"/emp";
		String oName = seImg.getOriginalFilename();
		String type = oName.substring(oName.lastIndexOf("."));
		String itemName = sportsEquipment.getItemName();
		String fName = itemName+type;
		
		sportsEquipmentImg.setSportsEquipmentImgOriginName(oName);
		sportsEquipmentImg.setSportsEquipmentImgFileName(fName);
		sportsEquipmentImg.setSportsEquipmentImgSize((int)seImg.getSize());
		sportsEquipmentImg.setSportsEquipmentImgType(seImg.getContentType());
		
		int row = sportsEquipmentMapper.insertSportsEquipmentImg(sportsEquipmentImg);
		
		if(row != 1) {
			throw new RuntimeException();
		}else {
			System.out.println("여기까진 돼");
			File file = new File(pathSportsEquipment+"/"+fName);
			try {
				seImg.transferTo(file);
			}catch(IllegalStateException | IOException e) {
				throw new RuntimeException();
			}
		}
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
	
	public List<HashMap<String, Object>> stockList(@RequestParam(defaultValue="1")int currentPage, Branch branch){
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		param.put("branchNo", branch.getBranchNo());
		
		List<HashMap<String, Object>> list = sportsEquipmentMapper.stockList(param);
		return list;
	}
	
	public int lastPageStock() {
		int rowPerPage = 10;
		int totalRow = sportsEquipmentMapper.getTotalRowOrder(rowPerPage);
		int lastPageStock = totalRow / rowPerPage;
		if (totalRow % rowPerPage !=0) {
			lastPageStock +=1;
		}
		
		return lastPageStock;
	}
	
	// sportsEquipmentOrderForm에 본사가 발주한 물품 리스트 출력
	public List<SportsEquipment> sportsEquipmentOrderFormList() {
		List<SportsEquipment> orderList = sportsEquipmentMapper.sportsEquipmentOrderFormList();
		return orderList;
	}
		
	// sportsEquipmentOrderForm에 트레이너가 발주해야 할 물건들 추가 입력
	public int sportsEquipmentOrderForm(SportsEquipmentOrder sportsEquipmentOrder) {
		return sportsEquipmentMapper.sportsEquipmentOrderForm(sportsEquipmentOrder);
	}
	
	// trainerExpireForm에 폐기할 물품 리스트 출력(현재 본사가 발주해 놓은 물품 리스트)
	public List<SportsEquipment> trainerExpireFormList(){
		List<SportsEquipment> expireList = sportsEquipmentMapper.trainerExpireFormList();
		return expireList;
	}
	
	// trainerExpireForm 물품 폐기 신청 폼
	public int insertExpire(SportsEquipmentExpire sportsEquipmentExpire) {
		return sportsEquipmentMapper.insertExpire(sportsEquipmentExpire);
	}
	
	// 지점 별 재고 현황 확인 리스트
	public List<HashMap<String, Object>> trainerStock(@RequestParam(defaultValue="1") int currentPage) {
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		
		List<HashMap<String, Object>> stockList = sportsEquipmentMapper.trainerStockList(param);
		return stockList;
	}
	
	public int lastPageSp() {
		int rowPerPage = 10;
		int totalRow = sportsEquipmentMapper.getTotalRowStock(rowPerPage);
		int lastPageSp = totalRow / rowPerPage;
		if (totalRow % rowPerPage !=0) {
			lastPageSp +=1;
		}
		return lastPageSp;
	}	
	
	public String selectSportsEquipmentImgName(SportsEquipmentImg sportsEquipmentImg) {

		return sportsEquipmentMapper.selectSportsEquipmentImgName(sportsEquipmentImg);
	}
	
}