package com.studio.utils;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

public class JedisClientSingle {

   /* @Autowired
    private JedisPool jedisPool;*/
    GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
    JedisPool jedisPool = new JedisPool(poolConfig, "111.229.25.156", 6379,1000,"mn123456");
    public void setList(String key ,List<?> list){

        Jedis jedis = jedisPool.getResource();
        try {
            if(list == null || list.size() == 0){
                jedis.set(key.getBytes(), "".getBytes());
            }else{//如果list为空,则设置一个空
                jedis.set(key.getBytes(), SerializeUtil.serializeList(list));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }

    /**
     * 获取List集合
     * @param key
     * @return
     */
    public List<?> getList(String key){
        Jedis jedis = jedisPool.getResource();
        if(jedis == null || !jedis.exists(key.getBytes())){
            return null;
        }
        System.out.println("key==="+key.getBytes());
        byte[] data = jedis.get(key.getBytes());
        jedis.close();
        return SerializeUtil.unserializeList(data);
    }


}
