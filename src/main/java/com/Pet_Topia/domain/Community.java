package com.Pet_Topia.domain;

import org.springframework.web.multipart.MultipartFile;

public class Community {
	
	private int commu_num;
	private String commu_name;
	private String commu_subject;
	private String commu_content;
	private int commu_readcount;
	private String commu_date;
	private String commu_thumbnail;
	private String commu_file;
	private String commu_original; //첨부될 파일 명
	
	private int    cnt; 		//댓글 수
	private MultipartFile uploadfile;

	
	public int getCommu_num() {
		return commu_num;
	}
	public void setCommu_num(int commu_num) {
		this.commu_num = commu_num;
	}
	public String getCommu_name() {
		return commu_name;
	}
	public void setCommu_name(String commu_name) {
		this.commu_name = commu_name;
	}
	public String getCommu_subject() {
		return commu_subject;
	}
	public void setCommu_subject(String commu_subject) {
		this.commu_subject = commu_subject;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	public int getCommu_readcount() {
		return commu_readcount;
	}
	public void setCommu_readcount(int commu_readcount) {
		this.commu_readcount = commu_readcount;
	}
	public String getCommu_date() {
		return commu_date;
	}
	public void setCommu_date(String commu_date) {
		this.commu_date = commu_date.substring(0,10); //년-월-일
	}
	public String getCommu_file() {
		return commu_file;
	}
	public void setCommu_file(String commu_file) {
		this.commu_file = commu_file;
	}
	
	public String getCommu_original() {
		return commu_original;
	}
	public void setCommu_original(String commu_original) {
		this.commu_original = commu_original;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getCommu_thumbnail() {
		return commu_thumbnail;
	}
	public void setCommu_thumbnail(String commu_thumbnail) {
		this.commu_thumbnail = commu_thumbnail;
	}
	
	
}
