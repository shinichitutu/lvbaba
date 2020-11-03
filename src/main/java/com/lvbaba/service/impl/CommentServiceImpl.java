package com.lvbaba.service.impl;

import com.lvbaba.dao.CommentDao;
import com.lvbaba.entity.Comment;
import com.lvbaba.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/3.
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService{
    @Resource
    private CommentDao commentDao;
    @Override
    public boolean insertCommentByUid(Comment comment) {
        return commentDao.insertCommentByUid(comment);
    }

    @Override
    public boolean updateCommentById(Comment comment) {
        return commentDao.updateCommentById(comment);
    }

    @Override
    public boolean deleteCommentById(Comment comment) {
        return commentDao.deleteCommentById(comment);
    }

    @Override
    public List<Comment> queryCommentByUidAndPid(Comment comment) {
        return commentDao.queryCommentByUidAndPid(comment);
    }
}
