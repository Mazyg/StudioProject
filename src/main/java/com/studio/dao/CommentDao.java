package com.studio.dao;

import com.studio.domian.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    public boolean saveComment(Comment comment);

    public boolean deleComment(Comment comment);

    public List<Comment> findByWid(Comment comment);


}
