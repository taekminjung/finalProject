package com.example.haribo.vo;

import lombok.Data;

@Data
public class Payment {
	private int paymentNo;
	private String customerId;
	private int paymentMembershipNo;
	private String paymentDate;
	private int paymentPrice;
	private String createdate;
	private String updatedate;
}
