package com.Pet_Topia.domain;

public class OrderInfo {
	
	private int order_id;				// 주문번호
	private String order_member_id; 	//주문자의 아이디
	private int order_item_id;			//상품번호
	private String order_item_sellerName; //판매자의 이름
	private String order_item_name;		//상품이름
	private int order_item_price;	//상품가격
	private String order_time;			//예약시간
	private String order_location;		//장소
	private String order_image;			//썸네일
	private String order_seller;		//판매자의 아이디

	private int cnt;				//리뷰갯수
	private String order_item_tell; //판매자 연락처
	private String order_member_tell; //고객 연락처
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_member_id() {
		return order_member_id;
	}
	public void setOrder_member_id(String order_member_id) {
		this.order_member_id = order_member_id;
	}
	public int getOrder_item_id() {
		return order_item_id;
	}
	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}
	public String getOrder_item_sellerName() {
		return order_item_sellerName;
	}
	public void setOrder_item_sellerName(String order_item_sellerName) {
		this.order_item_sellerName = order_item_sellerName;
	}
	public String getOrder_item_name() {
		return order_item_name;
	}
	public void setOrder_item_name(String order_item_name) {
		this.order_item_name = order_item_name;
	}
	public int getOrder_item_price() {
		return order_item_price;
	}
	public void setOrder_item_price(int order_item_price) {
		this.order_item_price = order_item_price;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getOrder_location() {
		return order_location;
	}
	public void setOrder_location(String order_location) {
		this.order_location = order_location;
	}
	public String getOrder_image() {
		return order_image;
	}
	public void setOrder_image(String order_image) {
		this.order_image = order_image;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getOrder_seller() {
		return order_seller;
	}
	public void setOrder_seller(String order_seller) {
		this.order_seller = order_seller;
    }
	public String getOrder_item_tell() {
		return order_item_tell;
	}
	public void setOrder_item_tell(String order_item_tell) {
		this.order_item_tell = order_item_tell;
	}
	public String getOrder_member_tell() {
		return order_member_tell;
	}
	public void setOrder_member_tell(String order_member_tell) {
		this.order_member_tell = order_member_tell;
	}
	
	
	
	
	
	
	
}
