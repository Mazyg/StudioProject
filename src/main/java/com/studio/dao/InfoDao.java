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

    /**
     * 查询信息总数
     * @return
     */
    @Select("select count(*) from info ")
    public Integer findCountInfo();

    /**
     * 查询不同类别信息数量
     * @param info_type
     * @return
     */
    @Select("select count(*) from info where info_type=#{info_type} ")
    public Integer findCountInfoByType(String info_type);

    //全局模糊查询
    @Select("select *\n" +
            "from info\n" +
            "where title like #{keyword}\n" +
            "or info_type like #{keyword}\n" +
            "or introduce like #{keyword}\n" +
            "or content like #{keyword}")
    public List<Info> findAll(String keyword);

    //全局模糊查询结果分页显示
    @Select("SELECT  info_id,title,introduce,content,date_format(date ,'%Y-%m-%d' ) date,info_type,photo\n" +
            "FROM `info`\n" +
            "where title like #{keyword}\n" +
            "or info_type like #{keyword}\n" +
            "or introduce like #{keyword}\n" +
            "or content like #{keyword}\n"+
            "order by date desc\n"+"limit #{start},#{length}")
    public List<Info> showAll( @Param("keyword") String keyword,@Param("start") int start,@Param("length") int length);


    //查询榜样的力量的信息，并按时间降序排列取前三条
    @Select("SELECT  info_id,title,introduce,content,date_format(date ,'%Y-%m-%d' ) date,info_type,photo\n" +
            "FROM `info`\n" +
            "where info_type like #{info_type}\n"+
            "order by date desc\n"+"limit #{start},#{length}")
    public List<Info> findInfoBytype( @Param("info_type") String info_type,@Param("start") int start,@Param("length") int length);

    //查询电影
    @Select("select * from info where info_type='电影'")
    public List<Info> findMovie();

    //查询书籍
    @Select("select * from info where info_type='书籍'")
    public List<Info> findBook();
    //增加信息
    @Insert("insert into info(title,content,info_type,photo,date,introduce,video) values('${title}','${content}','${info_type}','${photo}','${date}','${introduce}','${video}')")
    public boolean addInfo(Info info);

    public List<Info> findAllByType(Info info);

    //根据id查询信息
    @Select("select * from info where info_id=#{info_id}")
    public Info findById(String info_id);

 
    //根据类别查询信息的数量
    @Select("SELECT count(*) FROM `info`\n" +
            "where info_type like #{info_type}")
    public int countByType(String info_type);

    //全局模糊查询信息的数量
    @Select("SELECT count(*) FROM `info`\n" +
            "where title like #{keyword}\n" +
            "or info_type like #{keyword}\n" +
            "or introduce like #{keyword}\n" +
            "or content like #{keyword}")
    public int countAll(String keyword);
  
    //根据title查询信息
    @Select("select * from info where title=#{title}")
    public Info findInfoByTitle(String title);


    public List<Info> findByTitle(Info info);

    @Delete("delete from info where info_id=#{info_id}")
    public boolean deleteInfo(String info_id);

    @Update("update info set title=#{title} , content=#{content} , info_type=#{info_type} , photo=#{photo} , introduce=#{introduce} , video=#{video} where info_id=#{info_id}")
    public boolean updateInfo(Info info);
}
