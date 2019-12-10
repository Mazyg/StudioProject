package com.studio.service;

import com.studio.domian.User;

import java.util.List;

public interface UserService {

    public List<User> findAll(String type);

    public User findById(Integer uid);

    public User findById1(String uid);

    public User findByName(String uname);

    public boolean deleUser(User user);

    public boolean saveUser(User user);

    /*封号*/
    public boolean updateUser1(String uid);

    /*解封*/
    public boolean updateUser2(String uid);

    public List<User> findByNameAdmin(String uname);
    public boolean updateUser3(User user);

    public User findByNameAll(String uname);

    public boolean personPhoto(User user);
}
