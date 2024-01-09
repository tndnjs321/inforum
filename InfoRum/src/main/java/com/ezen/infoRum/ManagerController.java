package com.ezen.infoRum;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.infoRum.dto.InquiryCmtDto;
import com.ezen.infoRum.dto.InquiryDto;
import com.ezen.infoRum.svc.ManagerSvc;
import com.ezen.infoRum.svc.MemSvc;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ManagerController {
	
	@Autowired
	MemSvc memSvc; 
	@Autowired
	ManagerSvc managerSvc;
	
	// 공지사항 리스트 페이지
	@RequestMapping("/notice")
	public String mtdNotice(Model model) {
		
		model.addAttribute("list", managerSvc.mtdList());
		
		return "/manager/notice";
	}
	
	
	// 공지사항 글 페이지(재성이꺼 추가)
	@RequestMapping("/noticeDetail")
	public String mtdNoticeDetail(HttpServletRequest req, Model model) {
		
		String num = req.getParameter("num");
		
		System.out.println(num);
		
		model.addAttribute("detail",managerSvc.mtdNoticeDetail(num));
		System.out.println(managerSvc.mtdNoticeDetail(num));
		
		return "/manager/noticeDetail";
		
	
	}
		
	// 공지사항 글 삭제	(재성이꺼 추가)
	@RequestMapping("/noticeDelete")
	public String mtdNoticeDelete(HttpServletRequest req, Model model) {
		
		String num = req.getParameter("num");
		
		System.out.println(num);
		
		managerSvc.mtdNoticeDelete(Integer.parseInt(num));
		
		
		return "redirect:/notice";
		
	}
		
	
	// 공지사항 글쓰기 페이지
	@RequestMapping("/noticeWrite")
	public String mtdNoticeWrite() {
		return "manager/noticeWrite";
	}
	
	// 공지사항 글쓰기 처리
	
	
		@RequestMapping("/noticeWriteProc")
		public String mtdNoticeWriteProc(HttpServletRequest req) {
			
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
		
			System.out.println(title);
			System.out.println(content);
			
			Map<String, Object> map = new HashMap<String, Object>();
	
			map.put("item1", title);
			map.put("item2", content);
			
			managerSvc.noticeWriteProc(map);
			
			return "redirect:/notice";
		}
		
		// 1대1 문의 글쓰기 페이지(재광이 파트)
		@RequestMapping("/inquiry")
		public String mtdInquiry(Model model,HttpServletRequest req) {
			
			int page = Integer.parseInt(req.getParameter("page"));
			int count = managerSvc.getInquiryCount();
			int allPage = count / 5;
			int namujiPage = count % 5;
			if(namujiPage!=0) {
				allPage = allPage + 1;
			}
			int startPage = 0;
			if(page%5!=0) {
				startPage = ((page / 5)*5) +1;
			} else {
				startPage = page-4;
			}
			model.addAttribute("list", managerSvc.mtdListView(page));
			model.addAttribute("page", page);
			model.addAttribute("startPage", startPage);
			model.addAttribute("allPage", allPage);
			return "manager/inquiry";
		}
		@RequestMapping("/inquiryWrite")
		public String mtdInquiryWrite(Model model,HttpServletRequest req) {
			
			return "manager/inquiryWrite";
		}
		@RequestMapping("/inquiryWrite/pos")
		@ResponseBody
		public int getPos() {
			return managerSvc.getInquiryMax();
		}
		@RequestMapping("/inquiryWrite/data")
		@ResponseBody
		public void mtdInquiryWriteData(Model model,HttpServletRequest req) {
			Map<String, Object> map = new HashMap<String, Object>();
			String uid = req.getParameter("uid");
			String nickname = req.getParameter("nickname");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String pos = req.getParameter("pos");
			String reply = req.getParameter("reply");
			String profile = req.getParameter("profile");
			map.put("item1", uid);
			map.put("item2", nickname);
			map.put("item3", title);
			map.put("item4", content);
			map.put("item5", profile);			
			managerSvc.inquiryWriteProc(map);
		}
		@RequestMapping("/inquiryDetail")
		public String mtdInquiryDetail(Model model,HttpServletRequest req) {
			int num = Integer.parseInt(req.getParameter("num"));
			managerSvc.inquiryUpdateReadCnt(num);
			
			InquiryDto inquiryDto = managerSvc.mtdInquiry(num);
			List<InquiryCmtDto> inquiryCmtDtos = managerSvc.mtdInquiryComment(num);
			System.out.println(inquiryDto.getTitle());
			model.addAttribute("inquiry", inquiryDto);
			model.addAttribute("inquiryDetail",inquiryCmtDtos);
			int prevPage = num - 1;
			int nextPage = num + 1;
			model.addAttribute("prevPage",prevPage);
			model.addAttribute("nextPage",nextPage);
			System.out.println("size "+inquiryCmtDtos.size());
			return "manager/inquiryDetail";
		}
	
	
}