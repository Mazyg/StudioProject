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
    public Integer findCountInfo() {
        return infoDao.findCountInfo();
    }

    @Override
    public Integer findCountInfoByType(String info_type) {
        return infoDao.findCountInfoByType(info_type);
    }

    @Override
    public List<Info> findAllInfo(Info info) {
        return null;
    }

    @Override
    public Info findById(String info_id) {
        return infoDao.findById(info_id);
    }

    @Override
    public Info findByTitle(String title) {
        return infoDao.findInfoByTitle(title);
    }


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
    public List<Info> showAll(String keyword, int start, int length) {
        return infoDao.showAll(keyword,start,length);
    }

    @Override
 
    public int countBytype(String info_type) {
        return infoDao.countByType(info_type);
}

    @Override
    public int countAll(String keyword) {
        return infoDao.countAll(keyword);
    }

    @Override
    public List<Info> findAll(String keyword) {
        return infoDao.findAll(keyword);
    }

    @Override
    public List<Info> findMovies() {
        return infoDao.findMovie();
    }

    @Override
    public List<Info> findBooks() {
        return infoDao.findBook();
    }
}
