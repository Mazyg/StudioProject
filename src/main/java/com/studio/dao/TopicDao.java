package com.studio.dao;

import com.studio.domian.Topic;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicDao {

    public boolean saveTopic();

    public boolean deleTopic();

    public List<Topic> findAll();

    public List<Topic> findAllByUid(Topic topic);

    public List<Topic> findByContent(Topic topic);
}
