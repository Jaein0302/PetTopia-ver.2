package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;
import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Mapper
public interface AdminMapper {

   // 회원정보 수정 + 검색

   // 회원명단 카운트임.. 이건 매개변수 쓰고 아래껏은 왜안쓰는지 생각?

   public int getSearchMemberListCount(Map<String, String> map);

   public List<Member> getSearchMemberList(Map<String, Object> map);

   public List<Member> listAll();

   public int getAdminNoticeListCount();

   // 공지사항 일반글 업데이트
   public int admin_write_notice_update(Abn abn);

   // 공지사항 글 디테일
   public Abn getNoticeDetail(int num);

   // 공지사항 메인 가져오기
   public List<Abn> getDivisionMain(String division);

   // 공지사항 카운터 가져오기.
   public int getDivisionCount();

   public List<Abn> getdivision(String division);

   // 이걸로 써야함...
   public List<Abn> getadminNoticeList(Map<String, Object> map);

   // 공지사항 삭제

   public int deleteNotice(int num);

   public int admin_write_notice(Abn abn);

   public int getNoticeNormalListCount(String aa);

   // 1:1 문의 작성 코드 관리. AdminAskService

   //1.관리자는 컬럼 선택에 따라 1:1문의 사항을 다볼수있음.
   
   public List<Aam> getAskColumnList(Map<String, Object> map);
   //답변대기 쿼리에서 제목 작성자 선택하는 One
   
   //전체 목록일시 다 출력되는 맵퍼
   public List<Aam> getAskColumnListAll(Map<String, Object> map);

   //컬럼 카운트
   public int getAskColumnListCount(Map<String, Object> map);
   
   //관리자가 전체 조회를 함.
   public int getAskListAllCount();
   
   
   //로그인 한 사람의 게시글만 보이도록.
   public int getAskMemberOwnListCount(String ask_member);

   public List<Aam> getAskMemberOwnList(Map<String, Object> map);
   
   //글 클릭 했을 때 상세 뷰를 보이도록 함 1:1문의 글 클릭시
   
   public Aam ask_to_admin_view(int num);
   
   
   
   
   
   
   public List<Aam> test_ask_member(int test);

   public Aam getAskDetail(int num);

   public Aac getComent(int num);

   public int AnswerUpdate(int num);

   public int write_to_admin_form(Aam aam);

   public int Admin_ask_comment(Aac aac);

   public int Admin_ask_comment_update(Aac aac);

}