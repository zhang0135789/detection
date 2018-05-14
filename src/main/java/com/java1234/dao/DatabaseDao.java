package com.java1234.dao;

import com.java1234.entity.Database;

import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description: 采集数据信息Dao接口
 * @Date: 下午 4:53 2018/5/8 0008
 * @Modified By
 */
public interface DatabaseDao {

    /**
     * 根据日期月份分组查询
     * @return
     */
//    public List<Database> countList();

    /**
     * 分页查询
     * @return
     */
    public List<Database> list(Map<String,Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 通过Id查找实体
     * @param dataId
     * @return
     */
    public Database findById(String dataId);

    /**
     * 更新信息
     * @param data
     * @return
     */
    public Integer update(Database data);

    /**
     * 获取上一个
     * @param id
     * @return
     */
//    public Database getLastDatabase(Integer id);

    /**
     * 获取下一个
     * @param id
     * @return
     */
//    public Database getNextDatabase(Integer id);

    /**
     * 添加信息
     * @param blog
     * @return
     */
 //   public Integer add(Database blog);

    /**
     * 删除信息
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 添加信息
     * @param database
     * @return
     */
    public Integer save(Database database);

    /**
     * 查询指定的博客类别下的博客数量
     * @param typeId
     * @return
     */
 //   public Integer getDatabaseByTypeId(Integer typeId);

}
