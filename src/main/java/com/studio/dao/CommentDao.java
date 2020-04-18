package com.studio.dao;

import com.studio.domian.Comment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    @Insert("insert into comment(date,uname,rname,wid,content) " +
            "values('${date}','${uname}','${rname}','${wid}','${content}')")
    public boolean saveComment(Comment comment);

    @Delete("delete from comment where cid=#{cid}")
    public boolean deleteComment(Integer cid);

    @Select("select * from comment where wid=#{wid}")
    public List<Comment> findByWid(Integer wid);

    @Select("select count(1) from comment where rname =#{uname}")
    public int countUserComment(String uname);

    @Select("select * from comment where rname=#{uname}")
    public List<Comment> findByUname(String uname);
}
