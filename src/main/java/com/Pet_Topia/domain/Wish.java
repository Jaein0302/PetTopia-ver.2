package com.Pet_Topia.domain;

public class Wish {
	private String WISH_ID;
	private int	   WISH_ITEM_ID;
	private String WISH_MEMBER_ID;
	private String WISH_ITEM_NAME;
	private String WISH_ITEM_IMAGE;
	private String WISH_RSV_DATE;
	private int WISH_ITEM_PRICE;
	
	
	
	
	public String getWISH_ID() {
		return WISH_ID;
	}
	public void setWISH_ID(String wISH_ID) {
		WISH_ID = wISH_ID;
	}
	public int getWISH_ITEM_ID() {
		return WISH_ITEM_ID;
	}
	public void setWISH_ITEM_ID(int wISH_ITEM_ID) {
		WISH_ITEM_ID = wISH_ITEM_ID;
	}
	public String getWISH_MEMBER_ID() {
		return WISH_MEMBER_ID;
	}
	public void setWISH_MEMBER_ID(String wISH_MEMBER_ID) {
		WISH_MEMBER_ID = wISH_MEMBER_ID;
	}
	public String getWISH_ITEM_NAME() {
		return WISH_ITEM_NAME;
	}
	public void setWISH_ITEM_NAME(String wISH_ITEM_NAME) {
		WISH_ITEM_NAME = wISH_ITEM_NAME;
	}
	public String getWISH_ITEM_IMAGE() {
		return WISH_ITEM_IMAGE;
	}
	public void setWISH_ITEM_IMAGE(String wISH_ITEM_IMAGE) {
		WISH_ITEM_IMAGE = wISH_ITEM_IMAGE;
	}
	public String getWISH_RSV_DATE() {
		return WISH_RSV_DATE;
	}
	public void setWISH_RSV_DATE(String wISH_RSV_DATE) {
		WISH_RSV_DATE = wISH_RSV_DATE;
	}
	public int getWISH_ITEM_PRICE() {
		return WISH_ITEM_PRICE;
	}
	public void setWISH_ITEM_PRICE(int wISH_ITEM_PRICE) {
		WISH_ITEM_PRICE = wISH_ITEM_PRICE;
	}
}
