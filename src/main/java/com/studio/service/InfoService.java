package com.studio.service;

import com.studio.domian.Info;
import com.studio.domian.Topic;

import java.util.List;

public interface InfoService {

    public List<Info> findAllInfo(Info info);
    public Info findById(String info_id);
    public List<Info> findByTitle(Info info);

    public boolean deleteInfo(String info_id);

    public boolean updateInfo(Info info);

    public boolean addInfo(Info info);

    public List<Info> findAllInfo();

//首页信息显示，对info表的操作
    public List<Info> findInfoBytype(String info_type,int start,int length);
}
