package com.studio.service;


import com.studio.domian.Dynamic;

import java.util.List;

public interface DynamicService {
    public List<Dynamic> findByTid(String tid);

    public List<Dynamic> findByUid(Dynamic dynamic);

    public boolean saveDynamic(Dynamic dynamic);

    public boolean deleDynamic(Dynamic dynamic);

}
