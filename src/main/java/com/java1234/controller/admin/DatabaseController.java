package com.java1234.controller.admin;



import com.java1234.entity.Database;
import com.java1234.entity.PageBean;
import com.java1234.service.DatabaseService;
import com.java1234.util.ExcelUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
import com.mysql.fabric.Response;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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

    private static final Logger log = LoggerFactory.getLogger(DatabaseController.class);

    @Resource
    private DatabaseService databaseService;

    /**
     * 导出excel数据
     * @return
     */
    @RequestMapping("/exportExcel")
    @ResponseBody
    public String exportExcel(String dataId , HttpServletResponse response) throws Exception {
        System.out.println(dataId);
        String fileName = "检测数据结果表";
        String contentType = "application/vnd.ms-excel";//定义导出文件的格式的字符串
        String recommendedName = new String(fileName.getBytes(),"iso_8859_1");//设置文件名称的编码格式
        response.setContentType(contentType);//设置导出文件格式

        HSSFWorkbook wb = databaseService.exportExcel(dataId);


        ByteArrayOutputStream os = new ByteArrayOutputStream();
        wb.write(os);
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            log.error("写入失败",e);
            e.printStackTrace();
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }

        return "1";
    }

    /**
     * 获取excel文件
     * @param dataName
     * @param file
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public String getData(String dataName ,@RequestParam("filepath") MultipartFile file) throws IOException {
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
    public String getAnalzeResult(@RequestParam(value="id",required=false)String id, String dataId ) {
        System.out.println("===========" + id);
        System.out.println(dataId);
        String flag = "0";
        //检测
        flag = databaseService.analze(dataId);

        return flag;
    }

    /**
     * 进预测
     * @param id
     * @return
     */
    @RequestMapping("/forecast")
    @ResponseBody
    public String getForecastResult(@RequestParam(value="id",required=false)String id ,String dataId ) {
        System.out.println("===========" + id);
        System.out.println(dataId);
        String flag = "0";
        //预测下批数据
        flag = databaseService.forecast(dataId);
        return flag;
    }

    /**
     * 删除数据
     * @param ids
     * @return
     */
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
