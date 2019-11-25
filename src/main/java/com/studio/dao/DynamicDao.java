package com.studio.dao;

import com.studio.domian.Dynamic;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DynamicDao {

    public List<Dynamic> findByTid(Dynamic dynamic);

    public List<Dynamic> findByUid(Dynamic dynamic);

    public boolean saveDynamic(Dynamic dynamic);

    public boolean deleDynamic(Dynamic dynamic);
}
