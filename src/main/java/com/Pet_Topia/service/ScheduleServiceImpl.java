package com.Pet_Topia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Sch;
import com.Pet_Topia.mybatis.mapper.ScheduleMapper;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	private ScheduleMapper dao;
	
	@Override
	public List<Sch> findScheduleListBySeller(String seller_id) {
		return dao.findScheduleListBySeller(seller_id);
	}

}
