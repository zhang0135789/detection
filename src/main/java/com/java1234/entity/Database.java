package com.java1234.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: zz
 * @Description: �ɼ�������Ϣʵ��
 * @Date: ���� 4:22 2018/5/8 0008
 * @Modified By
 */
public class Database  {

    private Integer id; // ���
    private String dataId; //��������ţ�����
    private String dataName; // ��������
    private String filePath; // �����ļ�·��
    private Date createDate; // �ɼ�����ʱ��
    private Integer stateAnalyze; // ����״̬
    private Date anDate; // ����ʱ��
    private Integer stateForecast; // Ԥ��״̬
    private Date foDate; //Ԥ��ʱ��
    private String downloadOPath; //����·��


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDataId() {
        return dataId;
    }

    public void setDataId(String dataId) {
        this.dataId = dataId;
    }

    public String getDataName() {
        return dataName;
    }

    public void setDataName(String dataName) {
        this.dataName = dataName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getStateAnalyze() {
        return stateAnalyze;
    }

    public void setStateAnalyze(Integer stateAnalyze) {
        this.stateAnalyze = stateAnalyze;
    }

    public Date getAnDate() {
        return anDate;
    }

    public void setAnDate(Date anDate) {
        this.anDate = anDate;
    }

    public Integer getStateForecast() {
        return stateForecast;
    }

    public void setStateForecast(Integer stateForecast) {
        this.stateForecast = stateForecast;
    }

    public Date getFoDate() {
        return foDate;
    }

    public void setFoDate(Date foDate) {
        this.foDate = foDate;
    }

    public String getDownloadOPath() {
        return downloadOPath;
    }

    public void setDownloadOPath(String downloadOPath) {
        this.downloadOPath = downloadOPath;
    }

    @Override
    public String toString() {
        return "Database{" +
                "id=" + id +
                ", dataId='" + dataId + '\'' +
                ", dataName='" + dataName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", createDate=" + createDate +
                ", stateAnalyze=" + stateAnalyze +
                ", anDate=" + anDate +
                ", stateForecast=" + stateForecast +
                ", foDate=" + foDate +
                ", downloadOPath='" + downloadOPath + '\'' +
                '}';
    }
}