package com.studio.dao;

import com.studio.domian.Notify;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotifyDao {

    @Insert("insert into notify(content,receiver) values('${content}', '${receiver}')")
    public boolean addNotify(Notify notify);

    @Select("select content from notify where receiver = #{uid} ")
    public List<Notify> getUserNotify(Integer uid);
}
