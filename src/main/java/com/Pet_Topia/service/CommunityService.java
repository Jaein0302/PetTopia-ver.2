package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Community;

public interface CommunityService {

	int getListCount(int index, String search_word);

	List<Community> getBoardList(int index, String search_word, int page, int limit);

	void insert(Community comm);

	int setReadCountUpdate(int num);

	Community getDetail(int num);

	int delete(int num);

	List<Community> hot_List();

	int udpate(Community comm);

	int mygetListCount(String member_id);

	List<Community> mygetPostList(String member_id, int page, int limit);

}
