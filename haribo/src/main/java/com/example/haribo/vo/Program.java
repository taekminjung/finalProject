package com.example.haribo.vo;

import lombok.Data;

@Data
public class Program {
	private int programNo;
	private String employeeId;
	private String programName;
	private int programMaxCustomer;
	private String createdate;
	private String updatedate;
	private String programMemo;
	private String programDay;
	private String programActive;
}
