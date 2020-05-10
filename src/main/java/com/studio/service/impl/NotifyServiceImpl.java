package com.studio.service.impl;

import com.studio.dao.NotifyDao;
import com.studio.domian.Notify;
import com.studio.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("notifyService")
public class NotifyServiceImpl implements NotifyService {

    @Autowired
    private NotifyDao notifyDao;

    @Override
    public boolean addNotify(Notify notify) {
        return notifyDao.addNotify(notify);
    }

    @Override
    public List<Notify> getUserNotify(Integer uid) {
        return notifyDao.getUserNotify(uid);
    }
}
