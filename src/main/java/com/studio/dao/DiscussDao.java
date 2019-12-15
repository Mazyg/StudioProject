package com.studio.dao;

import com.studio.domian.Discuss;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscussDao {
    @Select("SELECT did,a.uid,content,info_id,date_format(date,'%Y-%m-%d %h:%i') date,uname,photo\n" +
            "FROM discuss a,user b\n" +
            "where a.uid=b.uid and info_id=#{info_id}")
    public List<Discuss> findByInfo_id(String info_id);

    @Insert("insert into discuss(uid,content,info_id,date)\n" +
            "VALUES(#{uid},#{content},#{info_id},NOW())")
    public boolean saveDynamic(@Param("uid") String uid,@Param("content") String content,@Param("info_id") String info_id);
}
