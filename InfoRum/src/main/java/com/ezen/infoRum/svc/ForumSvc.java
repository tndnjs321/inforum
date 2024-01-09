package com.ezen.infoRum.svc;

import java.util.List;
import java.util.Map;

import com.ezen.infoRum.dto.ForumDto;

public interface ForumSvc {
	public List<ForumDto> mtdListView(String category);
	
	public List<ForumDto> mtdListViewPlus(String category, String param1, String param2);
	
	public int mtdWriterPost (Map<String,Object> map);
	
	public int mtdUpdatePost (Map<String,Object> map);
	
	public int mtdDeletePost(String deletePostNum);
	
	public List<ForumDto> mtdUserTimelineList(String uid);
	
	public List<ForumDto> mtdUserTimelineListPlus(String uid, String param1, String param2);

	public int mtdPostCnt(String uid);
}
