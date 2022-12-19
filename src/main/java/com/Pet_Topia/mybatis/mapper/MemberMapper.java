package com.Pet_Topia.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Member;
import com.Pet_Topia.domain.Product;

@Mapper
public interface MemberMapper {
	
	public Member isId(String id);
	
	public Member isId(String id, String pass);
	
	public int insert(Member m);

	public String find_id(String member_name, String member_email);

	public Member find_pass(String member_id, String member_name, String member_email);

	public int update_pass(String str, String member_id);

	public Member mail_code(String member_email);

	public Member isRegnum(String member_regnum);
	
	public int update(Member m);

	public Member Id_pw_check(String id, String encPassword);

	public void Delete_user(String id);

	public Member getMemberdata(String id);

	public List<Product> search_item(String item);

	public List<Product> search_treat(String item);
	
	public List<Product> search_edu(String item);

	public List<Product> search_beauty(String item);

	public int search_item_count(String item);

	public int search_treat_count(String item);

	public int search_edu_count(String item);

	public int search_beauty_count(String item);

	public List<Product> best_item();


}
