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
    public boolean saveTopic(Topic topic) {
        return topicDao.saveTopic(topic);
    }

    @Override
    public boolean saveTopicA(Topic topic) {
        return topicDao.saveTopicA(topic);
    }

    @Override
    public boolean deleTopic(String tid) {

        return topicDao.deleTopic(tid);
    }

    @Override
    public List<Topic> findAllTopic() {
        return topicDao.findAllTopic();
    }

    @Override
    public List<Topic> findAllByStatus() {
        return topicDao.findAllByStatus();
    }

    @Override
    public List<Topic> findAllByUid(Topic topic) {
        return null;
    }

    @Override
    public List<Topic> findByTitle(String t_title) {
        return topicDao.findByTitle(t_title);
    }

    /**
     * 通过标题查询未审核话题
     * @param t_title
     * @return
     */
    public List<Topic> findByTitleNot(String t_title){
        return  topicDao.findByTitleNot(t_title);
    }


    @Override
    public boolean updateStatus(String tid) {
        return topicDao.updateStatus(tid);
    }

    @Override
    public Topic findTopicById(String tid) {
        return topicDao.findTopicById(tid);
    }

    /**
     * 话题查询，按照时间排序，取N条
     * @param start
     * @param length
     * @return
     */
    @Override
    public List<Topic> findTopic(int start, int length) {
        return topicDao.findTopic(start,length);
    }
}
