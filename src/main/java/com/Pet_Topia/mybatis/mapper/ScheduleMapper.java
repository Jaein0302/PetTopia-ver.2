package com.Pet_Topia.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Sch;

@Mapper
public interface ScheduleMapper {

	List<Sch> findScheduleListBySeller(String seller_id);

}
