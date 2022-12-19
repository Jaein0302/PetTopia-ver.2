package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Member;
import com.Pet_Topia.domain.Product;

public interface MemberService {
	public int isId(String id, String pass);

	public int insert(Member m);

	public int isId(String id);
	
	public int isRegnum(String member_regnum);

	public String find_id(String member_name, String member_email);

	public int find_pass(String member_id, String member_name, String member_email);

	public int update_pass(String newpass, String member_id);

	public int mail_code(String member_email);
	
	public Member member_info(String id);
	
	public int update(Member m);

	public Member Id_pw_check(String id, String password);

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
