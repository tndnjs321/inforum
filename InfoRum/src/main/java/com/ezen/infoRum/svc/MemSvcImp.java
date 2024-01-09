package com.ezen.infoRum.svc;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.infoRum.dao.MemDao;
import com.ezen.infoRum.dto.MemDto;

@Service
public class MemSvcImp implements MemSvc {
	
	@Autowired
	MemDao memDao;
	
	@Override
	public void joinProc(Map<String, Object> map) {
		memDao.joinProc(map);
	}
	
	@Override
	public int LoginProc(String uid, String upw) {
	
		return memDao.LoginProc(uid,upw);
	}
	
	@Override
	public MemDto findMemInfo(String uid) {
	
		return memDao.findMemInfo(uid);
	}
	
	@Override
	public int pwdChange(String uid, String uemail, String upw) {
		
		return memDao.pwdChange(uid,uemail,upw);
	}
	
	@Override
	public int chkID(String uid) {
		
		return memDao.chkID(uid);
	}
	
	@Override
	public void myPageProc(Map<String, Object> map) {
		memDao.myPageProc(map);
	}
}
