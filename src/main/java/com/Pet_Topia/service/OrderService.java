package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;

import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Sch;

public interface OrderService {

	int OrderListCount(String member_id);

	List<OrderInfo> OrderList(String member_id);

	int LastCount(String member_id);

	List<OrderInfo> Lastlist(String member_id, int page, int limit);

	int order_delete(int order_id);

	List<Sch> findScheduleListBySeller(String seller_id);

	OrderInfo order_info_last(int order_id);

	OrderInfo order_info(int order_id);

	int addEvent(HashMap<String, Object> schList);

	int add_red_Event(HashMap<String, Object> schList);



}
