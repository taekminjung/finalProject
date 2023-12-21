package com.example.haribo.vo;

import lombok.Data;

@Data
public class QuestionReply {
	private int questionReplyNo;
	private int questionNo;
	private String employeeId;
	private String questionReplyContent;
	private String createdate;
	private String updatedate;
}
