package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;

public interface AskService {

	public int insertAsk(ItemAsk itemask);
	
	//ask list
	public int getListCount(Product product);

	public List<ItemAsk> getAskList(int page, int limit, Product product);  // ask에서 asklist 부르기
	
	
	public int updateAsk(ItemAsk itemask); 
	
	public int askDelete(int ITEM_ASK_NUM);
	
	//answer list
	public int getAnswerCount(int ITEM_ID);	
	
	public List<ItemAsk> getAskList2(int ITEM_ID);  // answer에서 asklist 부르기
	
	
	public int addAnswer(ItemAnswer answer);
	
	public List<String> answerCheck(int ITEM_ID);
	
	public List<ItemAnswer> getAnswerList(int ITEM_ID);
	
	public int updateAnswer(int ITEM_ANSWER_NUM, String ITEM_ANSWER_CONTENT);
	
	//myask list
	public int getmyListCount(String member_id);  
	
	public List<ItemAsk> getAskList3(int page, int limit, String member_id);  // myask에서 asklist 부르기
	
	
	
}
