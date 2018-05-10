package com.java1234.dao;

import com.java1234.entity.Checkdata;


import java.util.List;
import java.util.Map;

/**
 * @Author: zz
 * @Description: 数据信息Dao接口
 * @Date: 上午 10:42 2018/5/10 0010
 * @Modified By
 */
public interface CheckdataDao {


    /**
     * 分页查询
     * @return
     */
    public List<Checkdata> list(Map<String,Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 通过Id查找实体
     * @param id
     * @return
     */
    public Checkdata findById(Integer id);

    /**
     * 更新信息
     * @param data
     * @return
     */
    public Integer update(Checkdata data);


    /**
     * 根据日期月份分组查询
     * @return
     */
//    public List<Checkdata> countList();

    /**
     * 获取上一个
     * @param id
     * @return
     */
//    public Checkdata getLastCheckdata(Integer id);

    /**
     * 获取下一个
     * @param id
     * @return
     */
//    public Checkdata getNextCheckdata(Integer id);

    /**
     * 添加信息
     * @param blog
     * @return
     */
    //   public Integer add(Checkdata blog);

    /**
     * 删除信息
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 查询指定的博客类别下的博客数量
     * @param typeId
     * @return
     */
    //   public Integer getCheckdataByTypeId(Integer typeId);

}
