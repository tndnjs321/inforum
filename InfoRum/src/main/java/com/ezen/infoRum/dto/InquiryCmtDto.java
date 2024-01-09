package com.ezen.infoRum.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class InquiryCmtDto {
	private int num;		 
	private String uId;
	private String nickname;
	private String title;
	private String profile;
	private int pos;
	private String content;
	private Timestamp regTm;
}
// uid,nickname,title,pos,content,profile
