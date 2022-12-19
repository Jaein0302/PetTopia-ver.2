package com.Pet_Topia.domain;


public class Cart {
	private String CART_ID					;
	private int	   CART_ITEM_ID				;
	private String CART_MEMBER_ID			;
	private String CART_ITEM_NAME			;
	private String CART_ITEM_IMAGE			;
	private String CART_AMOUNT				;
	private String ITEM_RSV_DATE			;
	private double CART_ITEM_PRICE			;
	
	
	
	public String getCART_ID() {
		return CART_ID;
	}
	public void setCART_ID(String cART_ID) {
		CART_ID = cART_ID;
	}
	public int getCART_ITEM_ID() {
		return CART_ITEM_ID;
	}
	public void setCART_ITEM_ID(int cART_ITEM_ID) {
		CART_ITEM_ID = cART_ITEM_ID;
	}
	public String getCART_MEMBER_ID() {
		return CART_MEMBER_ID;
	}
	public void setCART_MEMBER_ID(String cART_MEMBER_ID) {
		CART_MEMBER_ID = cART_MEMBER_ID;
	}
	public String getCART_ITEM_NAME() {
		return CART_ITEM_NAME;
	}
	public void setCART_ITEM_NAME(String cART_ITEM_NAME) {
		CART_ITEM_NAME = cART_ITEM_NAME;
	}
	public String getCART_ITEM_IMAGE() {
		return CART_ITEM_IMAGE;
	}
	public void setCART_ITEM_IMAGE(String cART_ITEM_IMAGE) {
		CART_ITEM_IMAGE = cART_ITEM_IMAGE;
	}
	public String getCART_AMOUNT() {
		return CART_AMOUNT;
	}
	public void setCART_AMOUNT(String cART_AMOUNT) {
		CART_AMOUNT = cART_AMOUNT;
	}
	public String getITEM_RSV_DATE() {
		return ITEM_RSV_DATE;
	}
	public void setITEM_RSV_DATE(String iTEM_RSV_DATE) {
		ITEM_RSV_DATE = iTEM_RSV_DATE;
	}
	public double getCART_ITEM_PRICE() {
		return CART_ITEM_PRICE;
	}
	public void setCART_ITEM_PRICE(double cART_ITEM_PRICE) {
		CART_ITEM_PRICE = cART_ITEM_PRICE;
	}
	
}
