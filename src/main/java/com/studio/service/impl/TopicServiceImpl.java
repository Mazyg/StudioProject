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
    public Integer findCountTopic() {
        return topicDao.findCountTopic();
    }

    @Override
    public Integer findCountNo() {
        return topicDao.findCountNo();
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
    public List<Topic> findAllByUid(Integer uid) {
        return topicDao.findAllByUid(uid);
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



    public boolean updateStatus(String tid) {
        return topicDao.updateStatus(tid);
    }

    @Override
    public Topic findTopicById(String tid) {
        return topicDao.findTopicById(tid);
    }

    @Override
    public List<Topic> findAllByUname(String uname) {
        return topicDao.findAllByUname(uname);
    }

    @Override
    public List<Topic> findCheckTopic() {
        return topicDao.findCheckTopic();
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
