package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.Community_comm;

public interface Community_comm_Service {

	List<Community_comm> getCommentList(int comment_commu_num, int page);

	int getListCount(int comment_commu_num);

	int commentsInsert(Community_comm co);

	int commentsUpdate(Community_comm co);

	int commentsDelete(int comment_num);

	List<Community> getMyCommentList(String member_id, int page, int limit);

	int getMyCommentListCount(String member_id);

}
