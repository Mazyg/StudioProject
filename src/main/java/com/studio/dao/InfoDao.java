package com.studio.dao;

import com.studio.domian.Info;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoDao {

    public List<Info> findAllByType(Info info);
    public List<Info> findById(Info info);
    public List<Info> findByTitle(Info info);
    public boolean saveInfo(Info info);
    public boolean deleInfo(Info info);
    public boolean updateInfo(Info info);
}
