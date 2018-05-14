package com.java1234.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;


/**
 * @Author: zz
 * @Description: Excel操作工具类
 * @Date: 下午 3:49 2018/5/7 0007
 * @Modified By
 */
public class ExcelUtil {
    private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

    /**
     * 生成Excel表格
     *
     * @param inputText 传入导入内容
     */
    public static HSSFWorkbook createExcel(Map<Integer, List> inputText) {
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
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));

        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("燃烧性能");
        row2.createCell(1).setCellValue("有害物质");
        row2.createCell(2).setCellValue("色牢度");
        row2.createCell(3).setCellValue("织物强力");
        row2.createCell(4).setCellValue("尺寸稳定性");
        row2.createCell(5).setCellValue("抗起球起毛性");
        row2.createCell(6).setCellValue("摩擦牢度");
        row2.createCell(7).setCellValue("防水性");
        row2.createCell(8).setCellValue("检测结果");

        int rownum = 2;
        //填写结果
        Iterator it = inputText.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            List<String> list = (List<String>) entry.getValue();
            HSSFRow row3 = sheet.createRow(rownum);
            for(int i = 0 ; i < list.size() ; i++) {
                row3.createCell(i).setCellValue(list.get(i));
            }
            rownum++;
        }

        return wb;


        //输出Excel文件
//        FileOutputStream output = null;
//        try {
//            output = new FileOutputStream("f:\\workbook.xls");
//            wb.write(output);
//            output.flush();
//        } catch (FileNotFoundException e) {
//            log.error("文件转换异常！");
//            e.printStackTrace();
//        } catch (IOException e) {
//            log.error("输出文件异常", e);
//            e.printStackTrace();
//        }
    }

    /**
     *
     * @param wb
     */
    public static Map<Integer, List> exportExcel(Workbook wb) {
        Map<Integer, List> outputText = new HashMap<>();
        //获取Excel文档中的第一个表单
        Sheet sheet = wb.getSheetAt(0);
        int n = 0;
        for(Row row : sheet) {
            int rowNum = row.getRowNum();
            if(rowNum > 1) {
                List<String> list = new ArrayList<>();
                for(int i = 0; i < 11; i++) {
                    row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
                    String str = row.getCell(i).getStringCellValue();
                    list.add(str);
                }
                outputText.put(n,list);
                n++;
            }
        }
        return outputText;
    }


    public static void main(String arg[]) {
        List list = new ArrayList();
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        list.add("合格");
        Map map = new HashMap<Integer, List>();
        map.put(1,list);
        ExcelUtil.createExcel(map);

    }
}
