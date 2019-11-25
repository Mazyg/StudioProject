package com.studio.service;

import com.studio.domian.User;

import java.util.List;

public interface UserService {

    public List<User> findAll();

    public List<User> findById(User user);

    public List<User> findByName(User user);

    public boolean deleUser(User user);

    public boolean saveUser(User user);

    public boolean updateUser(User user);
}
