package com.java1234.dao;

import com.java1234.entity.Database;

import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description: �ɼ�������ϢDao�ӿ�
 * @Date: ���� 4:53 2018/5/8 0008
 * @Modified By
 */
public interface DatabaseDao {

    /**
     * ���������·ݷ����ѯ
     * @return
     */
//    public List<Database> countList();

    /**
     * ��ҳ��ѯ
     * @return
     */
    public List<Database> list(Map<String,Object> map);

    /**
     * ��ȡ�ܼ�¼��
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * ͨ��Id����ʵ��
     * @param dataId
     * @return
     */
    public Database findById(String dataId);

    /**
     * ������Ϣ
     * @param data
     * @return
     */
    public Integer update(Database data);

    /**
     * ��ȡ��һ��
     * @param id
     * @return
     */
//    public Database getLastDatabase(Integer id);

    /**
     * ��ȡ��һ��
     * @param id
     * @return
     */
//    public Database getNextDatabase(Integer id);

    /**
     * �����Ϣ
     * @param blog
     * @return
     */
 //   public Integer add(Database blog);

    /**
     * ɾ����Ϣ
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * �����Ϣ
     * @param database
     * @return
     */
    public Integer save(Database database);

    /**
     * ��ѯָ���Ĳ�������µĲ�������
     * @param typeId
     * @return
     */
 //   public Integer getDatabaseByTypeId(Integer typeId);

}
