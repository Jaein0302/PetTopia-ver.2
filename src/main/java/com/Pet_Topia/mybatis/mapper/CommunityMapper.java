package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Community;

@Mapper
public interface CommunityMapper {

		// 글의 갯수 구하기
		public int getListCount(Map<String, String> map);

		// 글 목록 보기
		public List<Community> getBoardList(Map<String, Object> map);
		
		//	글 삽입
		public void insert(Community comm);

		public int setReadCountUpdate(int num);

		public Community getDetail(int num);

		public int delete(int num);

		public List<Community> hot_list();

		public int update(Community comm);

		public int mygetListCount(String member_id);

		public List<Community> mygetPostList(Map<String, Object> map);

	
}
