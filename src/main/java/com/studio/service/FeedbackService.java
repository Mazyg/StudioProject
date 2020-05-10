package com.studio.service;

import com.studio.domian.Feedback;

import java.util.List;

public interface FeedbackService {
    boolean addFeedback(Feedback feedback);

    List<Feedback> getAllFeedback();

    Feedback findById(Integer fid);
}
