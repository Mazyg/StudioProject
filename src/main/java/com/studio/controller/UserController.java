package com.studio.controller;

import com.studio.domian.User;
import com.studio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    ModelAndView mv;
    User user1;
    String msg = null;
    boolean result;
    @RequestMapping("/findAllUser")
    public ModelAndView findAll(){
       mv = new ModelAndView();
       List<User> users = userService.findAll("user");
        mv.addObject("users", users);
        mv.setViewName("pages/tables/basic-table");
        return mv;
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

    @RequestMapping("/login")
    public ModelAndView login(User user, HttpServletResponse response){
        mv = new ModelAndView();
        System.out.println("user:"+user);
        user1 =  userService.findById(user.getUid());
        System.out.println("user1:"+user1);
        if (user1 != null){
            //验证密码
            if (user.getPassword().equals(user1.getPassword())){
                //密码正确
                mv.addObject("user",user1);
                if (user1.getU_type().equals("admin")){
                    mv.setViewName("admin");
                }else {
                    mv.setViewName("user");
                }
            }else {
                //密码错误
                msg = "密码错误";
                mv.addObject("msg",msg);
                mv.setViewName("pages/samples/login");
            }
        }else {
            //用户不存在
            msg = "用户不存在";
            mv.addObject("msg",msg);
            mv.setViewName("pages/samples/login");
        }
        return mv;
    }

    @RequestMapping("/register")
    public ModelAndView register(User user){
        user.setU_type("user");
        System.out.println("insert"+user);
        mv = new ModelAndView();
        user1 =  userService.findById(user.getUid());
        if (user1!=null){
            msg = "此账号已被注册";
        }else {
            result = userService.saveUser(user);
            if (result){
                msg = "注册成功";
            }else {
                msg = "注册失败";
            }
        }
        mv.addObject("msg",msg);
        mv.setViewName("pages/samples/login");
        return mv;
    }

    @RequestMapping("personalInfo")
    public ModelAndView personalInfo(Integer uid){
        mv = new ModelAndView();
        user1 = userService.findById(uid);
        if (user1 == null){
            msg = "查询信息发生错误";
        }else {
            mv.addObject("user",user1);
        }
        mv.setViewName("pages/samples/personInfo");
        return mv;
    }
}
