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
    public List<Info> findAllInfo(Info info) {
        return null;
    }

    @Override
    public Info findById(String info_id) {
        return infoDao.findById(info_id);
    }

    @Override
    public List<Info> findByTitle(Info info) {
        return null;
    }



    @Override
    public boolean deleteInfo(String info_id) {
        return infoDao.deleteInfo(info_id);
    }

    @Override
    public boolean updateInfo(Info info) {
        return infoDao.updateInfo(info);
    }

    @Override
    public boolean addInfo(Info info) {
        return infoDao.addInfo(info);
    }

    @Override
    public List<Info> findAllInfo() {
        return infoDao.findAllInfo();
    }

    @Override
 
    public List<Info> findInfoBytype(String info_type,int start,int length) {
        return  infoDao.findInfoBytype(info_type,start,length);
 
    }

    @Override
    public int countBytype(String info_type) {
        return infoDao.countByType(info_type);
    }
}
