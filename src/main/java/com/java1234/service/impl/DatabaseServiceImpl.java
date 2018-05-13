package com.java1234.service.impl;

import com.java1234.dao.CheckdataDao;
import com.java1234.dao.DatabaseDao;
import com.java1234.entity.Checkdata;
import com.java1234.entity.Database;
import com.java1234.service.DatabaseService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.text.NumberFormat;
import java.util.*;

/**
 * @Author: zz
 * @Description:
 * @Date: 下午 5:17 2018/5/8 0008
 * @Modified By
 */
@SuppressWarnings("Duplicates")
@Service
public class DatabaseServiceImpl implements DatabaseService {


    @Resource
    private DatabaseDao databaseDao;

    @Resource
    private CheckdataDao checkdataDao;
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
    public int save(Database data , MultipartFile file) {
        String uuid = UUID.randomUUID().toString();
        data.setDataId(uuid);
        data.setCreateDate(new Date());
        databaseDao.save(data);
        return 1;
    }

    /**
     * 根据id删除数据
     * @param id
     * @return
     */
    @Override
    public Integer delete(String id) {
        return databaseDao.delete(new Integer(id));
    }

    /**
     * 进行检测
     * @param dataId
     * @return
     */
    @Override
    public String analze(String dataId) {
        //获取检测数据
        List<Checkdata> list = new ArrayList<Checkdata>();
        //结果
        List<Integer> result = new ArrayList<>();

        list = checkdataDao.list(dataId);
        for(Checkdata checkdata: list) {
            int rsxn = checkdata.getRsxn();
            int yhwz = checkdata.getYhwz() ;//有害物质
            int sld = checkdata.getSld();//色牢度
            int zwql = checkdata.getZwql();//织物强力
            int ccwd = checkdata.getCcwd();//尺寸稳定性
            int kqqqm = checkdata.getKqqqm();//抗起球起毛性
            int mcld = checkdata.getMcld();//摩擦牢度
            int fsx = checkdata.getFsx();//防水性
            int sum = rsxn + yhwz + sld + zwql + ccwd + kqqqm + mcld + fsx;
            result.add(sum);
        }
        // 8 条件    3-5合格   总24-40 合格
        //求是否合格

        int standard = (result.size()==0?1:result.size()) * 3 * 8;
        double total = 0.0;

        //生成结果集  [1,2,3,4,5,4,3,2]
        String rst = "";
        int size = result.size();
        for(int i = 0 ; i < 8 ; i++) {
            double num = 0.0;

            if(i < size) {
                num = result.get(i);
                if(i == 7) {
                    rst = rst +  num/8;
                }else {
                    rst = rst +  num/8 + ",";
                }

            }else {
                num = (int)Math.random()*5 + 1;
                if(i == 7) {
                    rst = rst +  num;
                }else {
                    rst = rst +  num + ",";
                }
            }
            total += num;
        }
        rst = "[" + rst + "]";
        System.out.println(rst);


        Database data = new Database();
        data.setDataId(dataId);
        data.setStateAnalyze(1);
        if(total > standard) {//检测产品为合格
            data.setAnResult("合格");
            data.setRst(rst);
        }else {//不合格
            data.setAnResult("不合格");
            data.setRst(rst);
        }
        databaseDao.update(data);

        return "1";
    }

    /**
     * 进行预测
     * @param dataId
     * @return
     */
    @Override
    public String forecast(String dataId) {
        //获取预测数据
        List<Checkdata> list = new ArrayList<Checkdata>();
        list = checkdataDao.list(dataId);

        List<Integer> result = new ArrayList<Integer>();

        for(Checkdata checkdata: list) {
            int rsxn = checkdata.getRsxn();
            int yhwz = checkdata.getYhwz() ;//有害物质
            int sld = checkdata.getSld();//色牢度
            int zwql = checkdata.getZwql();//织物强力
            int ccwd = checkdata.getCcwd();//尺寸稳定性
            int kqqqm = checkdata.getKqqqm();//抗起球起毛性
            int mcld = checkdata.getMcld();//摩擦牢度
            int fsx = checkdata.getFsx();//防水性
            int sum = rsxn + yhwz + sld + zwql + ccwd + kqqqm + mcld + fsx;
            result.add(sum);
        }

        //结果集
        String rst = "";

        //标准是  3* 8 = 24
        int total = 0;
        for(int i = 0 ; i < result.size() ; i++) {
            int num = result.get(i);
            if(num > 24) {
                total++;
            }

            if(i == result.size()-1) {
                rst = rst + num;
            }else {
                rst = rst + num + ",";
            }
        }

        int diliverNum=3;//举例子的变量
        int queryMailNum=9;//举例子的变量
        // 创建一个数值格式化对象
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 设置精确到小数点后2位
        numberFormat.setMaximumFractionDigits(2);
        String resultHgl = numberFormat.format((float)total/(float)result.size()*100);

        System.out.println("合格率的百分比为:" + resultHgl + "%");



        rst = "[" + rst + "]";
        System.out.println(rst);
        System.out.println(resultHgl);

        Database data = new Database();
//        data.setFoDate(new Date());
        data.setDataId(dataId);
        data.setStateForecast(1);
        data.setRst2(rst);
        data.setFoResult("合格百分率为"+resultHgl+"%"  );
        databaseDao.update(data);

//        if(total >= 6){ //预测下批合格
//
//        }else { //不合格
//
//        }


        return "1";
    }
}
