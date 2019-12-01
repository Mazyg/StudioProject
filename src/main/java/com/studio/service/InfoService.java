package com.studio.service;

import com.studio.domian.Info;

import java.util.List;

public interface InfoService {

    public List<Info> findAllInfo(Info info);
    public Info findById(String info_id);
    public List<Info> findByTitle(Info info);

    public boolean deleteInfo(String info_id);

    public boolean updateInfo(Info info);

    public boolean addInfo(Info info);

    public List<Info> findAllInfo();

    //查询榜样的力量的信息，并按时间降序排列
    public List<Info> findInfoBytype(String info_type,Integer limit);
}
