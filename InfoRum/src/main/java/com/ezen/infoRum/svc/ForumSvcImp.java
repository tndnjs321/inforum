package com.ezen.infoRum.svc;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.infoRum.dao.ForumDao;
import com.ezen.infoRum.dto.ForumDto;

@Service
public class ForumSvcImp implements ForumSvc {
	
	@Autowired
	private ForumDao forumDao;
	
	public List<ForumDto> mtdListView(String category) {
		return forumDao.mtdListView(category);
	};
	
	@Override
	public List<ForumDto> mtdListViewPlus(String category, String param1, String param2) {
		return forumDao.mtdListViewPlus(category, param1, param2);
	}
	
	@Override
	public int mtdWriterPost(Map<String, Object> map) {
		return forumDao.mtdWriterPost(map);
	}
	
	@Override
	public int mtdUpdatePost(Map<String, Object> map) {
		return forumDao.mtdUpdatePost(map);
	}
	
	@Override
	public int mtdDeletePost(String deletePostNum) {
		return forumDao.mtdDeletePost(deletePostNum);
	}
	
	@Override
	public List<ForumDto> mtdUserTimelineList(String uid) {
		return forumDao.mtdUserTimelineList(uid);
	}
	
	@Override
	public List<ForumDto> mtdUserTimelineListPlus(String uid, String param1, String param2) {
		return forumDao.mtdUserTimelineListPlus(uid, param1, param2);
	}
	
	@Override
	public int mtdPostCnt(String uid) {
		return forumDao.mtdPostCnt(uid);
	}
}
