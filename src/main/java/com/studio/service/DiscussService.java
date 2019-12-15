package com.studio.service;

import com.studio.domian.Discuss;

import java.util.List;

public interface DiscussService {
    public List<Discuss> findByInfo_id(String info_id);

    public boolean saveDynamic(String uid,String content,String info_id);
}
