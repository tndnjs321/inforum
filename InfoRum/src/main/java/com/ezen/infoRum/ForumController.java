package com.ezen.infoRum;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.infoRum.dto.ForumDto;
import com.ezen.infoRum.dto.MemDto;
import com.ezen.infoRum.svc.ForumSvcImp;
import com.ezen.infoRum.svc.MemSvc;


@Controller
public class ForumController {
	
	@Autowired
	private ForumSvcImp forumSvcImp;
	
	@Autowired
	private MemSvc memSvc;
	
	
	// 메인페이지
	@RequestMapping("/")
	public String mtdIndex() {
		return "index";
	}
	
	// 포럼공통적으로쓰이는 리스트
	@RequestMapping("/forum")
	public String mtdForum(
			Model model,
			@RequestParam("category") String category
			) {
		model.addAttribute("list", forumSvcImp.mtdListView(category));
		return "category/"+ category +"Forum";
	}
	
	// 포럼공통적으로쓰이는 게시글작성
	@RequestMapping("/writerProc")
	public String mtdWriterProc(
			ForumDto forumDto,
			@RequestParam("category") String category
			) {
		Map<String, Object> map = new HashMap<>();
		map.put("item1", forumDto.getUid());
		map.put("item2", forumDto.getNickname());
		map.put("item3", category);
		map.put("item4", forumDto.getImage());
		map.put("item5", forumDto.getContent());
		map.put("item6", forumDto.getProfile());
		
		forumSvcImp.mtdWriterPost(map);
		
		return "redirect:/forum?category="+category;
	}
	
	// 포럼공통적으로쓰이는 게시글 수정
		@RequestMapping("/updatePost")
		public String updatePost(
				ForumDto forumDto,
				@RequestParam("linkUrl") String linkUrl
				) {
			String category = forumDto.getCategory();
			System.out.println("원본 url : " + linkUrl);
			Map<String, Object> map = new HashMap<>();
			map.put("item1", forumDto.getNum());
			map.put("item2", forumDto.getUid());
			map.put("item3", forumDto.getNickname());
			map.put("item4", category);
			map.put("item5", forumDto.getImage());
			map.put("item6", forumDto.getContent());
			map.put("item7", forumDto.getProfile());
			
			forumSvcImp.mtdUpdatePost(map);
			
			//게시판수정인지,타임라인 수정인지 걸러주는 작업
			if (linkUrl.contains("userTimeline")) {
//				System.out.println("타임라인 에서 수정작업 요청");
				return "redirect:/userTimeline?userid="+forumDto.getUid();
			} else {
//				System.out.println("게시판 에서 수정작업 요청");
				return "redirect:/forum?category="+category;
			}
			
		}
		
		// 포럼공통적으로쓰이는 게시글 삭제
		@RequestMapping("/deletePost")
		public String deletePost(
				@RequestParam("category") String category,
				@RequestParam("num") String deletePostNum,
				@RequestParam("userid") String userid,
				@RequestParam("linkUrl") String linkUrl
				) {
			forumSvcImp.mtdDeletePost(deletePostNum);
//			System.out.println("category : " + category);
//			System.out.println("deletePostNum : " + deletePostNum);
			
			//게시판 삭제인지,타임라인 삭제인지 걸러주는 작업
			if (linkUrl.contains("userTimeline")) {
				return "redirect:/userTimeline?userid="+userid;
			} else {
				return "redirect:/forum?category="+category;
			}
		}
		
		// 유저 타임라인 리스트출력
		@RequestMapping("/userTimeline")
		public String userTimeline(Model model,
				@RequestParam("userid") String userid
				) {

//			System.out.println("선택한 userid : " + userid);
//			System.out.println("deletePostNum : " + deletePostNum);
			MemDto userInfo = memSvc.findMemInfo(userid);
			model.addAttribute("userInfo",userInfo);
			model.addAttribute("list", forumSvcImp.mtdUserTimelineList(userid));
			model.addAttribute("postCnt", forumSvcImp.mtdPostCnt(userid));
			return "category/userTimeline";
		}
		
	// 게시판 무한 스크롤 비동기 식 리스트 
	@RequestMapping("/list")
	public String list(
			Model model , 
			@RequestParam("param1") String param1,
			@RequestParam("param2") String param2,
			@RequestParam("category") String category,
			@RequestParam("userid") String userid
			) {
		if (! category.equals("")) {
//			System.out.println("category : " + category);
			model.addAttribute("list", forumSvcImp.mtdListViewPlus(param1, param2, category));
		} else if (! userid.equals("")){
//			System.out.println("userid : " + userid);
		model.addAttribute("list", forumSvcImp.mtdUserTimelineListPlus(param1, param2, userid));
		}
		return "category/list";
	}
	
	
}