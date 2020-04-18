package com.studio.service.impl;

import com.studio.dao.DynamicDao;
import com.studio.domian.Dynamic;
import com.studio.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dynamicService")
public class DynamicServiceImpl implements DynamicService {

    @Autowired
    private DynamicDao dynamicDao;



    public List<Dynamic> findByTid(String tid) {
        return dynamicDao.findByTid(tid);
    }

    @Override
    public List<Dynamic> findByUname(String uname) {
        return dynamicDao.findByUname(uname);
    }

    @Override
    public boolean saveDynamic(Dynamic dynamic) {
        return dynamicDao.saveDynamic(dynamic);
    }

    @Override
    public boolean deleteDynamic(Integer wid) {
        return dynamicDao.deleteDynamic(wid);
    }

    @Override
    public Integer findTidByWid(Integer wid) {
        return dynamicDao.findTidByWid(wid);
    }
}
