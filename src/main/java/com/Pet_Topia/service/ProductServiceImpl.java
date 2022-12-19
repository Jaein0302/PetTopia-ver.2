package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Wish;
import com.Pet_Topia.mybatis.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
    
	private ProductMapper dao;
	
	@Autowired
	public ProductServiceImpl(ProductMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public List<Product> getSearchList(String category,int index,String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(index == 1) {
			map.put("search_word", "%" + search_word + "%");
		}
		
		map.put("category", category);
		map.put("index", index);
		
		return dao.getSearchList(map);
	}
	
	//검색
	@Override
	public List<Product> getListAjax(String sex, String weight, String species) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sex", sex );
		map.put("weight", weight );
		map.put("species", species );
		
		return dao.getListAjax(map);
	}
	
	@Override
	public int insertProduct(Product product, String member_id) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("ITEM_ID", product.getITEM_ID());
		map.put("ITEM_NAME", product.getITEM_NAME());
		map.put("ITEM_CATEGORY", product.getITEM_CATEGORY());
		map.put("ITEM_PRICE", product.getITEM_PRICE());
		map.put("ITEM_CONTENT", product.getITEM_CONTENT());
		map.put("ITEM_IMAGE_ORIGINAL", product.getITEM_IMAGE_ORIGINAL());
		map.put("ITEM_IMAGE_FILE", product.getITEM_IMAGE_FILE());
		map.put("ITEM_REG_DATE", product.getITEM_REG_DATE());
		map.put("ITEM_SEX", product.getITEM_SEX());
		map.put("ITEM_WEIGHT", product.getITEM_WEIGHT());
		map.put("ITEM_SPECIES", product.getITEM_SPECIES());
		map.put("ITEM_ADDRESS", product.getITEM_ADDRESS());
		map.put("ITEM_SELLER", product.getITEM_SELLER());
		map.put("MEMBER_ID", member_id);
		
		return dao.insertProduct(map);		
	}

	
	@Override
	public Product getDetail(int ITEM_ID) {
		return dao.getDetail(ITEM_ID);
	}
	
	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	@Override
	public List<Product> getProductList(int page, int limit, String member_id) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("member_id", member_id);
		
		return dao.getProductList(map);
	}
	
	@Override
	public int productUpdate(Product product) {
		return dao.productUpdate(product);
	}
	
	@Override
	public int productDelete(int ITEM_ID) {
		return dao.productDelete(ITEM_ID);		
	}
	
	@Override
	public int OrderInsert(OrderInfo orderinfo) {		
		return dao.OrderInsert(orderinfo);
	}
	
	@Override
	public int CartInsert(Product productdata, int amount, String member_id) {
		
		int ITEM_ID = productdata.getITEM_ID();
		String CART_ITEM_NAME = productdata.getITEM_NAME();
		String CART_ITEM_IMAGE = productdata.getITEM_IMAGE_FILE();
		int CART_ITEM_PRICE = productdata.getITEM_PRICE();
		
		HashMap<String, Object> map = new HashMap<String, Object>();		
		
		map.put("CART_ITEM_ID", ITEM_ID);
		map.put("CART_MEMBER_ID", member_id);
		map.put("CART_ITEM_NAME", CART_ITEM_NAME);
		map.put("CART_ITEM_IMAGE", CART_ITEM_IMAGE);
		map.put("CART_AMOUNT", amount);
		map.put("CART_ITEM_PRICE", CART_ITEM_PRICE);
		
		return dao.CartInsert(map);
	}
	
	@Override
	public List<Cart> getCartList(String member_id) {
		return dao.getCartList(member_id);		
	}
	
	@Override
	public Cart checkCart(int ITEM_ID) {
		return dao.checkCart(ITEM_ID);
	}
	
	@Override
	public int getmyListCount(String member_id) {
		return dao.getmyListCount(member_id);
	}


	@Override
	public int WishInsert(Wish newWishItem) {
		return dao.WishInsert(newWishItem);
	}


	@Override
	public Integer checkWish(int iTEM_ID, String member_id) {
		return dao.checkWish(iTEM_ID, member_id);
	}


	@Override
	public int getMyWishCount(String member_id) {
		return dao.getMyWishCount(member_id);
	}


	@Override
	public List<Wish> getMyWishList(String member_id, int page, int limit) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("member_id", member_id);
		
		return dao.getMyWishList(map);
	}


	@Override
	public int deleteWish(int wish_id) {
		return dao.deleteWish(wish_id);
	}



}
