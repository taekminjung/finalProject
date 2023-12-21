package com.example.haribo.vo;

import lombok.Data;

@Data
public class ProgramReservation {
	private int programReservationNo;
	private int paymentNo;
	private int programDateNo;
	private int branchNo;
	private String programReservationDate;
	private String createdate;
	private String updatedate;
}
