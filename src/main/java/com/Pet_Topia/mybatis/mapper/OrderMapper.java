package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Review;
import com.Pet_Topia.domain.Sch;

@Mapper
public interface OrderMapper {

	void insert(Review review);

	int getListCount(int ITEM_ID);

	List<Review> getBoardList(Map<String, Object> map);

	int mygetListCount(String member_id);

	List<Review> mygetBoardList(Map<String, Object> map);

	Double starAVG(int review_item_id);

	void starUpdate(Product p);

	List<Review> getPhoto(int ITEM_ID);

	Review getDetail(String review_num);

	int review_del(String review_num);

	int OrderListCount(String member_id);

	List<OrderInfo> OrderList(String member_id);

	int LastCount(String member_id);

	List<OrderInfo> LastList(Map<String, Object> map);

	int order_delete(int order_id);

	List<Sch> findScheduleListBySeller(String seller_id);

	OrderInfo order_info(int order_id);

	OrderInfo order_info_last(int order_id);

	int addEvent(HashMap<String, Object> schList);

	void starUpdate2(int review_item_id, Double star_avg);

	int add_red_Event(HashMap<String, Object> schList);




}
