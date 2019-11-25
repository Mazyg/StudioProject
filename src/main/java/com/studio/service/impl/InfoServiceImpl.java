package com.studio.service.impl;

import com.studio.dao.InfoDao;
import com.studio.domian.Info;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("infoService")
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoDao infoDao;

    @Override
    public List<Info> findAllByType(Info info) {
        return null;
    }

    @Override
    public List<Info> findById(Info info) {
        return null;
    }

    @Override
    public List<Info> findByTitle(Info info) {
        return null;
    }

    @Override
    public boolean saveInfo(Info info) {
        return false;
    }

    @Override
    public boolean deleInfo(Info info) {
        return false;
    }

    @Override
    public boolean updateInfo(Info info) {
        return false;
    }
}
