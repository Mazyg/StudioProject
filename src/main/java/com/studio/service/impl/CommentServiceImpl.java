package com.studio.service.impl;

import com.studio.dao.CommentDao;
import com.studio.domian.Comment;
import com.studio.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;
    @Override
    public boolean saveComment(Comment comment) {
        return commentDao.saveComment(comment);
    }

    @Override
    public boolean deleteComment(Integer cid) {
        return commentDao.deleteComment(cid);
    }

    @Override
    public List<Comment> findByWid(Integer wid) {
        return commentDao.findByWid(wid);
    }


}
