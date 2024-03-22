package kr.or.ddit.excel;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Excel2DBTest2 {
	
	public static void main(String[] args) {
		Excel2DBTest2 test2 = new Excel2DBTest2();
		String Location = "D:/newEmps/newEmp2.xlsx";		// 파일의 위치 및 이름	
		ArrayList<ArrayList<String>> list =null;
		try {
			 list = test2.readFilter(Location); //파일에서 각 셀들을 읽어서 Arraylist에 저장
		} catch (IOException e) {
			e.printStackTrace();
		}	
		System.out.print("엑셀에서 읽어온 내용들....");
		System.out.println(list);
		
		test2.group(list);
	}
	
	
	
	
	public ArrayList<ArrayList<String>> readFilter(String fileName) throws IOException {
		FileInputStream fis = new FileInputStream(fileName);

		@SuppressWarnings("resource")
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		int rowindex = 0;
		int columnindex = 0;		
		ArrayList<ArrayList<String>> filters = new ArrayList<ArrayList<String>>();		
		
		int sheetCn = workbook.getNumberOfSheets();	// 시트 수
		for(int sheetnum=0; sheetnum<sheetCn; sheetnum++) {	// 시트 수만큼 반복
			
			int sheetnum2=sheetnum+1;
			System.out.println("sheet = " + sheetnum2);
			
			XSSFSheet sheet = workbook.getSheetAt(sheetnum);	// 읽어올 시트 선택
			int rows = sheet.getPhysicalNumberOfRows();    // 행의 수
			XSSFRow row = null;
			
			for (rowindex = 0; rowindex < rows; rowindex++) {	// 행의 수만큼 반복

				row = sheet.getRow(rowindex);	// rowindex 에 해당하는 행을 읽는다
				ArrayList<String> filter = new ArrayList<String>();	// 한 행을 읽어서 저장할 변수 선언

				if (row != null) {
					int cells = 0;	// 셀의 수
					cells = row.getPhysicalNumberOfCells();    // 열의 수
					for (columnindex = 0; columnindex <= cells; columnindex++) {	// 열의 수만큼 반복
						XSSFCell cell_filter = row.getCell(columnindex);	// 셀값을 읽는다
						String value = "";
								// 셀이 빈값일경우를 위한 널체크
						if (cell_filter == null) {
							continue;
						} else {
									// 타입별로 내용 읽기
							switch (cell_filter.getCellType()) {
							case FORMULA:
								value = cell_filter.getCellFormula();
								break;
							case NUMERIC:
								value = cell_filter.getNumericCellValue() + "";
								break;
							case STRING:
								value = cell_filter.getStringCellValue() + "";
								break;
							case BLANK:
								value = cell_filter.getBooleanCellValue() + "";
								break;
							case ERROR:
								value = cell_filter.getErrorCellValue() + "";
								break;
							}
						}
						filter.add(value);	//읽은 셀들을 filter에 추가 (행)
					}
				}
				filters.add(filter); //filter(행)을 filters(열)에 추가
			}
		}
		fis.close();	//파일 읽기 종료
		return filters;	//리스트 반환
	}
	
	public void group (ArrayList<ArrayList<String>> list) {
			
			SimpleDateFormat y_format = new SimpleDateFormat("yyyy");
			String year = y_format.format(new Date());
			String month = null;
			ArrayList<String> dateList = new ArrayList<String>();
			
			
			String empNm = "";
			String empDept= "";
			String empTel = "";
			String empHomeTel = "";
			String empEml = "";
			String empAddr = "";
			LocalDate empJncmpYmd= null;
			String empJbgd = "";
			LocalDate empBirth = null;
			
			log.info("{}", list.size());
			
			for(int i=1; i<list.size(); i++) {
				log.info("{}", list.get(i));
				for(int j=0; j<list.get(i).size(); j++) {
					log.info("{}",list.get(i).get(j));
					String regExp = "\\d{4}/\\d{2}/\\d{2}";
					if((Pattern.matches(regExp, list.get(i).get(j)))) {
						log.info("{}은 날짜 형식입니다.",list.get(i).get(j));
					}
					//if(list.get(i).get(j)))
				}
			}
			
	}
			
 
}
