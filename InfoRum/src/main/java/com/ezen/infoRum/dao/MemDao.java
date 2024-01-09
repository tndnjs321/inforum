package com.ezen.infoRum.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.infoRum.dto.MemDto;

@Mapper
public interface MemDao {

	void joinProc(Map<String, Object> map);

	int LoginProc(String uid, String upw);

	MemDto findMemInfo(String uid);

	int pwdChange(String uid, String uemail, String upw);

	int chkID(String uid);

	void myPageProc(Map<String, Object> map);
	

}
