package com.Pet_Topia.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Service
public interface AdminService {
   
   
//공지사항 메인 글
   List<Abn> getDivisionMain(String division);
//공지사항 일반글 카운트
   int getDivisionCount();
//공지사항 일반 글
   List<Abn> getdivision(String division);

   //공지사항 일반글 페이지 처리해야함.. 위에것 못씀.
   public List<Abn> getAdminNoticeList(int page, int limit, String division);
   
   //공지사항 업데이트
   public int admin_write_notice_update(Abn abn);
   
   //공지사항 삭제
   public int deleteNotice(int num);
   
   
// 고객 리스트 부르기 
   
public List<Member> getSearchMemberList(int index, String search_word, int page, int limit);
   
public int getSearchMemberListCount(int index, String search_word);

   
public List<Member> listAll();


public int getAdminListCount();


public int admin_write_notice(Abn abn);


//공지사항 detail 일반 불러오기

public Abn getNoticeDetail(int num);






}


