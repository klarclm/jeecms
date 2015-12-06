package com.jeecms.cms.m_entity;

public class jcfile {
    private String filePath;

    private String fileName;

    private Boolean fileIsvalid;

    private Integer contentId;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public Boolean getFileIsvalid() {
        return fileIsvalid;
    }

    public void setFileIsvalid(Boolean fileIsvalid) {
        this.fileIsvalid = fileIsvalid;
    }

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }
}