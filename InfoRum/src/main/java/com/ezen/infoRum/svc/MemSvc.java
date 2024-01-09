package com.ezen.infoRum.svc;

import java.util.Map;

import com.ezen.infoRum.dto.MemDto;

public interface MemSvc {

	void joinProc(Map<String, Object> map);

	int LoginProc(String uid, String upw);

	MemDto findMemInfo(String uid);

	int pwdChange(String uid, String uemail, String upw);

	int chkID(String uid);

	void myPageProc(Map<String, Object> map);
	
	
	

}
