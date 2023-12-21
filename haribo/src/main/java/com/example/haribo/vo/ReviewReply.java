package com.example.haribo.vo;

import lombok.Data;

@Data
public class ReviewReply {
	private int reviewReplyNo;
	private int reviewNo;
	private String employeeId;
	private String reviewReplyContent;
	private String createdate;
	private String updatedate;
}
