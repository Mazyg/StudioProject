package com.studio.dao;

import com.studio.domian.Topic;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicDao {

    /*保存用户话题*/
    @Insert("insert into topic (date,t_title,content,uid) \n" +
            "VALUES('${date}','${t_title}','${content}','${uid}')")
    public boolean saveTopic(Topic topic);

    /*保存管理员话题*/
    @Insert("insert into topic (date,t_title,content,t_tatus,uid) \n" +
            "VALUES('${date}','${t_title}','${content}','已审核','${uid}')")
    public boolean saveTopicA(Topic topic);

    @Delete("delete from topic where tid=#{tid}")
    public boolean deleTopic(String tid);

    /*查看全部话题*/
    @Select("select * from topic")
    public List<Topic> findAllTopic();

    /*未审核话题*/
    @Select("select * from topic where t_tatus='未审核'")
    public List<Topic> findAllByStatus();

    public List<Topic> findAllByUid(Topic topic);

    /**
     * 根据title查找话题
     * @param t_title
     * @return
     */
    @Select("select * from topic where t_title=#{t_title}")
    public List<Topic> findByTitle(String t_title);

    /**
     * 通过标题查询未审核话题
     * @param t_title
     * @return
     */
    @Select("select * from topic where t_title= #{t_title} and t_tatus='未审核'")
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
    @Select("select * from topic where tid=#{tid}")
    public Topic findTopicById(String tid);
}
