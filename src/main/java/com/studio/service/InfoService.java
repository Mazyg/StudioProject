package com.studio.service;

import com.studio.domian.Info;

import java.util.List;

public interface InfoService {

    public List<Info> findAllInfo(Info info);
    public List<Info> findById(Info info);
    public List<Info> findByTitle(Info info);
    public boolean saveInfo(Info info);
    public boolean deleInfo(Info info);
    public boolean updateInfo(Info info);

    public boolean addInfo(Info info);

    public List<Info> findAllInfo();
}
