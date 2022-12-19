package com.Pet_Topia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;

@Service
public interface AdminAskService {
   
   
//관리자는 컬럼 선택에 따라 1:1문의를 볼수있음
   
public List<Aam> getAskColumnList
(int page, int limit,int search_field_one, int search_field_two,String search_word);





public int getAskColumnListCount(int search_field_one, int search_field_two,String search_word);

//로그인한 회원이 자신의 글만 보도록

public List<Aam> getAskMemberOwnList(int page,int limit,String login_id);

//로그인한 회원 카운트
public int getAskMemberOwnListCount(String login_id);

public List<Aam> test_ask_member(int test);

public int getAskMemberListCount(String ask_member);



public Aam getAskDetail(int num);

public Aac getComent(int num);

public int AnswerUpdate(int num);

public int write_to_admin_form(Aam aam);

//1:1 문의글에 대해서 클릭시 해당 글 상세보기로 이동함.
public Aam ask_to_admin_view(int num);



}