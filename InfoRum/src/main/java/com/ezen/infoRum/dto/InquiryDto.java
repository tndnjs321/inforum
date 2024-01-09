package com.ezen.infoRum.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NonNull;

@Data
public class InquiryDto {
	private int num;		 
	private String uId;
	private String nickname;
	private String title;
	private String profile;
	private String content;
	private Timestamp regTm;
	private int readCnt;
	

}



