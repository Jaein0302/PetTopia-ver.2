package com.Pet_Topia.service;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;

@Service
public interface AdminAskCommentService {
   
   

   public int Admin_ask_comment(Aac aac);
   
   public int Admin_ask_comment_update(Aac aac);
   

public Aac getComment(int num);
   


}