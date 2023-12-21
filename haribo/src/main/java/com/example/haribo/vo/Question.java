package com.example.haribo.vo;

import lombok.Data;

@Data
public class Question {
	private int questionNo;
	private String customerId;
	private String questionTitle;
	private String questionContent;
	private String createdate;
	private String updatedate;
}
