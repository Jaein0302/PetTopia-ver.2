package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Sch;

public interface ScheduleService {

	List<Sch> findScheduleListBySeller(String seller_id);

}
