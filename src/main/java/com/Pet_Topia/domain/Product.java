package com.Pet_Topia.domain;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int    ITEM_ID					;
	private String ITEM_NAME				;
	private String ITEM_CATEGORY			;
	private int	   ITEM_PRICE				;
	private String ITEM_CONTENT				;
	private String ITEM_IMAGE_ORIGINAL		;
	private String ITEM_IMAGE_FILE			;
	private String ITEM_REG_DATE			;
	private String ITEM_RSV_DATE			;
	private double ITEM_SCORE				;
	private String ITEM_SEX					;
	private String ITEM_WEIGHT				;
	private String ITEM_SPECIES				;
	private String ITEM_ADDRESS				;
	private String ITEM_SELLER 				;
	private String MEMBER_ID				;
	
	private MultipartFile uploadfile		;
	//리뷰 수
	private int cnt					;
	private String seller_name		;
	private String seller_tell		;

	public int getITEM_ID() {
		return ITEM_ID;
	}

	public void setITEM_ID(int iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}

	public String getITEM_NAME() {
		return ITEM_NAME;
	}

	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}

	public String getITEM_CATEGORY() {
		return ITEM_CATEGORY;
	}

	public void setITEM_CATEGORY(String iTEM_CATEGORY) {
		ITEM_CATEGORY = iTEM_CATEGORY;
	}

	public int getITEM_PRICE() {
		return ITEM_PRICE;
	}

	public void setITEM_PRICE(int iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}

	public String getITEM_CONTENT() {
		return ITEM_CONTENT;
	}

	public void setITEM_CONTENT(String iTEM_CONTENT) {
		ITEM_CONTENT = iTEM_CONTENT;
	}

	public String getITEM_IMAGE_ORIGINAL() {
		return ITEM_IMAGE_ORIGINAL;
	}

	public void setITEM_IMAGE_ORIGINAL(String iTEM_IMAGE_ORIGINAL) {
		ITEM_IMAGE_ORIGINAL = iTEM_IMAGE_ORIGINAL;
	}

	public String getITEM_IMAGE_FILE() {
		return ITEM_IMAGE_FILE;
	}

	public void setITEM_IMAGE_FILE(String iTEM_IMAGE_FILE) {
		ITEM_IMAGE_FILE = iTEM_IMAGE_FILE;
	}

	public String getITEM_REG_DATE() {
		return ITEM_REG_DATE;
	}

	public void setITEM_REG_DATE(String iTEM_REG_DATE) {
		ITEM_REG_DATE = iTEM_REG_DATE;
	}

	public String getITEM_RSV_DATE() {
		return ITEM_RSV_DATE;
	}

	public void setITEM_RSV_DATE(String iTEM_RSV_DATE) {
		ITEM_RSV_DATE = iTEM_RSV_DATE;
	}

	public double getITEM_SCORE() {
		return ITEM_SCORE;
	}

	public void setITEM_SCORE(double iTEM_SCORE) {
		ITEM_SCORE = iTEM_SCORE;
	}

	public String getITEM_SEX() {
		return ITEM_SEX;
	}

	public void setITEM_SEX(String iTEM_SEX) {
		ITEM_SEX = iTEM_SEX;
	}

	public String getITEM_WEIGHT() {
		return ITEM_WEIGHT;
	}

	public void setITEM_WEIGHT(String iTEM_WEIGHT) {
		ITEM_WEIGHT = iTEM_WEIGHT;
	}

	public String getITEM_SPECIES() {
		return ITEM_SPECIES;
	}

	public void setITEM_SPECIES(String iTEM_SPECIES) {
		ITEM_SPECIES = iTEM_SPECIES;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getITEM_ADDRESS() {
		return ITEM_ADDRESS;
	}

	public void setITEM_ADDRESS(String iTEM_ADDRESS) {
		ITEM_ADDRESS = iTEM_ADDRESS;
	}

	public String getITEM_SELLER() {
		return ITEM_SELLER;
	}

	public void setITEM_SELLER(String iTEM_SELLER) {
		ITEM_SELLER = iTEM_SELLER;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_tell() {
		return seller_tell;
	}

	public void setSeller_tell(String seller_tell) {
		this.seller_tell = seller_tell;
	}
	
}
