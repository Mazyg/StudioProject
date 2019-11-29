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
    public User findById(Integer id);

    public List<User> findByName(User user);

    public boolean deleUser(User user);

    @Insert("insert into user(uid,uname,password,sex,email,u_type) values('${uid}','${uname}','${password}'," +
            "'${sex}','${email}','${u_type}')")
    /*@ResultMap("userMap")*/
    public boolean saveUser(User user);

    public boolean updateUser(User user);
}
