package com.lvbaba.service;

import com.lvbaba.entity.Comment;

import java.util.List;

/**
 * Created by YY on 2020/11/3.
 */
public interface CommentService {
    /**
     * 向comment表中插入数据
     * @param comment
     * @return
     */
    boolean insertCommentByUid(Comment comment);

    /**
     * 通过具体的评论的id修改评论内容
     * @param comment
     * @return
     */
    boolean updateCommentById(Comment comment);

    /**
     * 通过具体的评论id删除评论
     * @param comment
     * @return
     */
    boolean deleteCommentById(Comment comment);

    /**
     * 通过用户的ID和产品ID查询返回所有的评论
     * @param comment
     * @return
     */
    List<Comment> queryCommentByUidAndPid(Comment comment);
}
