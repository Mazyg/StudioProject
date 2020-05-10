package com.studio.service;

import com.studio.domian.Notify;

import java.util.List;

public interface NotifyService {

    public boolean addNotify(Notify notify);

    public List<Notify> getUserNotify(Integer uid);
}
