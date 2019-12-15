package com.studio.service.impl;

import com.studio.dao.DiscussDao;
import com.studio.domian.Discuss;
import com.studio.service.DiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("discussService")
public class DiscussServiceImple implements DiscussService {
    @Autowired
    private DiscussDao discussDao;
    @Override
    public List<Discuss> findByInfo_id(String info_id) {
        return discussDao.findByInfo_id(info_id);
    }

    @Override
    public boolean saveDynamic(String uid, String content, String info_id) {
        return discussDao.saveDynamic(uid,content,info_id);
    }
}
