package com.ezen.infoRum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.infoRum.dto.InquiryCmtDto;
import com.ezen.infoRum.dto.InquiryDto;
import com.ezen.infoRum.dto.NoticeDto;

@Mapper
public interface ManagerDao {

//  	재광이 파트 추가(문의사항)
		public List<InquiryDto> mtdListInquiry(int page);
		public InquiryDto mtdInquiry(int num);
		public int getInquiryCount();
		public void inquiryWriteProc(Map<String, Object> map);
		public int getInquiryMax();
		public void inquiryUpdateReadCnt(int param1);
		public List<InquiryCmtDto> mtdInquiryComment(int num);
		
//		재성이 파트 추가(공지사항)
		public List<NoticeDto> mtdList();
		NoticeDto mtdNoticeDetail(String num);
		void mtdNoticeDelete(int num);
		void noticeWriteProc(Map<String, Object> map);

}
