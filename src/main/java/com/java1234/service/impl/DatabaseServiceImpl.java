package com.java1234.service.impl;

import com.java1234.dao.DatabaseDao;
import com.java1234.entity.Database;
import com.java1234.service.DatabaseService;
import javafx.scene.input.DataFormat;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Author: zz
 * @Description:
 * @Date: 下午 5:17 2018/5/8 0008
 * @Modified By
 */
@Service
public class DatabaseServiceImpl implements DatabaseService {

    @Resource
    private DatabaseDao databaseDao;
    /**
     * 分页查询
     * @param map
     * @return
     */
    @Override
    public List<Database> list(Map<String ,Object> map) {
        return databaseDao.list(map);
    }

    /**
     * 查询总数
     * @param map
     * @return
     */
    @Override
    public Long getTotal(Map<String, Object> map) {
        return databaseDao.getTotal(map);
    }

    /**
     * 保存数据
     * @param data
     */
    @Override
    public void save(Database data) {
        data.setDataId(UUID.randomUUID().toString());
        data.setCreateDate(new Date());
        databaseDao.save(data);
    }
}
