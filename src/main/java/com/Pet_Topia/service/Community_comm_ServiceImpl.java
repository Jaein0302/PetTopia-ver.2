package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.Community_comm;
import com.Pet_Topia.mybatis.mapper.Community_comm_Mapper;

@Service
public class Community_comm_ServiceImpl implements Community_comm_Service {
	
	private Community_comm_Mapper dao;
	
	@Autowired
	public Community_comm_ServiceImpl(Community_comm_Mapper dao) {
		this.dao = dao;
	}
	
	@Override
	public List<Community_comm> getCommentList(int comment_commu_num, int page) {
		int startrow=1;
		int endrow=page*20;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("comment_commu_num", comment_commu_num);
		return dao.getCommentList(map);
	}

	@Override
	public int getListCount(int commu_num) {
		return dao.getListCount(commu_num);
	}

	@Override
	public int commentsInsert(Community_comm co) {
		return dao.commentsInsert(co);
	}

	@Override
	public int commentsUpdate(Community_comm co) {
		return dao.commentsUpdate(co);
	}

	@Override
	public int commentsDelete(int comment_num) {
		return dao.commentsDelete(comment_num);
	}
	
	@Override
	public int getMyCommentListCount(String member_id) {
		return dao.getMyCommentListCount(member_id);
	}

	@Override
	public List<Community> getMyCommentList(String member_id, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("member_id", member_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getMyCommentList(map);
	}



}
