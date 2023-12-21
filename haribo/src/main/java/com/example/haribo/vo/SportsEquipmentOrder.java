package com.example.haribo.vo;

import lombok.Data;

@Data
public class SportsEquipmentOrder {
	private int orderNo;
	private int branchNo;
	private int sportsEquipmentNo;
	private int quantity;
	private int totalPrice;
	private String orderStatus;
	private String createdate;
	private String updatedate;
	
}
