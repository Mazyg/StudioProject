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
}
