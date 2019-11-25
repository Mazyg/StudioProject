package com.studio.controller;

import com.studio.domian.User;
import com.studio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<User> users = userService.findAll();
        System.out.println(users);
        model.addAttribute("users",users);
        return "success";
    }

    @RequestMapping("/findById")
    public String findById(User user,Model model){
        List<User> users = userService.findById(user);
        model.addAttribute("findById",users);
        return "";
    }

    @RequestMapping("/findByName")
    public String findByName(User user,Model model){
        List<User> users = userService.findByName(user);
        model.addAttribute("findByName", user);
        return "";
    }

    @RequestMapping("/deleUser")
    public String deleUser(User user,Model model){
        boolean dele = userService.deleUser(user);
        model.addAttribute("dele", dele);
        return "";
    }
}
