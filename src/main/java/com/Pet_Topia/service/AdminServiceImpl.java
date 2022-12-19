package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.mybatis.mapper.AdminMapper;
import com.Pet_Topia.mybatis.mapper.MemberMapper;

@Service
public class AdminServiceImpl implements AdminService {

   @Autowired
   private AdminMapper dao;

   // <select id="searchCount" parameterType="map" resultType="int">
   // <select id="getAdminNoticeListCount" resultType="int">
   // 사용안했음.

   // 회원 처리

   // 공지사항 처리

   // 1.검색어 및 필드 페이지 처리하여 리스트를 보여줌.
   @Override
   public List<Member> getSearchMemberList(int index, String search_word, int page, int limit) {
      Map<String, Object> map = new HashMap<String, Object>();

      // http://localhost:8088/myhome4/member/list로 접속하는 경우
      // select를 선택하지 않아 index는 "-1"의 값을 갖습니다.
      // 이 경우 아래의 문장을 수행하지 않기 때문에 "search_field" 키에 대한
      // map.get("search_field")의 값은 null이 됩니다.

      if (index != -1) {
         String[] search_field = new String[] { "id", "name"};
         map.put("search_field", search_field[index]);
         map.put("search_word", "%" + search_word + "%");
      }
      int startrow = (page - 1) * limit + 1;
      int endrow = startrow + limit - 1;
      map.put("start", startrow);
      map.put("end", endrow);
      return dao.getSearchMemberList(map);

   }
   // 2.검색 리스트에 대하여 얼마나 검색되었는지 알려줌.
   @Override
   public int getSearchMemberListCount(int index, String search_word) {
      Map<String, String> map = new HashMap<String, String>();
      if (index != -1) {
         String[] search_field = new String[] { "id", "name"};
         map.put("search_field", search_field[index]);
         map.put("search_word", "%" + search_word + "%");
      }
      return dao.getSearchMemberListCount(map);
   }

   // 3.엑셀 및 pdf관련 출력.
   // 파일 출력 메서드
   public List<Member> listAll() {
      return dao.listAll();
   }

   // 4.Abn 공지사항 수를 출력함.
   public int getAdminListCount() {
      return dao.getAdminNoticeListCount();
   }

   // 공지사항 글 작성 관련 메서드 일반

   public int admin_write_notice(Abn abn) {
      return dao.admin_write_notice(abn);
   }

   // 공지사항 디테일 일반
   public Abn getNoticeDetail(int num) {
      return dao.getNoticeDetail(num);
   }

   // 공지사항 메인 글
   public List<Abn> getDivisionMain(String division) {
      return dao.getDivisionMain(division);
   }

   // 공지사항 메인 카운트
   public int getDivisionCount() {
      return dao.getDivisionCount();
   }

   // 공지사항 일반글 글
   public List<Abn> getdivision(String division) {
      return dao.getdivision(division);
   }

   // 공지사항 게시물 관련 메서드 일반.
   public List<Abn> getAdminNoticeList(int page, int limit, String division) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      int startrow = (page - 1) * limit + 1;
      int endrow = startrow + limit - 1;
      map.put("start", startrow);
      map.put("end", endrow);
      map.put("division", division);
      return dao.getadminNoticeList(map);
   }

   // 공지사항 업데이트(일반)
   public int admin_write_notice_update(Abn abn) {
      return dao.admin_write_notice_update(abn);
   }

   // 공지사항 삭제
   public int deleteNotice(int num) {
      return dao.deleteNotice(num);
   }

}