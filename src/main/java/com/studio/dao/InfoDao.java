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

    //查询榜样的力量的信息，并按时间降序排列取前三条
    @Select("SELECT  info_id,title,introduce,content,date_format(date ,'%Y-%m-%d' ) date,info_type,photo\n" +
            "FROM `info`\n" +
            "where info_type like #{info_type}\n"+
            "order by date desc\n"+"limit #{start},#{length}")
    public List<Info> findInfoBytype( @Param("info_type") String info_type,@Param("start") int start,@Param("length") int length);

    //增加信息
    @Insert("insert into info(title,content,info_type,photo,date,introduce) values('${title}','${content}','${info_type}','${photo}','${date}','${introduce}')")
    public boolean addInfo(Info info);

    public List<Info> findAllByType(Info info);

    //根据id查询信息
    @Select("select * from info where info_id=#{info_id}")
    public Info findById(String info_id);

    public List<Info> findByTitle(Info info);

    @Delete("delete from info where info_id=#{info_id}")
    public boolean deleteInfo(String info_id);

    @Update("update info set title=#{title} , content=#{content} , info_type=#{info_type} , photo=#{photo} , introduce=#{introduce} where info_id=#{info_id}")
    public boolean updateInfo(Info info);
}
