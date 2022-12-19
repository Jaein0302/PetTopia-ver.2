package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Wish;

@Mapper
public interface ProductMapper {

	public List<Product> getSearchList(Map<String, Object> map);
	
	public List<Product> getListAjax(Map<String, String> map);
	
	public int insertProduct(Map<Object, Object> map);

	public Product getDetail(int ITEM_ID);
	
	public int getListCount();

	public List<Product> getProductList(HashMap<String, Object> map);
 
	public int productUpdate(Product product);
	
	public int productDelete(int ITEM_ID);
	
	public int OrderInsert(OrderInfo orderinfo);
	
	public int CartInsert(HashMap<String, Object> map);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);
	
	public int getmyListCount(String member_id);

	public Integer checkWish(int iTEM_ID, String member_id);

	public int WishInsert(Wish newWishItem);

	public int getMyWishCount(String member_id);

	public List<Wish> getMyWishList(HashMap<String, Object> map);

	public int deleteWish(int wish_id);


}
