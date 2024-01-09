package com.ezen.infoRum.svc;

import java.util.List;
import java.util.Map;

import com.ezen.infoRum.dto.InquiryCmtDto;
import com.ezen.infoRum.dto.InquiryDto;
import com.ezen.infoRum.dto.NoticeDto;



public interface ManagerSvc {
//	재광이 파트
	public List<InquiryDto> mtdListView(int page);
	public InquiryDto mtdInquiry(int reply);
	public int getInquiryCount();
	public int getInquiryMax();
	public void inquiryWriteProc(Map<String, Object> map);
	public void inquiryUpdateReadCnt(int param1);
	public List<InquiryCmtDto> mtdInquiryComment(int num);
	
//	재성이 파트
	public void noticeWriteProc(Map<String, Object> map);
	public List<NoticeDto> mtdList();
	public NoticeDto mtdNoticeDetail(String num);
	public void mtdNoticeDelete(int num);
		

}
