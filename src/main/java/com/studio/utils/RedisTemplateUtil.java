package com.studio.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class RedisTemplateUtil {

    @Autowired

    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private Jedis jedis;

    public void setStr(String key, String value) {
        setStr(key, value, null);
    }
    public void setStr(String key, Object value, Long time)
    {if(value == null){
        return;
    }if(value instanceof String){
        String obj = (String) value;
        stringRedisTemplate.opsForValue().set(key, obj);
    }else if(value instanceof List){
        List obj = (List) value;
        stringRedisTemplate.opsForList().leftPushAll(key,obj);
    }else if(value instanceof Map){
        Map obj = (Map) value;
        stringRedisTemplate.opsForHash().putAll(key,obj);
    }if (time != null)
        stringRedisTemplate.expire(key, time, TimeUnit.SECONDS);
    }
    public Object getKey(String key)
    {return stringRedisTemplate.opsForValue().get(key);
    }
    public void delKey(String key) {
        stringRedisTemplate.delete(key);
    }
    public boolean del(String key)
    {return jedis.del(key.getBytes())>0;
    }















    /*private RedisTemplate redisTemplate;

    public RedisTemplateUtil(RedisTemplate redisTemplate){
                this.redisTemplate = redisTemplate;
             }*/



       /* //将多种类型的值存入缓存
        public void set(String key, Object value){
            ValueOperations valueOperations = redisTemplate.opsForValue();
            valueOperations.set(key,value);
        }

        //获取指定的key值
        public Object  get(String key){
            return  redisTemplate.opsForValue().get(key);
        }

        //将list存入缓存
        public void setList(String key, List value){
            redisTemplate.opsForList().leftPush(key,value);
        }

        //获取指定key的list值
        public  Object getList(String key){
            return redisTemplate.opsForList().leftPop(key);
        }

        //将set存入缓存
        public void setSet(String key, Set value){
            redisTemplate.opsForSet().add(key,value);
        }

        //获取set
        public Object getSet(String key){
            return redisTemplate.opsForSet().members(key);
        }

        //将map存入缓存
        public void  setHash(String key , Map value){
            redisTemplate.opsForHash().putAll(key,value);
        }

        //获取map
        public Object getHash(String key){
            return redisTemplate.opsForHash().entries(key);
        }

        //删除某个key
        public void delete(String key){
            redisTemplate.delete(key);
        }
*/
    }

