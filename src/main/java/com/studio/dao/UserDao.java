package com.studio.dao;

import com.studio.domian.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {


    @Select("select * from user where u_type =#{type} ")
    /*@Results(id = "userMap",
            value = {
                    @Result(id=true,column = "uid",property = "uid"),
                    @Result(column = "uname",property = "uname"),
                    @Result(column = "u_type",property = "u_type")
            }
    )*/
    public List<User> findAll(String type);


    @Select("select * from user where uid=#{uid}")

   /* @ResultMap("userMap")*/
    public User findById(Integer uid);

    @Select("select * from user where uid=#{uid}")
    public User findById1(String uid);


    /**
     * 根据用户名查找普通用户
     * @param uname
     * @return
     */
     @Select("SELECT * FROM user where u_type='user' and uname like CONCAT('%',#{uname},'%')")
    public List<User> findByName(String uname);



    /**
     * 查找管理员
     * @param uname
     * @return
     */
    @Select("SELECT * FROM user where u_type='admin' and uname like CONCAT('%',#{uname},'%')")
    public List<User> findByNameAdmin(String uname);

    public boolean deleUser(User user);

    @Insert("insert into user(uid,uname,password,sex,email,u_type) values('${uid}','${uname}','${password}'," +
            "'${sex}','${email}','${u_type}')")
    /*@ResultMap("userMap")*/
    public boolean saveUser(User user);


    /*封号处理*/
    @Update("update user set u_status= '封号' where uid=#{uid}")
    public boolean updateUser1(String uid);

    /*解封处理*/
    @Update("update user set u_status= '正常' where uid=#{uid}")
    public boolean updateUser2(String uid);
}
