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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
     * 获取excel文件
     * @param dataName
     * @param file
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public String getData(String dataName ,@RequestParam("filepath") MultipartFile file) {
        int flag = 0;
        String filename = file.getOriginalFilename();
        Database data = new Database();
        data.setDataName(dataName);
        data.setFileName(filename);

        //读取文件信息并保存信息
        flag = databaseService.save(data , file);




        return "1";
    }


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

    /**
     * 抽样检测
     * @param id
     * @return
     */
    @RequestMapping("/analyze")
    @ResponseBody
    public String getAnalzeResult(@RequestParam(value="id",required=false)String id,String dataId ) {
        System.out.println("===========" + id);
        System.out.println(dataId);


        String flag = "0";

        return "1";
    }

    /**
     * 进预测
     * @param id
     * @return
     */
    @RequestMapping("/forecast")
    @ResponseBody
    public String getForecastResult(@RequestParam(value="id",required=false)String id ) {
        System.out.println("===========" + id);
        String flag = "0";

        return "1";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deteleData(String ids) {
        String []idsStr = ids.split(",");
        for(String id : idsStr) {
            databaseService.delete(id);
        }

        return "1";
    }

}
