package com.java1234.entity;

/**
 * @Author: zz
 * @Description:  �������ʵ����
 * @Date: 21:55 2018\5\9 0009
 * @Modified By
 */
public class CheckData {
    private int id;
    private String dataId;
    private String scgy;//��������
    private String yljg;//ԭ�Ͻṹ
    private String cpzl;//��Ʒ����
    private String rsxn;//ȼ������
    private String yhwz;//�к�����
    private String sld;//ɫ�ζ�
    private String zwql;//֯��ǿ��
    private String ccwd;//�ߴ��ȶ���
    private String kqqqm;//��������ë��
    private String mcld;//Ħ���ζ�
    private String fsx;//��ˮ��

    @Override
    public String toString() {
        return "CheckData{" +
                "id=" + id +
                ", dataId='" + dataId + '\'' +
                ", scgy='" + scgy + '\'' +
                ", yljg='" + yljg + '\'' +
                ", cpzl='" + cpzl + '\'' +
                ", rsxn='" + rsxn + '\'' +
                ", yhwz='" + yhwz + '\'' +
                ", sld='" + sld + '\'' +
                ", zwql='" + zwql + '\'' +
                ", ccwd='" + ccwd + '\'' +
                ", kqqqm='" + kqqqm + '\'' +
                ", mcld='" + mcld + '\'' +
                ", fsx='" + fsx + '\'' +
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

    public String getRsxn() {
        return rsxn;
    }

    public void setRsxn(String rsxn) {
        this.rsxn = rsxn;
    }

    public String getYhwz() {
        return yhwz;
    }

    public void setYhwz(String yhwz) {
        this.yhwz = yhwz;
    }

    public String getSld() {
        return sld;
    }

    public void setSld(String sld) {
        this.sld = sld;
    }

    public String getZwql() {
        return zwql;
    }

    public void setZwql(String zwql) {
        this.zwql = zwql;
    }

    public String getCcwd() {
        return ccwd;
    }

    public void setCcwd(String ccwd) {
        this.ccwd = ccwd;
    }

    public String getKqqqm() {
        return kqqqm;
    }

    public void setKqqqm(String kqqqm) {
        this.kqqqm = kqqqm;
    }

    public String getMcld() {
        return mcld;
    }

    public void setMcld(String mcld) {
        this.mcld = mcld;
    }

    public String getFsx() {
        return fsx;
    }

    public void setFsx(String fsx) {
        this.fsx = fsx;
    }
}
