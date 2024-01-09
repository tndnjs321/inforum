package com.ezen.infoRum.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeDto {
	
	private int num;
	private String uid;
	private String nickname;
	private String title;
	private String content;
	private Timestamp regTM;
}
