package com.studio.service;

import com.studio.domian.Topic;

import java.util.List;

public interface TopicService {
    public boolean saveTopic(Topic topic);

    public Integer findCountTopic();

    public Integer findCountNo(String t_tatus);

    public boolean saveTopicA(Topic topic);

    public boolean deleTopic(String tid);

    public List<Topic> findAllTopic();

    public List<Topic> findAllByStatus();

    public List<Topic> findAllByUid(Integer uid);

    public List<Topic> findByTitle(String t_title);

    public List<Topic> findByTitleNot(String t_title);

    public boolean updateStatus(String tid);

    public boolean updateStatusNot(Topic topic);

    public Topic findTopicById(String tid);

    public List<Topic> findAllByUname(String uname);

    public List<Topic> findCheckTopic();

    //话题查询，按照时间排序，取N条
    public List<Topic> findTopic(int start, int length);

    boolean updateCount(Topic topic);

    int countUserTopic(String uname);

    int countUserReply(String uname);

    String findTypeById(Integer tid);
}
