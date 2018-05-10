package com.java1234.dao;

import com.java1234.entity.Checkdata;


import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description: ������ϢDao�ӿ�
 * @Date: ���� 10:42 2018/5/10 0010
 * @Modified By
 */
public interface CheckdataDao {


    /**
     * ��ҳ��ѯ
     * @return
     */
    public List<Checkdata> list(Map<String,Object> map);

    /**
     * ��ȡ�ܼ�¼��
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * ͨ��Id����ʵ��
     * @param id
     * @return
     */
    public Checkdata findById(Integer id);

    /**
     * ������Ϣ
     * @param data
     * @return
     */
    public Integer update(Checkdata data);


    /**
     * ���������·ݷ����ѯ
     * @return
     */
//    public List<Checkdata> countList();

    /**
     * ��ȡ��һ��
     * @param id
     * @return
     */
//    public Checkdata getLastCheckdata(Integer id);

    /**
     * ��ȡ��һ��
     * @param id
     * @return
     */
//    public Checkdata getNextCheckdata(Integer id);

    /**
     * �����Ϣ
     * @param blog
     * @return
     */
    //   public Integer add(Checkdata blog);

    /**
     * ɾ����Ϣ
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * ��ѯָ���Ĳ�������µĲ�������
     * @param typeId
     * @return
     */
    //   public Integer getCheckdataByTypeId(Integer typeId);

}
