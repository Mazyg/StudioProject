package com.studio.controller;


import com.studio.domian.Info;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;

    ModelAndView mv;
    boolean result;
    String msg;

    @RequestMapping("/findAllByTitle")
    public String findAllByTitle(){
        return "";
    }

    @RequestMapping("/findById")
    public String findById(){
        return "";
    }

    @RequestMapping("/findByTitle")
    public String findByTitle(){
        return "";
    }

    @RequestMapping("/saveInfo")
    public String saveInfo(){
        return "";
    }

    @RequestMapping("/deleInfo")
    public String deleInfo(){
        return "";
    }

    @RequestMapping("/updateInfo")
    public String updateInfo(){
        return "";
    }

    @RequestMapping("/addInfo")
    public ModelAndView addInfo(Info info) throws ParseException {
        mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        info.setDate(time);
        System.out.println(time);
        result =infoService.addInfo(info);
        if (result){
            msg = "添加成功";
        }else {
            msg = "添加失败";
        }
        mv.addObject("msg",msg);
        mv.setViewName("pages/forms/basic_elements");
        return mv;
    }
}
