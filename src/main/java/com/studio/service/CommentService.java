package com.studio.service;

import com.studio.domian.Comment;

import java.util.List;

public interface CommentService {
    public boolean saveComment(Comment comment);

    public boolean deleteComment(Integer cid);

    public List<Comment> findByWid(Integer wid);

    public int countUserReply(String uname);

    public List<Comment> findByUname(String uname);
}

