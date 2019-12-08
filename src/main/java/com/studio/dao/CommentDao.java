package com.studio.dao;

import com.studio.domian.Comment;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    public boolean saveComment(Comment comment);

    public boolean deleComment(Comment comment);

    @Select("select * from comment where wid=#{wid}")
    public List<Comment> findByWid(Integer wid);


}
