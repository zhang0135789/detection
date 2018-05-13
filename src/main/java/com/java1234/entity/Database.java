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
    private String fileName; //�ļ�����
    private String filePath; // �����ļ�·��
    private Date createDate; // �ɼ�����ʱ��
    private Integer stateAnalyze; // ����״̬
    private Date anDate; // ����ʱ��
    private String anResult; //�������
    private Integer stateForecast; // Ԥ��״̬
    private Date foDate; //Ԥ��ʱ��
    private String foResult; //Ԥ����
    private String downloadPath; //����·��

    @Override
    public String toString() {
        return "Database{" +
                "id=" + id +
                ", dataId='" + dataId + '\'' +
                ", dataName='" + dataName + '\'' +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", createDate=" + createDate +
                ", stateAnalyze=" + stateAnalyze +
                ", anDate=" + anDate +
                ", anResult='" + anResult + '\'' +
                ", stateForecast=" + stateForecast +
                ", foDate=" + foDate +
                ", foResult='" + foResult + '\'' +
                ", downloadPath='" + downloadPath + '\'' +
                '}';
    }

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

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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

    public String getAnResult() {
        return anResult;
    }

    public void setAnResult(String anResult) {
        this.anResult = anResult;
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

    public String getFoResult() {
        return foResult;
    }

    public void setFoResult(String foResult) {
        this.foResult = foResult;
    }

    public String getDownloadPath() {
        return downloadPath;
    }

    public void setDownloadPath(String downloadPath) {
        this.downloadPath = downloadPath;
    }
}

