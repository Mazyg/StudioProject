package com.studio.dao;
import com.studio.domian.Topic;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicDao {

    /*保存用户话题*/
    @Insert("insert into topic (date,t_title,content,uname,t_type,view_count) \n" +
            "VALUES('${date}','${t_title}','${content}','${uname}','${t_type}','${view_count}')")
    public boolean saveTopic(Topic topic);

    /*保存管理员话题*/
    @Insert("insert into topic (date,t_title,content,t_tatus,uname,t_type) \n" +
            "VALUES('${date}','${t_title}','${content}','已审核','${uname}','${t_type}')")
    public boolean saveTopicA(Topic topic);

    @Delete("delete from topic where tid=#{tid}")
    public boolean deleTopic(String tid);

    @Update("update topic set view_count=#{view_count} where tid=#{tid}")
    public boolean updateCount(Topic topic);

    /*查看全部话题*/
    @Select("select * from topic")
    public List<Topic> findAllTopic();

    @Select("select count(*) from topic")
    public Integer findCountTopic();

    @Select("select count(*) from topic where t_tatus=#{t_tatus}")
    public Integer findCountNo(String t_tatus);

    /*未审核话题*/
    @Select("select * from topic where t_tatus='未审核'")
    public List<Topic> findAllByStatus();

    @Select("select * from topic where uid = #{uid}")
    public List<Topic> findAllByUid(Integer uid);

    @Select("select * from topic where t_tatus= '已审核' ")
    public List<Topic> findCheckTopic();
    /**
     * 通过用户名查询用户发布的话题
     * @param uname
     * @return
     */
    @Select("select * from topic where uname = #{uname}")
    public List<Topic> findAllByUname(String uname);

    /**
     * 根据title查找话题
     * @param t_title
     * @return
     */
    @Select("select * from topic where t_title like CONCAT('%',#{t_title},'%')")
    public List<Topic> findByTitle(String t_title);

    /**
     * 通过标题查询未审核话题
     * @param t_title
     * @return
     */
    @Select("select * from topic where t_title like CONCAT('%',#{t_title},'%') and t_tatus='未审核'")
    public List<Topic> findByTitleNot(String t_title);

    /**
     * 审核动态
     * @param tid
     * @return
     */
    @Update("update topic set t_tatus= '已审核' where tid=#{tid}")
    public boolean updateStatus(String tid);

    /**
     * 通过id寻找话题
     * @param tid
     * @return
     */
    @Select("select tid,date_format(date ,'%Y-%m-%d' ) date,t_title,content,t_tatus,uname,t_type,view_count from topic where tid=#{tid}")
    public Topic findTopicById(String tid);

    /**
     * 话题查询，按照时间排序，取N条
     *
     */
    @Select(" select tid,date_format(date ,'%Y-%m-%d' ) date,t_title,content,t_tatus,uname,t_type,view_count\n" +
            " from  topic\n" +
            " where t_tatus='已审核'\n" +
            " order by date desc "
            +"limit #{start},#{length}")
    public List<Topic> findTopic(@Param("start") int start, @Param("length") int length);

    @Select("select count(1) from topic where uname=#{uname} ")
    int countUserTopic(String uname);

   @Select("select count(1) FROM dynamic where tid in(\n" +
           "     select tid FROM topic WHERE uname=#{uname})\n" +
           "     and uname!=#{uname}")
    int countUserReply(String uname);
}
