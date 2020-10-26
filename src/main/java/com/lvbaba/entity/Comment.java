package com.lvbaba.entity;


public class Comment {

  private long commentId;
  private long userId;
  private long productId;
  private String content;
  private double score;

  public Comment(long commentId, long userId, long productId, String content, double score) {
    this.commentId = commentId;
    this.userId = userId;
    this.productId = productId;
    this.content = content;
    this.score = score;
  }

  public Comment() {
  }

  public long getCommentId() {
    return commentId;
  }

  public void setCommentId(long commentId) {
    this.commentId = commentId;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
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
}
