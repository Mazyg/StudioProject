package com.studio.controller;

import com.studio.domian.User;
import com.studio.service.UserService;
import com.studio.utils.TelephoneUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController // 标识为控制器(接收前台请求的)
// rest返回json格式数据
@RequestMapping("/rep")
public class RePasswordController {
    @Autowired
    private UserService userService;

    @RequestMapping("/sendCode")
    public String send(HttpServletRequest request) {
        String telephone=request.getParameter("telephone");
        System.out.println(telephone);
//            return TelephoneUtil.getRequest2(telephone) + "";
        return 1234+"";
    }
    @RequestMapping("/checkPhone")
    public String checkPhone(HttpServletRequest request) {
        String telephone=request.getParameter("telephone");
        User user=userService.findByPhone(telephone);
        if(user!=null){
            return "yes";
        }
        else{
            return "no";
        }
    }
    @RequestMapping("/rePassword")
    public ModelAndView rePassword(HttpServletRequest request) {
       ModelAndView mv = new ModelAndView();
        String telephone=request.getParameter("telephone");
        String password=request.getParameter("password");
        User user=userService.findByPhone(telephone);
        user.setPassword(password);
        userService.updateUser3(user);
        mv.addObject("tip","密码修改成功，请重新登陆!");
        mv.setViewName("manage/pages/samples/login");
        return mv;
    }
}
