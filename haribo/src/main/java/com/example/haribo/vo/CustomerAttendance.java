package com.example.haribo.vo;

import lombok.Data;

@Data
public class CustomerAttendance {
		private int customerAttendanceNo;
		private int programReservationNo;
		private String customerAttendanceDate;
		private String customerAttendanceEnterTime;
		private String customerAttendanceExitTime;
}
