package com.studio.service;

import com.studio.domian.Topic;

import java.util.List;

public interface TopicService {
    public boolean saveTopic(Topic topic);

    public boolean saveTopicA(Topic topic);

    public boolean deleTopic(String tid);

    public List<Topic> findAllTopic();

    public List<Topic> findAllByStatus();

    public List<Topic> findAllByUid(Topic topic);

    public List<Topic> findByTitle(String t_title);

    public List<Topic> findByTitleNot(String t_title);

    public boolean updateStatus(String tid);

    public Topic findTopicById(String tid);
}
