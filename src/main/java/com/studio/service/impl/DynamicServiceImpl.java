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
    @Override
    public List<Dynamic> findByTid(Dynamic dynamic) {
        return null;
    }

    @Override
    public List<Dynamic> findByUid(Dynamic dynamic) {
        return null;
    }

    @Override
    public boolean saveDynamic(Dynamic dynamic) {
        return false;
    }

    @Override
    public boolean deleDynamic(Dynamic dynamic) {
        return false;
    }
}
