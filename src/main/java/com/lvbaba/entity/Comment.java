package com.lvbaba.entity;


public class Comment {

  private long commentId;
  private long uId;
  private long productId;
  private String content;
  private double score;

  public long getCommentId() {
    return commentId;
  }

  public void setCommentId(long commentId) {
    this.commentId = commentId;
  }

  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
  }

  public long getProductId() {
    return productId;
  }

  public void setProductId(long productId) {
    this.productId = productId;
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
            "commentId=" + commentId +
            ", uId=" + uId +
            ", productId=" + productId +
            ", content='" + content + '\'' +
            ", score=" + score +
            '}';
  }
}
