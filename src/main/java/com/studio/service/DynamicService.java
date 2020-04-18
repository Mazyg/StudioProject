package com.studio.service;


import com.studio.domian.Dynamic;

import java.util.List;

public interface DynamicService {
    public List<Dynamic> findByTid(String tid);

    public List<Dynamic> findByUname(String uname);

    public boolean saveDynamic(Dynamic dynamic);

    public boolean deleteDynamic(Integer wid);

    Integer findTidByWid(Integer wid);
}
