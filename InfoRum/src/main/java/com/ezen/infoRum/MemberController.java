package com.ezen.infoRum;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.infoRum.dto.MemDto;
import com.ezen.infoRum.svc.MemSvc;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemSvc memSvc; 
	
	
	//로그인페이지
	@RequestMapping("/login")
	public String mtdLogin() {
	
		return "member/login";
	}
	
	//로그인처리
	@RequestMapping("/loginProc")
	public String mtdLoginProc(HttpServletRequest req, HttpSession session, Model model) {
		
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		
		int chk = memSvc.LoginProc(uid,upw);
		
		if (chk==1) {
			System.out.println("로그인 성공");
			MemDto ulist = memSvc.findMemInfo(uid);
			session.setAttribute("uid_session", ulist.getUid());
			session.setAttribute("nickname_session", ulist.getNickname());
			session.setAttribute("profile_session", ulist.getProfile());
			session.setAttribute("auth_session", ulist.getAuth());
//			System.out.println(ulist.getUid());
			session.setMaxInactiveInterval(10*60*60);
			return "redirect:/";
		} else {
			System.out.println("로그인 실패");
			
			model.addAttribute("uid",uid);
			return "member/login";
		}
			
			
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String mtdLogout(HttpServletRequest req, HttpSession session) {
		
		session = req.getSession();
		
		if(session != null) {
			session.invalidate();
		} 
		return "redirect:/";
	}
	
	
	//회원가입 동의페이지
	@RequestMapping("/tos")
	public String mtdPrivacy() {
		return "member/tos";
	}
	
	//회원가입페이지
	@RequestMapping("/join")
	public String mtdJoin() {
		
		return "member/join";
	}
	
	//ID 중복 체크
	
	@RequestMapping("/chkID")
	public String mtdChkID(HttpServletRequest req, HttpSession session) {
		
		String resTxt = "";
		String uid = req.getParameter("uid");
		
		int chknum = memSvc.chkID(uid);
		
		if(chknum==1) {
			resTxt = "이미 있는 아이디입니다.";
			session.setAttribute("nowID",uid);
			session.setAttribute("resTxt",resTxt);
		} else {
			resTxt = "사용 가능한 아이디입니다.";
			session.setAttribute("nowID",uid);
			session.setAttribute("resTxt",resTxt);
		}
		
		return "redirect:/join";
	}
	
	
	//회원가입 처리 joinProc
	@RequestMapping("/joinProc")
	public String mtdJoinProc(HttpServletRequest req) {
		
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		String nickname = req.getParameter("nickname");
		String uemail = req.getParameter("uemail");
		
		System.out.println(uid);
		System.out.println(upw);
		System.out.println(nickname);
		System.out.println(uemail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("item1", uid);
		map.put("item2", upw);
		map.put("item3", nickname);
		map.put("item4", uemail);
		
		memSvc.joinProc(map);
		
		return "redirect:/";
	}
	
	//비밀번호 찾기페이지
	@RequestMapping("/pwdChange")
	public String pwdChange() {
		return "member/pwdChange";
	}
	
	//비밀번호 찾기 변경 처리
	@RequestMapping("/pwdChangeProc")
	public String pwdChangeProc(HttpServletRequest req) {
		
		String uid = req.getParameter("uid");
		String uemail = req.getParameter("uemail");
		String upw = req.getParameter("upw");
		
		System.out.println(uid);
		System.out.println(upw);
		
		int chkNum = memSvc.pwdChange(uid,uemail,upw);
		
		if(chkNum ==0) {
			return "redirect:/pwdChange";
		} else {
			return "redirect:/login";
		}
	}
	
	//회원정보 수정
	@RequestMapping("/myPage")
	public String mtdMyPage(HttpServletRequest req) {
		
		return "member/myPage";
	}
	
	//회원정보 수정 처리
		@RequestMapping("/myPageProc")
		public String mtdMyPageProc(HttpServletRequest req) {
			
			String uid = req.getParameter("uid");
			String upw = req.getParameter("upw");
			String nickname = req.getParameter("nickname");
			String uemail = req.getParameter("uemail");
			
			System.out.println(uid);
			System.out.println(upw);
			System.out.println(nickname);
			System.out.println(uemail);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("item1", uid);
			map.put("item2", upw);
			map.put("item3", nickname);
			map.put("item4", uemail);
			
			memSvc.myPageProc(map);
			return "redirect:/";
		}
}
