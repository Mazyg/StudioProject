package com.studio.dao;

import com.studio.domian.Notify;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotifyDao {

    @Insert("insert into notify(content,receiver,fid) values('${content}', '${receiver}' , '${fid}')")
    public boolean addNotify(Notify notify);

    @Select("select * from notify where receiver = #{uid} ")
    public List<Notify> getUserNotify(Integer uid);
}
