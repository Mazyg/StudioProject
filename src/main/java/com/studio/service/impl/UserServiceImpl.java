package com.studio.service.impl;

import com.studio.dao.UserDao;
import com.studio.domian.User;
import com.studio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public List<User> findAll(String type) {
        return userDao.findAll(type);
    }

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public User findById1(String uid) {
        return userDao.findById1(uid);
    }

    @Override
    public List<User> findByName(String uname) {
        System.out.println("name"+userDao.findByName(uname));
        return userDao.findByName(uname);
    }

    @Override
    public boolean deleUser(User user) {
        boolean a = userDao.deleUser(user);
        return a;
    }

    @Override
    public boolean saveUser(User user) {
        return userDao.saveUser(user);
    }

    @Override
    public boolean updateUser1(String uid) {
        return userDao.updateUser1(uid);
    }

    @Override
    public boolean updateUser2(String uid) {
        return userDao.updateUser2(uid);
    }

    @Override
    public List<User> findByNameAdmin(String uname) {
        return userDao.findByNameAdmin(uname);
    }

    @Override
    public boolean updateUser3(User user) {
        return userDao.updateUser3(user);
    }
}
