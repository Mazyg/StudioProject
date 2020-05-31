package com.studio.service;

import com.studio.domian.*;

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
    public List<Info> findInfoBytype(String info_type, int start, int length);

    //全局模糊查询分页显示
    public List<Info> showAll(String keyword, int start, int length);

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

    /**
     * 插入点赞记录
     *
     * @param niceDetail
     * @return
     */
    public Integer insertNiceDetail(String uid,String infoId);

    /**
     * 删除点赞记录
     *
     * @param id
     * @return
     */
    public Integer deleteNiceDetail(String id);


    /**
     * 根据用户id和文章id信息查询点赞记录
     *
     * @param
     * @return
     */
   public NiceDetail findNiceDetail(String uid,String infoId);

    public boolean delWords(String lw_id);

    public boolean delReply(String lr_for_words);

    public boolean delReply2(String lr_id);

    /**
     * 插入点赞记录
     *
     * @param
     * @return
     */
    public Integer insertCollect(String uid,String infoId);

    /**
     * 删除点赞记录
     *
     * @param id
     * @return
     */
    public Integer deleteCollect(String id);


    /**
     * 根据用户id和文章id信息查询点赞记录
     *
     * @param
     * @return
     */
    public Collect findCollect(String uid, String infoId);

}
