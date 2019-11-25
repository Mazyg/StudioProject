package com.studio.dao;

import com.studio.domian.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {


    @Select("select * from user")
    public List<User> findAll();

    public List<User> findById(User user);

    public List<User> findByName(User user);

    public boolean deleUser(User user);

    public boolean saveUser(User user);

    public boolean updateUser(User user);
}
