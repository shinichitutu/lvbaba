package com.lvbaba.entity;

/**
 * @author DBY
 * @date 2020/11/2 13:40
 */
public class Files {
    private Long fileId;
    private String filePath;
    private Long productId;

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Files{" +
                "fileId=" + fileId +
                ", filePath='" + filePath + '\'' +
                ", productId=" + productId +
                '}';
    }
}
