package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.mybatis.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService {

	private CommunityMapper dao;
	
	@Autowired
	public CommunityServiceImpl(CommunityMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int getListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if(index!=-1) {
			String[] search_field=new String[] {"commu_subject", "commu_content", "commu_name"};
			map.put("search_field", search_field[index]);
			map.put("search_word","%"+search_word+"%");
		}
		return dao.getListCount(map);
	}

	@Override
	public List<Community> getBoardList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(index!=-1) {
			String[] search_field=new String[] {"commu_subject", "commu_content", "commu_name"};
			map.put("search_field", search_field[index]);
			map.put("search_word","%"+search_word+"%");
		}
		
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}

	@Override
	public void insert(Community comm) {
		dao.insert(comm);
		
	}

	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}

	@Override
	public Community getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public int delete(int num) {
		return dao.delete(num);
	}

	@Override
	public List<Community> hot_List() {
		return dao.hot_list();
	}

	@Override
	public int udpate(Community comm) {
		return dao.update(comm);
		
	}

	@Override
	public int mygetListCount(String member_id) {
		return dao.mygetListCount(member_id);
	}

	@Override
	public List<Community> mygetPostList(String member_id, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("member_id", member_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.mygetPostList(map);
	}

}
