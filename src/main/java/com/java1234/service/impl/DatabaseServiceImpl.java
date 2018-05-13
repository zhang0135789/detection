package com.java1234.service.impl;

import com.java1234.dao.CheckdataDao;
import com.java1234.dao.DatabaseDao;
import com.java1234.entity.Checkdata;
import com.java1234.entity.Database;
import com.java1234.service.DatabaseService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.text.NumberFormat;
import java.util.*;

/**
 * @Author: zz
 * @Description:
 * @Date: ���� 5:17 2018/5/8 0008
 * @Modified By
 */
@SuppressWarnings("Duplicates")
@Service
public class DatabaseServiceImpl implements DatabaseService {


    @Resource
    private DatabaseDao databaseDao;

    @Resource
    private CheckdataDao checkdataDao;
    /**
     * ��ҳ��ѯ
     * @param map
     * @return
     */
    @Override
    public List<Database> list(Map<String ,Object> map) {
        return databaseDao.list(map);
    }

    /**
     * ��ѯ����
     * @param map
     * @return
     */
    @Override
    public Long getTotal(Map<String, Object> map) {
        return databaseDao.getTotal(map);
    }

    /**
     * ��������
     * @param data
     */
    @Override
    public int save(Database data , MultipartFile file) {
        String uuid = UUID.randomUUID().toString();
        data.setDataId(uuid);
        data.setCreateDate(new Date());
        databaseDao.save(data);
        return 1;
    }

    /**
     * ����idɾ������
     * @param id
     * @return
     */
    @Override
    public Integer delete(String id) {
        return databaseDao.delete(new Integer(id));
    }

    /**
     * ���м��
     * @param dataId
     * @return
     */
    @Override
    public String analze(String dataId) {
        //��ȡ�������
        List<Checkdata> list = new ArrayList<Checkdata>();
        //���
        List<Integer> result = new ArrayList<>();

        list = checkdataDao.list(dataId);
        for(Checkdata checkdata: list) {
            int rsxn = checkdata.getRsxn();
            int yhwz = checkdata.getYhwz() ;//�к�����
            int sld = checkdata.getSld();//ɫ�ζ�
            int zwql = checkdata.getZwql();//֯��ǿ��
            int ccwd = checkdata.getCcwd();//�ߴ��ȶ���
            int kqqqm = checkdata.getKqqqm();//��������ë��
            int mcld = checkdata.getMcld();//Ħ���ζ�
            int fsx = checkdata.getFsx();//��ˮ��
            int sum = rsxn + yhwz + sld + zwql + ccwd + kqqqm + mcld + fsx;
            result.add(sum);
        }
        // 8 ����    3-5�ϸ�   ��24-40 �ϸ�
        //���Ƿ�ϸ�

        int standard = (result.size()==0?1:result.size()) * 3 * 8;
        double total = 0.0;

        //���ɽ����  [1,2,3,4,5,4,3,2]
        String rst = "";
        int size = result.size();
        for(int i = 0 ; i < 8 ; i++) {
            double num = 0.0;

            if(i < size) {
                num = result.get(i);
                if(i == 7) {
                    rst = rst +  num/8;
                }else {
                    rst = rst +  num/8 + ",";
                }

            }else {
                num = (int)Math.random()*5 + 1;
                if(i == 7) {
                    rst = rst +  num;
                }else {
                    rst = rst +  num + ",";
                }
            }
            total += num;
        }
        rst = "[" + rst + "]";
        System.out.println(rst);


        Database data = new Database();
        data.setDataId(dataId);
        data.setStateAnalyze(1);
        if(total > standard) {//����ƷΪ�ϸ�
            data.setAnResult("�ϸ�");
            data.setRst(rst);
        }else {//���ϸ�
            data.setAnResult("���ϸ�");
            data.setRst(rst);
        }
        databaseDao.update(data);

        return "1";
    }

    /**
     * ����Ԥ��
     * @param dataId
     * @return
     */
    @Override
    public String forecast(String dataId) {
        //��ȡԤ������
        List<Checkdata> list = new ArrayList<Checkdata>();
        list = checkdataDao.list(dataId);

        List<Integer> result = new ArrayList<Integer>();

        for(Checkdata checkdata: list) {
            int rsxn = checkdata.getRsxn();
            int yhwz = checkdata.getYhwz() ;//�к�����
            int sld = checkdata.getSld();//ɫ�ζ�
            int zwql = checkdata.getZwql();//֯��ǿ��
            int ccwd = checkdata.getCcwd();//�ߴ��ȶ���
            int kqqqm = checkdata.getKqqqm();//��������ë��
            int mcld = checkdata.getMcld();//Ħ���ζ�
            int fsx = checkdata.getFsx();//��ˮ��
            int sum = rsxn + yhwz + sld + zwql + ccwd + kqqqm + mcld + fsx;
            result.add(sum);
        }

        //�����
        String rst = "";

        //��׼��  3* 8 = 24
        int total = 0;
        for(int i = 0 ; i < result.size() ; i++) {
            int num = result.get(i);
            if(num > 24) {
                total++;
            }

            if(i == result.size()-1) {
                rst = rst + num;
            }else {
                rst = rst + num + ",";
            }
        }

        int diliverNum=3;//�����ӵı���
        int queryMailNum=9;//�����ӵı���
        // ����һ����ֵ��ʽ������
        NumberFormat numberFormat = NumberFormat.getInstance();
        // ���þ�ȷ��С�����2λ
        numberFormat.setMaximumFractionDigits(2);
        String resultHgl = numberFormat.format((float)total/(float)result.size()*100);

        System.out.println("�ϸ��ʵİٷֱ�Ϊ:" + resultHgl + "%");



        rst = "[" + rst + "]";
        System.out.println(rst);
        System.out.println(resultHgl);

        Database data = new Database();
//        data.setFoDate(new Date());
        data.setDataId(dataId);
        data.setStateForecast(1);
        data.setRst2(rst);
        data.setFoResult("�ϸ�ٷ���Ϊ"+resultHgl+"%"  );
        databaseDao.update(data);

//        if(total >= 6){ //Ԥ�������ϸ�
//
//        }else { //���ϸ�
//
//        }


        return "1";
    }
}
