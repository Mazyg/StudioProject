package com.studio.service.impl;

import com.studio.dao.InfoDao;
import com.studio.domian.*;
import com.studio.service.InfoService;
import com.studio.utils.JedisClientSingle;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Service("infoService")
public class InfoServiceImpl implements InfoService {

    GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
    JedisPool jedisPool = new JedisPool(poolConfig, "111.229.25.156", 6379,1000,"mn123456");
    Jedis jedis = jedisPool.getResource();
    @Autowired
    private InfoDao infoDao;

    @Autowired
    private RedisTemplate redisTemplate;


    private JedisClientSingle jedisClient = new JedisClientSingle();


    @Override
    public Integer findCountInfo() {
        return infoDao.findCountInfo();
    }

    @Override
    public Integer findCountInfoByType(String info_type) {
        return infoDao.findCountInfoByType(info_type);
    }

    @Override
    public List<Info> findAllInfo(Info info) {
        return null;
    }

    @Override
    public Info findById(String info_id) {
        return infoDao.findById(info_id);
    }

    @Override
    public Info findByTitle(String title) {
        return infoDao.findInfoByTitle(title);
    }


    public List<Info> findByTitle(Info info) {
        return null;
    }



    @Override
    public boolean deleteInfo(String info_id) {
        return infoDao.deleteInfo(info_id);
    }

    @Override
    public boolean updateInfo(Info info) {
        return infoDao.updateInfo(info);
    }

    @Override
    public boolean addInfo(Info info) {
        return infoDao.addInfo(info);
    }

    @Override
    public List<Info> findAllInfo() {
        return infoDao.findAllInfo();
    }

    @Override
    public List<Info> findInfoBytype(String info_type,int start,int length) {
        String key = info_type+start+length;
        List<Info> infoList = null;
        if(!jedis.exists(key.getBytes())){
            infoList =  infoDao.findInfoBytype(info_type,start,length);
            jedisClient.setList(key, infoList);
            jedis.expire(key,9000);
        }else{
            System.out.println("读取缓存====================");
            infoList = (List<Info>) jedisClient.getList(key);
        }
        return  infoList;
    }

    @Override
    public List<Info> showAll(String keyword) {
        return infoDao.showAll(keyword);
    }

    @Override
 
    public int countBytype(String info_type) {
        return infoDao.countByType(info_type);
}

    @Override
    public List<Info> queryInfoByType(String type) {
        return infoDao.findAllByType(type);
    }

    @Override
    public int countAll(String keyword) {
        return infoDao.countAll(keyword);
    }

    @Override
    public List<Info> findAll(String keyword) {
        return infoDao.findAll(keyword);
    }

    @Override
    public List<Info> findMovies() {
        return infoDao.findMovie();
    }

    @Override
    public List<Info> findBooks() {
        return infoDao.findBook();
    }

    /**
     * 保存留言信息功能
     * @param words 保存的信息
     */
    public void saveWords(Words words) {
        infoDao.saveWords(words);
    }

    /**
     * 保存回复信息内容
     * @param reply 回复信息
     */
    public void saveReply(Reply reply) {
        infoDao.saveReply(reply);
    }

    /**
     * 查询所有留言信息
     * @return 返回查询查询到的留言信息并存放到List集合中
     */
    public List<Words> findByWords() {
        return infoDao.findByWords();
    }

    /**
     * 查询所有的回复信息
     * @return 返回查询到的回复信息并存放到List集合中
     */
    public List<Reply> findByReply() {
        return infoDao.findByReply();
    }

    @Override
    public Integer insertNiceDetail(String uid,String infoId) {
        return infoDao.insertNiceDetail(uid,infoId);
    }

    @Override
    public Integer deleteNiceDetail(String id) {
        return infoDao.deleteNiceDetail(id);
    }

    @Override
    public NiceDetail findNiceDetail(String uid,String infoId) {
        return  infoDao.findNiceDetail(uid,infoId);
    }

    @Override
    public boolean delWords(String lw_id){return infoDao.delWords(lw_id);}

    @Override
    public boolean delReply(String lr_for_words) {
        return infoDao.delReply(lr_for_words);
    }

    @Override
    public boolean delReply2(String lr_id) {
        return infoDao.delReply2(lr_id);
    }

    @Override
    public Integer insertCollect(String uid, String infoId) {
        return infoDao.insertCollect(uid,infoId);
    }

    @Override
    public Integer deleteCollect(String id) {
        return infoDao.deleteCollect(id);
    }

    @Override
    public Collect findCollect(String uid, String infoId) {
        return infoDao.findCollect(uid,infoId);
    }

    @Override
    public List<InfoCollect> findCollectByUid(Integer uid) {
        return infoDao.findCollectByUid(uid);
    }
}
