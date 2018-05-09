package com.java1234.controller.admin;



import com.java1234.entity.Database;
import com.java1234.entity.PageBean;
import com.java1234.service.DatabaseService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @Author: zz
 * @Description: 采集数据controller层
 * @Date: 下午 5:15 2018/5/8 0008
 * @Modified By
 */
@Controller
@RequestMapping("/admin/data")
public class DatabaseController {
    @Resource
    private DatabaseService databaseService;


    /**
     * 分页查询信息
     * @param page
     * @param rows
     * @param s_database
     * @param response
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, Database s_database, HttpServletResponse response) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String,Object>();


        map.put("dataName", StringUtil.formatLike(s_database.getDataName()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());

        List<Database> databaseList = databaseService.list(map);
        System.out.println("----------databaseList:"  + databaseList.toString() );

        Long total=databaseService.getTotal(map);

        JSONObject result = new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray=JSONArray.fromObject(databaseList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);

        System.out.println("------result" + result);

        ResponseUtil.write(response, result);

        return null;
    }




}
