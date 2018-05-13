package com.java1234.service;

import com.java1234.entity.Database;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description:
 * @Date: 下午 5:15 2018/5/8 0008
 * @Modified By
 */
public interface DatabaseService {
    /**
     * 分页查询查询
     * @param map
     * @return
     */
    List<Database> list(Map<String ,Object> map);

    /**
     * 查询总数
     * @param map
     * @return
     */
    Long getTotal(Map<String,Object> map);

    /**
     * 保存数据
     * @param database
     */
    int save(Database database , MultipartFile file);

    /**
     * 删除数据
     * @param id
     * @return
     */
    Integer delete(String id);

    /**
     * 进行检测
     * @param dataId
     * @return
     */
    String analze(String dataId);
}
