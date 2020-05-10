package com.studio.service.impl;

import com.studio.dao.FeedbackDao;
import com.studio.domian.Feedback;
import com.studio.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackDao feedbackDao;

    @Override
    public boolean addFeedback(Feedback feedback) {
        return feedbackDao.addFeedBack(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        return feedbackDao.getAllFeedback();
    }

    @Override
    public Feedback findById(Integer fid) {
        return feedbackDao.findById(fid);
    }
}
