package com.studio.dao;

import com.studio.domian.Dynamic;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DynamicDao {

    @Select("select * from dynamic where tid = #{tid}")
    public List<Dynamic> findByTid(String tid);

    public List<Dynamic> findByUid(Dynamic dynamic);


    @Insert("insert into dynamic(date,content,uname,tid) values('${date}','${content}','${uname}','${tid}')")
    public boolean saveDynamic(Dynamic dynamic);

    @Delete("delete from dynamic where wid=#{wid} ")
    public boolean deleteDynamic(Integer wid);
}
