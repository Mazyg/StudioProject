package com.studio.service;

import com.studio.domian.Topic;

import java.util.List;

public interface TopicService {
    public boolean saveTopic();

    public boolean deleTopic();

    public List<Topic> findAll();

    public List<Topic> findAllByUid(Topic topic);

    public List<Topic> findByContent(Topic topic);
}
