package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.Community_comm;

@Mapper
public interface Community_comm_Mapper {

	List<Community_comm> getCommentList(Map<String, Integer> map);

	int getListCount(int commu_num);

	int commentsInsert(Community_comm co);

	int commentsUpdate(Community_comm co);

	int commentsDelete(int comment_num);

	int getMyCommentListCount(String member_id);

	List<Community> getMyCommentList(Map<String, Object> map);

}
