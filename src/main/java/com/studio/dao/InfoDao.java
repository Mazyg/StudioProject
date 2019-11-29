package com.studio.dao;

import com.studio.domian.Info;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoDao {

    //查询所有信息
    @Select("select * from info ")
    public List<Info> findAllInfo();

    //增加信息
    @Insert("insert into info(title,content,info_type,photo,date) values('${title}','${content}','${info_type}','${photo}','${date}')")
    public boolean addInfo(Info info);

    public List<Info> findAllByType(Info info);

    //根据id查询信息
    @Select("select * from info where info_id=#{info_id}")
    public Info findById(String info_id);

    public List<Info> findByTitle(Info info);

    @Delete("delete from info where info_id=#{info_id}")
    public boolean deleteInfo(String info_id);

    @Update("update info set title=#{title} , content=#{content} , info_type=#{info_type} , photo=#{photo} where info_id=#{info_id}")
    public boolean updateInfo(Info info);
}
