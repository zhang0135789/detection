package com.java1234.service.impl;

import com.java1234.dao.CheckdataDao;
import com.java1234.dao.DatabaseDao;
import com.java1234.entity.Checkdata;
import com.java1234.entity.Database;
import com.java1234.service.DatabaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Author: zz
 * @Description:
 * @Date: ���� 5:17 2018/5/8 0008
 * @Modified By
 */
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
        int total = 0;

        for(int num: result) {
            total += num;
        }

        Database data = new Database();
        data.setDataId(dataId);
        data.setStateAnalyze(1);
        if(total > standard) {//����ƷΪ�ϸ�
            data.setAnResult("�ϸ�");
        }else {//���ϸ�
            data.setAnResult("���ϸ�");
        }
        databaseDao.update(data);



        return "1";
    }
}
