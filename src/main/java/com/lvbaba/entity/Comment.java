package com.lvbaba.entity;


public class Comment {

  private long cId;
  private long uId;
  private long pId;
  private String content;
  private double score;

  public Comment(long cId, long uId, long pId, String content, double score) {
    this.cId = cId;
    this.uId = uId;
    this.pId = pId;
    this.content = content;
    this.score = score;
  }

  public Comment() {
  }

  public long getcId() {
    return cId;
  }

  public void setcId(long cId) {
    this.cId = cId;
  }

  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
  }

  public long getpId() {
    return pId;
  }

  public void setpId(long pId) {
    this.pId = pId;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public double getScore() {
    return score;
  }

  public void setScore(double score) {
    this.score = score;
  }

  @Override
  public String toString() {
    return "Comment{" +
            "cId=" + cId +
            ", uId=" + uId +
            ", pId=" + pId +
            ", content='" + content + '\'' +
            ", score=" + score +
            '}';
  }
}
