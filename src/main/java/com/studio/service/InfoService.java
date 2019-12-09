package com.studio.service;

import com.studio.domian.Info;

import java.util.List;

public interface InfoService {

    public List<Info> findAllInfo(Info info);

    public Info findById(String info_id);

    public Info findByTitle(String title);

    public boolean deleteInfo(String info_id);

    public boolean updateInfo(Info info);

    public boolean addInfo(Info info);

    public List<Info> findAllInfo();
 
//首页信息显示，对info表的操作
    public List<Info> findInfoBytype(String info_type,int start,int length);
 
    //根据类别查询信息数量
    public int countBytype(String info_type);
 

    public List<Info> findMovies();

    public List<Info> findBooks();
 
 
}
