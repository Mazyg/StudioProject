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
        return false;
    }

    @Override
    public boolean deleComment(Comment comment) {
        return false;
    }

    @Override
    public List<Comment> findByWid(Comment comment) {
        return null;
    }
}
