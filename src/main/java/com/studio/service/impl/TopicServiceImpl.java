package com.studio.service.impl;

import com.studio.dao.TopicDao;
import com.studio.domian.Topic;
import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("topicService")
public class TopicServiceImpl implements TopicService {

    @Autowired
    private TopicDao topicDao;

    @Override
    public boolean saveTopic() {
        return false;
    }

    @Override
    public boolean deleTopic() {
        return false;
    }

    @Override
    public List<Topic> findAll() {
        return null;
    }

    @Override
    public List<Topic> findAllByUid(Topic topic) {
        return null;
    }

    @Override
    public List<Topic> findByContent(Topic topic) {
        return null;
    }
}
