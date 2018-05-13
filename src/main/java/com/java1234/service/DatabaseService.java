package com.java1234.service;

import com.java1234.entity.Database;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description:
 * @Date: ���� 5:15 2018/5/8 0008
 * @Modified By
 */
public interface DatabaseService {
    /**
     * ��ҳ��ѯ��ѯ
     * @param map
     * @return
     */
    List<Database> list(Map<String ,Object> map);

    /**
     * ��ѯ����
     * @param map
     * @return
     */
    Long getTotal(Map<String,Object> map);

    /**
     * ��������
     * @param database
     */
    int save(Database database , MultipartFile file);

    /**
     * ɾ������
     * @param id
     * @return
     */
    Integer delete(String id);

    /**
     * ���м��
     * @param dataId
     * @return
     */
    String analze(String dataId);
}
