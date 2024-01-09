package com.ezen.infoRum.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ForumDto {

	private String num;		 // 게시글 넘버링
	private String uid;		 // 작성자 아이디
	private String nickname; // 작성자 닉네임
	private String category; // 작성한 게시판 이름
	private String image;	 // 게시글에 쓰인 사진파일명
	private String content;	 // 게시글 내용
	private String profile;	 // 프로필 사진파일명
	private Timestamp regTM; // 작성시간
	
}
