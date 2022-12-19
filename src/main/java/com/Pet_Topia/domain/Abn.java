package com.Pet_Topia.domain;

import org.springframework.web.multipart.MultipartFile;
public class Abn {
   
   //어드민 공지사항 글쓰기.
   
   private int ABN_NUMBER;
   private String ABN_NAME;
   private String ABN_DIVISION; //'공지' '일반' 두가지로 구분.
   private String ABN_SUBJECT;
   private String ABN_CONTENT; 
   private String ABN_DATE;
   private String ABN_FILE;
   private String ABN_ORIGINAL; //첨부될 파일명
   private MultipartFile uploadfile;
   
   
   public String getABN_DIVISION() {
      return ABN_DIVISION;
   }
   public void setABN_DIVISION(String aBN_DIVISION) {
      ABN_DIVISION = aBN_DIVISION;
   }
   public int getABN_NUMBER() {
      return ABN_NUMBER;
   }
   public void setABN_NUMBER(int aBN_NUMBER) {
      ABN_NUMBER = aBN_NUMBER;
   }
   public String getABN_NAME() {
      return ABN_NAME;
   }
   public void setABN_NAME(String aBN_NAME) {
      ABN_NAME = aBN_NAME;
   }
   public String getABN_SUBJECT() {
      return ABN_SUBJECT;
   }
   public void setABN_SUBJECT(String aBN_SUBJECT) {
      ABN_SUBJECT = aBN_SUBJECT;
   }
   public String getABN_CONTENT() {
      return ABN_CONTENT;
   }
   public void setABN_CONTENT(String aBN_CONTENT) {
      ABN_CONTENT = aBN_CONTENT;
   }

   public String getABN_DATE() {
      return ABN_DATE;
   }
   public void setABN_DATE(String aBN_DATE) {
      ABN_DATE = aBN_DATE;
   }
   public String getABN_FILE() {
      return ABN_FILE;
   }
   public void setABN_FILE(String aBN_FILE) {
      ABN_FILE = aBN_FILE;
   }
   public String getABN_ORIGINAL() {
      return ABN_ORIGINAL;
   }
   public void setABN_ORIGINAL(String aBN_ORIGINAL) {
      ABN_ORIGINAL = aBN_ORIGINAL;
   }
   public MultipartFile getUploadfile() {
      return uploadfile;
   }
   public void setUploadfile(MultipartFile uploadfile) {
      this.uploadfile = uploadfile;
   }
   
   
   

   

}