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
 * @Description:  Excel����������
 * @Date: ���� 3:49 2018/5/7 0007
 * @Modified By
 */
public class ExcelUtil {
    private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

    /**
     * ����Excel���
     * @param inputText ���뵼������
     */
    public static void createExcel(Map<Integer , List> inputText ) {
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
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));

        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("����");
        row2.createCell(1).setCellValue("�༶");
        row2.createCell(2).setCellValue("���Գɼ�");
        row2.createCell(3).setCellValue("���Գɼ�");

        HSSFRow row3 = sheet.createRow(2);
        row3.createCell(0).setCellValue("����");
        row3.createCell(1).setCellValue("As178");
        row3.createCell(2).setCellValue(87);
        row3.createCell(3).setCellValue(78);



        //���Excel�ļ�
        FileOutputStream output= null;
        try {
            output = new FileOutputStream("f:\\workbook.xls");
            wb.write(output);
            output.flush();
        } catch (FileNotFoundException e) {
            log.error("�ļ�ת���쳣��");
            e.printStackTrace();
        } catch (IOException e) {
            log.error("����ļ��쳣" , e);
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
