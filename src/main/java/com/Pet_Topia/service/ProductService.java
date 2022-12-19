package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.OrderInfo;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Wish;



public interface ProductService {

	public List<Product> getSearchList(String category,int index,String search_word);
	
	public List<Product> getListAjax(String sex, String weight, String species);
	
	//상품 등록
	public int insertProduct(Product product, String member_id) ;
	
	public Product getDetail(int ITEM_ID);

	public int getListCount();
	
	//상품 조회
	public List<Product> getProductList(int page, int limit, String member_id);
	
	public int productUpdate(Product product);

	public int productDelete(int ITEM_ID);

	public int OrderInsert(OrderInfo orderinfo);
	
	public int CartInsert(Product productdata, int amount, String member_id);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);
	
	public int getmyListCount(String member_id);

	public Integer checkWish(int iTEM_ID, String member_id);

	public int WishInsert(Wish newWishItem);

	public int getMyWishCount(String member_id);

	public List<Wish> getMyWishList(String member_id, int page, int limit);

	public int deleteWish(int wish_id);


}
