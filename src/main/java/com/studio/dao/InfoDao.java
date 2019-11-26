package com.studio.dao;

import com.studio.domian.Info;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoDao {

    @Select("select * from info ")
   /* @Results(id = "infoMap",
            value = {
                    @Result(id=true,column = "info_id",property = "infoId"),
                    @Result(column = "info_type",property = "type")
            }
    )*/
    public List<Info> findAllInfo();
    @Insert("insert into info(title,content,info_type,photo,date) values('${title}','${content}','${info_type}','${photo}','${date}')")
   /* @ResultMap("infoMap")*/
    public boolean addInfo(Info info);

    public List<Info> findAllByType(Info info);
    public List<Info> findById(Info info);
    public List<Info> findByTitle(Info info);
    public boolean saveInfo(Info info);
    public boolean deleInfo(Info info);
    public boolean updateInfo(Info info);
}
