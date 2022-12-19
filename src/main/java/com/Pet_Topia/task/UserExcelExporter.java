package com.Pet_Topia.task;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.Pet_Topia.domain.Member;

public class UserExcelExporter {
	
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	
	private List<Member> memberlist;
	
	
	public UserExcelExporter(List<Member> memberlist) {
		this.memberlist=memberlist;
		workbook = new XSSFWorkbook();
		sheet=workbook.createSheet("Members");
		
	}
	
	
	private void writeHeaderRow() {
		Row row = sheet.createRow(0);
		
		Cell cell = row.createCell(0);
		cell.setCellValue("MEMBER_ID");
		
		cell = row.createCell(1);
		cell.setCellValue("MEMBER_PASSWORD");
		
	    cell = row.createCell(2);
		cell.setCellValue("MEMBER_NAME");
		
		cell = row.createCell(3);
		cell.setCellValue("MEMBER_POST");
		
		cell = row.createCell(4);
		cell.setCellValue("MEMBER_ADDRESS");
		
		cell = row.createCell(5);
		cell.setCellValue("MEMBER_EMAIL");
		cell = row.createCell(6);
		cell.setCellValue("MEMBER_TELL");
		cell = row.createCell(7);
		cell.setCellValue("MEMBER_BTYPE");
		cell = row.createCell(8);
		cell.setCellValue("MEMBER_REGNUM");
		cell = row.createCell(9);
		cell.setCellValue("AUTH");
		
		
		
	}
	
	private void writeDataRows() {
		
		int rowCount = 1;
		//rowCount를 10으로 하면 1번 라인의 컬럼 라인 후 11번에서 데이터 나옴 2~10은 공백이됨.
		//11번에서 나오니까 10
		//2번에서 나와야하니까 1
		
		for(Member member :memberlist ) {
			Row row = sheet.createRow(rowCount++);
			
			Cell cell = row.createCell(0);
			cell.setCellValue(member.getMember_id());
			
			cell = row.createCell(1);
			cell.setCellValue(member.getMember_password());
			
			cell = row.createCell(2);
			cell.setCellValue(member.getMember_name());
			
			cell = row.createCell(3);
			cell.setCellValue(member.getMember_post());
			
			cell = row.createCell(4);
			cell.setCellValue(member.getMember_address());
			
			cell = row.createCell(5);
			cell.setCellValue(member.getMember_email());
			
			cell = row.createCell(6);
			cell.setCellValue(member.getMember_tell());
			
			cell = row.createCell(7);
			cell.setCellValue(member.getMember_btype());
			
			cell = row.createCell(8);
			cell.setCellValue(member.getMember_regnum());
			
			cell = row.createCell(9);
			cell.setCellValue("petto");
			
			
			
			
			
			
			
		}
		
	}
	
	public void export(HttpServletResponse respose) throws IOException {
		writeHeaderRow();
		writeDataRows();
		
		ServletOutputStream outputStream = respose.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}
	
	
	

}
