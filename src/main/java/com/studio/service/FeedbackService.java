package com.studio.service;

import com.studio.domian.Feedback;

import java.util.List;

public interface FeedbackService {
    public boolean addFeedback(Feedback feedback);

    List<Feedback> getAllFeedback();
}
