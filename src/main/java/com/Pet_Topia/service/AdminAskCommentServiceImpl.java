package com.Pet_Topia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.mybatis.mapper.AdminMapper;

@Service
public class AdminAskCommentServiceImpl implements AdminAskCommentService {
   
    @Autowired
      private AdminMapper dao;

    public int Admin_ask_comment(Aac aac) {
      return dao.Admin_ask_comment(aac);
            
    }
    
      public int Admin_ask_comment_update(Aac aac) {
         
         return dao.Admin_ask_comment_update(aac);
      }

	@Override
	public Aac getComment(int num) {
		return dao.getComent(num);
	}



}