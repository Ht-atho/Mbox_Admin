package core;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ExcelUtils {
    private static XSSFSheet excelWSheet;
    private static XSSFWorkbook excelWBook;
    private static XSSFCell cell;
    private static XSSFRow row;
    public static String pathFile = "C:\\Users\\ADMIN\\IdeaProjects\\AutomationTest\\AssignmentFinal_ThanhNTH7\\src\\test\\java\\TestCase.xlsx";

    public static Object[][] getTableArray(String filePath, String sheetName, int startCol, int totalCols) {
        Object[][] tabArray = null;
        try {
            FileInputStream ExcelFile = new FileInputStream(filePath);
            excelWBook = new XSSFWorkbook(ExcelFile);
            excelWSheet = excelWBook.getSheet(sheetName);
            int startRow = 1;
            int ci, cj;
            int totalRows = excelWSheet.getLastRowNum();

            tabArray = new Object[totalRows][totalCols + 1];
            ci = 0;
            for (int i = startRow; i <= totalRows; i++, ci++) {
                cj = 0;
                for (int j = startCol; j < totalCols + startCol + 1; j++, cj++) {
                    if (j == totalCols + startCol) {
                        tabArray[ci][cj] = i;
                    } else tabArray[ci][cj] = getcellData(i, j);
                    System.out.println(tabArray[ci][cj]);
                }
            }
        } catch (IOException e) {
            System.out.println("Could not read the Excel sheet");
            e.printStackTrace();
        }
        return (tabArray);
    }

    public static String getcellData(int rowNum, int colNum) {
        try {
            cell = excelWSheet.getRow(rowNum).getCell(colNum);
            return cell.getStringCellValue();

        } catch (Exception e) {
            System.err.println(e.getMessage());
            throw (e);
        }
    }

    public static void reportInExcelFile(String pathFile, String sheetName, String result, int rowNum, int colNum) {
        try {
            FileInputStream file = new FileInputStream(pathFile);
            excelWBook = new XSSFWorkbook(file);
            excelWSheet = excelWBook.getSheet(sheetName);
            row = excelWSheet.getRow(rowNum);
            CellStyle style = excelWBook.createCellStyle();
            style.setAlignment(HorizontalAlignment.CENTER);
            style.setVerticalAlignment(VerticalAlignment.CENTER);
            ;
            cell = row.getCell(colNum);
            if (cell == null) {
                cell = row.createCell(colNum);
            } else {
                if (result.equals("Fail")) {
                    style.setFillForegroundColor(IndexedColors.RED.getIndex());
                    style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                } else if (result.equals("Pass")) {
                    style.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
                    style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                }
                cell.setCellStyle(style);
                cell.setCellValue(result);
            }
            FileOutputStream fileOut = new FileOutputStream(pathFile);
            excelWBook.write(fileOut);
            fileOut.flush();
            fileOut.close();
            excelWBook = new XSSFWorkbook(new FileInputStream(pathFile));
        } catch (Exception e) {
            System.err.println();
        }
    }

    public static void reportExcel(String sheetName, String result, int rowReportInCommonFile, int rowReportInTestDataFile, int colReportInTestDataFile) {
        ExcelUtils.reportInExcelFile(pathFile, "TestCaseList", result, rowReportInCommonFile, 4);
        ExcelUtils.reportInExcelFile(pathFile, sheetName, result, rowReportInTestDataFile, colReportInTestDataFile);

    }

}
