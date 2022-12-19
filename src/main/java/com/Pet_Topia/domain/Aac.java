package com.Pet_Topia.domain;

//1:1 문의시 어드민이 답변해줌.

public class Aac {

	private String AAC_CONTENT;
	private String AAC_DATE;
	private int AAC_NUMBER; // 문의글 번호를 레퍼런스. AAM_NUMBER

	public String getAAC_CONTENT() {
		return AAC_CONTENT;
	}

	public void setAAC_CONTENT(String aAC_CONTENT) {
		AAC_CONTENT = aAC_CONTENT;
	}

	public String getAAC_DATE() {
		return AAC_DATE;
	}

	public void setAAC_DATE(String aAC_DATE) {
		AAC_DATE = aAC_DATE;
	}

	public int getAAC_NUMBER() {
		return AAC_NUMBER;
	}

	public void setAAC_NUMBER(int aAC_NUMBER) {
		AAC_NUMBER = aAC_NUMBER;
	}

}