package com.Pet_Topia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.Community_comm;
import com.Pet_Topia.service.CommunityService;
import com.Pet_Topia.service.Community_comm_Service;

@RestController //@Controller + @ResponseBody
@RequestMapping(value = "/comment")
public class Community_comm_Controller {
	

	private CommunityService Communityservice;
	private Community_comm_Service commentService;

	@Autowired
	public Community_comm_Controller(Community_comm_Service commentService,
									CommunityService communityService) {
		this.commentService = commentService;
		this.Communityservice = communityService;
	}
	
	@PostMapping(value = "/list")
	public Map<String,Object> CommentList(int comment_commu_num,int page){
		List<Community_comm> list = commentService.getCommentList(comment_commu_num,page);
		int listcount = commentService.getListCount(comment_commu_num);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}
	
	@PostMapping(value="/add")
	public int CommentAdd(Community_comm co) {
		return commentService.commentsInsert(co);
	}
	
	@PostMapping(value="/update")
	public int CommentUpdate(Community_comm co) {
		return commentService.commentsUpdate(co);
	}
	
	@PostMapping(value="/delete")
	public int CommentDelete(int comment_num) {
		return commentService.commentsDelete(comment_num);
	}
	
	/**내가 쓴 커뮤니티 글**/
	@RequestMapping(value = "/myPost", method = RequestMethod.GET)
	public ModelAndView myPost(
			@RequestParam(value = "member_id") String member_id,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		
		int limit = 10; // 한 화면에 출력할 로우 갯수
		int listcount = Communityservice.mygetListCount(member_id); // 나의 글 총 리스트 수를 받아옴
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) endpage = maxpage;
		
		List<Community> postList = Communityservice.mygetPostList(member_id, page, limit); // 리스트를 받아옴
		mv.setViewName("community/post_mylist");//order/review_mylist 참고
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("postList", postList);
		mv.addObject("limit", limit);
		
		return mv;
	}
	
	/**내가 쓴 댓글**/
	@RequestMapping(value = "/myComment", method = RequestMethod.GET)
	public ModelAndView myComment(
			@RequestParam(value = "member_id") String member_id,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		
		int limit = 10; // 한 화면에 출력할 로우 갯수
		int listcount = commentService.getMyCommentListCount(member_id); // 나의 글 총 리스트 수를 받아옴
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) endpage = maxpage;
		
		List<Community> commentList = commentService.getMyCommentList(member_id, page, limit); // 리스트를 받아옴
		mv.setViewName("community/comment_mylist");//order/review_mylist 참고
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("commentList", commentList);
		mv.addObject("limit", limit);
		
		return mv;
	}
}


