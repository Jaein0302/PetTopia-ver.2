package com.Pet_Topia.domain;

public class Review {
	
	private int review_num;			// 리뷰 넘버
	private String review_id;   	// 아이디
	private int review_item_id; 	// 상품번호
	private int review_score;		// 평점
	private String review_subject;  // 리뷰 제목
	private String review_content;  // 리뷰 내용
	private String review_text;		// 리뷰 텍스트
	private String review_reg_date; // 리뷰 날짜
	private String review_image;    // 리뷰 이미지
	
	private String order_name;		// 주문이름 
	private String seller;			// 상호
	private String order_date;		// 주문날짜
	private String order_image;		// 썸네일
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public int getReview_item_id() {
		return review_item_id;
	}
	public void setReview_item_id(int review_item_id) {
		this.review_item_id = review_item_id;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date.substring(2,10); //년-월-일
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_text() {
		return review_text;
	}
	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_image() {
		return order_image;
	}
	public void setOrder_image(String order_image) {
		this.order_image = order_image;
	}
	
	

}
