package com.studio.service;

import com.studio.domian.Comment;

import java.util.List;

public interface CommentService {
    public boolean saveComment(Comment comment);

    public boolean deleComment(Comment comment);

    public List<Comment> findByWid(Integer wid);
}

