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
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public List<User> findById(User user) {
        return userDao.findById(user);
    }

    @Override
    public List<User> findByName(User user) {
        return userDao.findByName(user);
    }

    @Override
    public boolean deleUser(User user) {
        boolean a = userDao.deleUser(user);
        return a;
    }

    @Override
    public boolean saveUser(User user) {
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }
}
