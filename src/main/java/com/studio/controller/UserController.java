package com.studio.controller;

import com.studio.domian.User;
import com.studio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


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
    public ModelAndView findAllUser( Model model,HttpServletRequest request){
       String status = request.getParameter("status");
       mv = new ModelAndView();
       List<User> users = userService.findAll("user");
        mv.addObject("user", users);
        mv.addObject("status", status);
        mv.setViewName("manage/pages/tables/basic-table");
        return mv;
    }


    @RequestMapping("/findAllAdmin")
    public ModelAndView findAllAmin(){
        mv = new ModelAndView();
        List<User> users = userService.findAll("admin");
        mv.addObject("user", users);
        mv.setViewName("manage/pages/tables/admin-table");
        return mv;
    }


    @RequestMapping("/findByName")
    public String findByName(Model model, HttpServletRequest request){
        System.out.println("uname"+request.getParameter("uname"));
        User users = userService.findByName(request.getParameter("uname"));
        model.addAttribute("user", users);
        return "manage/pages/tables/basic-table";
    }
    @RequestMapping("/findByNameAdmin")
    public String findByNameAdmin(Model model, HttpServletRequest request){
        System.out.println("uname"+request.getParameter("uname"));
        List<User> users = userService.findByNameAdmin(request.getParameter("uname"));
        model.addAttribute("user", users);
        return "manage/pages/tables/admin-table";
    }

    @RequestMapping("/updateUser1")
    public String updateUser1(Integer uid,  HttpServletRequest request,HttpServletResponse response){
        mv = new ModelAndView();
        String id =  request.getParameter("uid");
        User users =  userService.findById1(id);
        if("封号".equals(users.getU_status())){
            return "redirect:/user/findAllUser.do?status="+false;
        }else{
            boolean user = userService.updateUser1(request.getParameter("uid"));
        }
        return "redirect:/user/findAllUser.do?status="+true;
    }

    @RequestMapping("/updateUser2")
    public String updateUser2(Integer uid, Model model,HttpServletRequest request){
        mv = new ModelAndView();
        String id =  request.getParameter("uid");
        User users =  userService.findById1(id);
        if("正常".equals(users.getU_status())){
            return "forward:/user/findAllUser.do?status="+false;
        }else{
            boolean user = userService.updateUser2(request.getParameter("uid"));
        }
        return "forward:/user/findAllUser.do?status="+true;
    }



    @RequestMapping("/login")
    public ModelAndView login(/*User user,*/HttpServletRequest request){
        mv = new ModelAndView();
        String uid = request.getParameter("uid");
        String password = request.getParameter("password");
        user1 = userService.findById1(uid);
        HttpSession session = request.getSession(true);
        session.setAttribute("users", user1);
        if (user1 != null){
            if(user1.getU_status().equals("封号")){
                msg = "账号受限";
                mv.addObject("msg",msg);
                mv.setViewName("manage/pages/samples/login");
            }else
            //验证密码
            if (/*user.getPassword()*/password.equals(user1.getPassword())){
                //密码正确
                mv.addObject("user",user1);
                if (user1.getU_type().equals("admin")){
                    mv.setViewName("manage/admin");
                }else {
                    return new ModelAndView("redirect:/info/findInfoBytype.do");
                }
            }else {
                //密码错误
                msg = "密码错误";
                mv.addObject("msg",msg);
                mv.setViewName("manage/pages/samples/login");
            }
        }else {
            //用户不存在
            msg = "用户不存在";
            mv.addObject("msg",msg);
            mv.setViewName("manage/pages/samples/login");
        }
        return mv;
    }

    @RequestMapping("/register")
    public ModelAndView register(User user){
        user.setU_type("user");
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
        mv.setViewName("manage/pages/samples/login");
        return mv;
    }

    @RequestMapping("/personalInfo")
    public ModelAndView personalInfo(Integer uid){
        mv = new ModelAndView();
        user1 = userService.findById(uid);
        if (user1 == null){
            msg = "查询信息发生错误";
        }else {
            mv.addObject("user",user1);
        }
        mv.setViewName("manage/pages/samples/personInfo");
        return mv;
    }

    /**
     * 更新用户信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/personUpdate")
    public String personUpdate(User user, Model model,HttpServletRequest request) {
       boolean user3 = userService.updateUser3(user);
       if(user3==true){
           User users1 = userService.findById(user.getUid());
           HttpSession session = request.getSession(true);
           session.setAttribute("users", users1);
       }
       model.addAttribute("user3", user3);
       return "user/main/personInfo";
    }

    @RequestMapping("/personPhoto")
    public String personPhoto(User user,Model model,HttpServletRequest request){
        System.out.println("userp"+user);
        User users = (User) request.getSession().getAttribute("users");
        System.out.println("userid"+users.getUid());
        user.setUid(users.getUid());
        boolean up = userService.personPhoto(user);
        if(up==true){
            User users1 = userService.findById(users.getUid());
            HttpSession session = request.getSession(true);
            session.setAttribute("users", users1);
        }
        model.addAttribute("up", up);
        if("admin".equals(users.getU_type())){
            return "manage/pages/samples/personInfo";
        }else
        return "user/main/personInfo";
    }

    @RequestMapping("/personUpdateAdm")
    public String personUpdateAdm(User user, Model model,HttpServletRequest request) {
        boolean user3 = userService.updateUser3(user);
        if(user3==true){
            User users1 = userService.findById(user.getUid());
            HttpSession session = request.getSession(true);
            session.setAttribute("users", users1);
        }
        model.addAttribute("user3", user3);
        return "manage/pages/samples/personInfo";
    }
}
