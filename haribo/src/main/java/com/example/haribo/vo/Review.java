package com.example.haribo.vo;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;
	private int programReservationNo;
	private String reviewTitle;
	private String reviewContent;
	private String createdate;
	private String updatedate;
}
