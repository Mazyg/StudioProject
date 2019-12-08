package com.studio.dao;

import com.studio.domian.Dynamic;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DynamicDao {

    @Select("select * from dynamic where tid = #{tid}")
    public List<Dynamic> findByTid(String tid);

    public List<Dynamic> findByUid(Dynamic dynamic);

    public boolean saveDynamic(Dynamic dynamic);

    public boolean deleDynamic(Dynamic dynamic);
}
