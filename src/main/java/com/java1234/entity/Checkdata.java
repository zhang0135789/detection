package com.java1234.entity;

/**
 * @Author: zz
 * @Description:  检测内容实体类
 * @Date: 21:55 2018\5\9 0009
 * @Modified By
 */
public class Checkdata {
    private int id;
    private String dataId;
    private String scgy;//生产工艺
    private String yljg;//原料结构
    private String cpzl;//产品种类
    private int rsxn;//燃烧性能
    private int yhwz;//有害物质
    private int sld;//色牢度
    private int zwql;//织物强力
    private int ccwd;//尺寸稳定性
    private int kqqqm;//抗起球起毛性
    private int mcld;//摩擦牢度
    private int fsx;//防水性


    @Override
    public String toString() {
        return "Checkdata{" +
                "id=" + id +
                ", dataId='" + dataId + '\'' +
                ", scgy='" + scgy + '\'' +
                ", yljg='" + yljg + '\'' +
                ", cpzl='" + cpzl + '\'' +
                ", rsxn=" + rsxn +
                ", yhwz=" + yhwz +
                ", sld=" + sld +
                ", zwql=" + zwql +
                ", ccwd=" + ccwd +
                ", kqqqm=" + kqqqm +
                ", mcld=" + mcld +
                ", fsx=" + fsx +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataId() {
        return dataId;
    }

    public void setDataId(String dataId) {
        this.dataId = dataId;
    }

    public String getScgy() {
        return scgy;
    }

    public void setScgy(String scgy) {
        this.scgy = scgy;
    }

    public String getYljg() {
        return yljg;
    }

    public void setYljg(String yljg) {
        this.yljg = yljg;
    }

    public String getCpzl() {
        return cpzl;
    }

    public void setCpzl(String cpzl) {
        this.cpzl = cpzl;
    }

    public int getRsxn() {
        return rsxn;
    }

    public void setRsxn(int rsxn) {
        this.rsxn = rsxn;
    }

    public int getYhwz() {
        return yhwz;
    }

    public void setYhwz(int yhwz) {
        this.yhwz = yhwz;
    }

    public int getSld() {
        return sld;
    }

    public void setSld(int sld) {
        this.sld = sld;
    }

    public int getZwql() {
        return zwql;
    }

    public void setZwql(int zwql) {
        this.zwql = zwql;
    }

    public int getCcwd() {
        return ccwd;
    }

    public void setCcwd(int ccwd) {
        this.ccwd = ccwd;
    }

    public int getKqqqm() {
        return kqqqm;
    }

    public void setKqqqm(int kqqqm) {
        this.kqqqm = kqqqm;
    }

    public int getMcld() {
        return mcld;
    }

    public void setMcld(int mcld) {
        this.mcld = mcld;
    }

    public int getFsx() {
        return fsx;
    }

    public void setFsx(int fsx) {
        this.fsx = fsx;
    }
}
