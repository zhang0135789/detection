package com.java1234.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Author: zz
 * @Description:  Excel操作工具类
 * @Date: 下午 3:49 2018/5/7 0007
 * @Modified By
 */
public class ExcelUtil {
    private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

    /**
     * 生成Excel表格
     * @param inputText 传入导入内容
     */
    public static void createExcel(Map<Integer , List> inputText ) {
        //创建HSSFWorkbook对象
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建HSSFSheet对象
        HSSFSheet sheet = wb.createSheet("抽检报告");
        //创建HSSFRow对象：在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        HSSFRow row = sheet.createRow(0);
        //创建HSSFCell对象：创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
        HSSFCell cell = row.createCell(0);
        //设置单元格的值
        cell.setCellValue("抽检报告");

        //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));

        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("姓名");
        row2.createCell(1).setCellValue("班级");
        row2.createCell(2).setCellValue("笔试成绩");
        row2.createCell(3).setCellValue("机试成绩");

        HSSFRow row3 = sheet.createRow(2);
        row3.createCell(0).setCellValue("李明");
        row3.createCell(1).setCellValue("As178");
        row3.createCell(2).setCellValue(87);
        row3.createCell(3).setCellValue(78);



        //输出Excel文件
        FileOutputStream output= null;
        try {
            output = new FileOutputStream("f:\\workbook.xls");
            wb.write(output);
            output.flush();
        } catch (FileNotFoundException e) {
            log.error("文件转换异常！");
            e.printStackTrace();
        } catch (IOException e) {
            log.error("输出文件异常" , e);
            e.printStackTrace();
        }
    }

    public Map<String,String> readExcel(MultipartFile file) {
        Map map = new HashMap<String,String>();



        return map;
    }


    public static void main(String arg[]) {
        ExcelUtil.createExcel(new HashMap<Integer, List>());

    }
}
