package com.ezen.infoRum.svc;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ezen.infoRum.dao.ManagerDao;
import com.ezen.infoRum.dto.InquiryCmtDto;
import com.ezen.infoRum.dto.InquiryDto;
import com.ezen.infoRum.dto.NoticeDto;

@Service
public class ManagerSvcImp implements ManagerSvc {
	
	@Autowired
	ManagerDao managerDao;
	

// 재성이 파트
	@Override
	public void noticeWriteProc(Map<String, Object> map) {
		managerDao.noticeWriteProc(map);
	}
	@Override
	public List<NoticeDto> mtdList() {
		return managerDao.mtdList();

	}

	@Override
	public NoticeDto mtdNoticeDetail(String num) {
		return managerDao.mtdNoticeDetail(num);
	}

	@Override
	public void mtdNoticeDelete(int num) {
		managerDao.mtdNoticeDelete(num);
	}

//	재광이 파트
	
	public InquiryDto mtdInquiry(int reply) {
		return managerDao.mtdInquiry(reply);
	}
	public int getInquiryCount() {
		return managerDao.getInquiryCount();
	}
	@Override
	public List<InquiryDto> mtdListView(int page) {
		// TODO Auto-generated method stub
		return managerDao.mtdListInquiry((page-1)*5);
	}
	
	public void inquiryWriteProc(Map<String, Object> map) {
		managerDao.inquiryWriteProc(map);
	}
	public List<InquiryCmtDto> mtdInquiryComment(int num) {
		return managerDao.mtdInquiryComment(num);
	}
	public int getInquiryMax() {
		return managerDao.getInquiryMax(); 
	}
	public void inquiryUpdateReadCnt(int param1) {
		managerDao.inquiryUpdateReadCnt(param1);
	}
	


}
