package com.ezen.infoRum.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemDto {

	private int num;
	private String uid;
	private String upw;
	private String nickname;
	private String uemail;
	private String profile;
	private int auth;
	private Timestamp regTM;
}
