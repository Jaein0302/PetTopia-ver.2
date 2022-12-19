package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Review;
import com.Pet_Topia.mybatis.mapper.OrderMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private OrderMapper dao;
	
	@Autowired
	public ReviewServiceImpl(OrderMapper dao) {
		this.dao = dao;
	}

	@Override
	public void insert(Review review) {
		dao.insert(review);
		
	}

	@Override
	public int getListCount(int ITEM_ID) {
		return dao.getListCount(ITEM_ID);
	}

	@Override
	public List<Review> getBoardList(int ITEM_ID, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("ITEM_ID", ITEM_ID);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}

	@Override
	public int mygetListCount(String member_id) {
		return dao.mygetListCount(member_id);
	}

	@Override
	public List<Review> mygetBoardList(String member_id, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("member_id", member_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.mygetBoardList(map);
	}

	@Override
	public Double starAVG(int review_item_id) {
		return dao.starAVG(review_item_id);
	}

	@Override
	public void starUpdate(int review_item_id) {
		Double ratingAvg = dao.starAVG(review_item_id);
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		Product p = new Product();
		p.setITEM_ID(review_item_id);
		p.setITEM_SCORE(ratingAvg);
		dao.starUpdate(p);
	}

	@Override
	public List<Review> getPhoto(int ITEM_ID) {
		return dao.getPhoto(ITEM_ID);
	}

	@Override
	public Review getDetail(String review_num) {
		return dao.getDetail(review_num);
	}

	@Override
	public int review_del(String review_num) {
		return dao.review_del(review_num);
	}

	@Override
	public void starUpdate2(int review_item_id, Double star_avg) {
		dao.starUpdate2(review_item_id, star_avg);
		
	}


}
