package com.studio.service;

import com.studio.domian.Info;
import com.studio.domian.Reply;
import com.studio.domian.Words;

import java.util.List;

public interface InfoService {

    public Integer findCountInfo();

    public Integer findCountInfoByType(String info_type);

    public List<Info> findAllInfo(Info info);

    public Info findById(String info_id);

    public Info findByTitle(String title);

    public boolean deleteInfo(String info_id);

    public boolean updateInfo(Info info);

    public boolean addInfo(Info info);

    public List<Info> findAllInfo();
 
    //首页信息显示，对info表的操作
    public List<Info> findInfoBytype(String info_type,int start,int length);

    //全局模糊查询分页显示
    public List<Info> showAll(String keyword,int start,int length);
 
    //根据类别查询信息数量
    public int countBytype(String info_type);

    //全局模糊查询信息数量
    public int countAll(String keyword);

    //全局模糊查询
    public List<Info> findAll(String keyword);

    public List<Info> findMovies();

    public List<Info> findBooks();

    void saveWords(Words words);

    void saveReply(Reply reply);

    List<Words> findByWords();

    List<Reply> findByReply();
 
 
}
