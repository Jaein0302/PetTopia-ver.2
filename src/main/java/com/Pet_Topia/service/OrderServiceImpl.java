package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Sch;
import com.Pet_Topia.mybatis.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper dao;
	
	@Autowired
	public OrderServiceImpl(OrderMapper dao) {
		this.dao = dao;
	}

	@Override
	public int OrderListCount(String member_id) {
		return dao.OrderListCount(member_id);
	}

	@Override
	public List<OrderInfo> OrderList(String member_id) {
		return dao.OrderList(member_id);
	}

	@Override
	public int LastCount(String member_id) {
		return dao.LastCount(member_id);
	}

	@Override
	public List<OrderInfo> Lastlist(String member_id, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("member_id", member_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.LastList(map);
	}

	@Override
	public int order_delete(int order_id) {
		return dao.order_delete(order_id);
	}

	@Override
	public List<Sch> findScheduleListBySeller(String seller_id) {
		return dao.findScheduleListBySeller(seller_id);
	}
    
  @Override  
	public OrderInfo order_info(int order_id) {
		return dao.order_info(order_id);
	}

	@Override
	public OrderInfo order_info_last(int order_id) {
		return dao.order_info_last(order_id);
	}

	@Override
	public int addEvent(HashMap<String, Object> schList) {
		return dao.addEvent(schList);
	}

	@Override
	public int add_red_Event(HashMap<String, Object> schList) {
		return dao.add_red_Event(schList);
	}



}
