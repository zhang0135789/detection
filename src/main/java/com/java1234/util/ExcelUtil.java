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
 * @Description: Excel����������
 * @Date: ���� 3:49 2018/5/7 0007
 * @Modified By
 */
public class ExcelUtil {
    private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

    /**
     * ����Excel���
     *
     * @param inputText ���뵼������
     */
    public static HSSFWorkbook createExcel(Map<Integer, List> inputText) {
        //����HSSFWorkbook����
        HSSFWorkbook wb = new HSSFWorkbook();

        //����HSSFSheet����
        HSSFSheet sheet = wb.createSheet("��챨��");
        //����HSSFRow������sheet�ﴴ����һ�У�����Ϊ������(excel����)��������0��65535֮����κ�һ��
        HSSFRow row = sheet.createRow(0);
        //����HSSFCell���󣺴�����Ԫ��excel�ĵ�Ԫ�񣬲���Ϊ��������������0��255֮����κ�һ��
        HSSFCell cell = row.createCell(0);
        //���õ�Ԫ���ֵ
        cell.setCellValue("��챨��");

        //�ϲ���Ԫ��CellRangeAddress����������α�ʾ��ʼ�У������У���ʼ�У� ������
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));

        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("ȼ������");
        row2.createCell(1).setCellValue("�к�����");
        row2.createCell(2).setCellValue("ɫ�ζ�");
        row2.createCell(3).setCellValue("֯��ǿ��");
        row2.createCell(4).setCellValue("�ߴ��ȶ���");
        row2.createCell(5).setCellValue("��������ë��");
        row2.createCell(6).setCellValue("Ħ���ζ�");
        row2.createCell(7).setCellValue("��ˮ��");
        row2.createCell(8).setCellValue("�����");

        int rownum = 2;
        //��д���
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


        //���Excel�ļ�
//        FileOutputStream output = null;
//        try {
//            output = new FileOutputStream("f:\\workbook.xls");
//            wb.write(output);
//            output.flush();
//        } catch (FileNotFoundException e) {
//            log.error("�ļ�ת���쳣��");
//            e.printStackTrace();
//        } catch (IOException e) {
//            log.error("����ļ��쳣", e);
//            e.printStackTrace();
//        }
    }

    /**
     *
     * @param wb
     */
    public static Map<Integer, List> exportExcel(Workbook wb) {
        Map<Integer, List> outputText = new HashMap<>();
        //��ȡExcel�ĵ��еĵ�һ����
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
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        list.add("�ϸ�");
        Map map = new HashMap<Integer, List>();
        map.put(1,list);
        ExcelUtil.createExcel(map);

    }
}
