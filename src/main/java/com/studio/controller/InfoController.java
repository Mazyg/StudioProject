package com.studio.controller;


import com.studio.domian.Info;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;

    ModelAndView mv;
    boolean result;
    String msg;
    Info info;

    @RequestMapping("/findAllInfo")
    public ModelAndView findAllInfo(HttpServletRequest request){
        msg = request.getParameter("msg");
        mv = new ModelAndView();
        List<Info> infos = infoService.findAllInfo();
        mv.addObject("infos",infos);
        mv.addObject("msg",msg);
        mv.setViewName("pages/forms/infoManage");
        return mv;
    }

    @RequestMapping("/findById")
    public ModelAndView findById(String info_id){
        mv = new ModelAndView();
        info = infoService.findById(info_id);
        if(info == null){
            msg = "查找信息错误";
            mv.addObject("msg",msg);
        }else {
            mv.addObject("info",info);
        }
        mv.setViewName("pages/forms/showInfo");
        return mv;
    }

    @RequestMapping("/findByTitle")
    public String findByTitle(){
        return "";
    }

    @RequestMapping("/saveInfo")
    public String saveInfo(){
        return "";
    }

    @RequestMapping("/deleteInfo")
    public String deleteInfo(String info_id,RedirectAttributes attr){
        result = infoService.deleteInfo(info_id);
        if (result){
            attr.addAttribute("msg","删除成功");
        }else {
            attr.addAttribute("msg","删除失败");
        }
        return "redirect:findAllInfo.do";
    }

    @RequestMapping("/updateInfo")
    public String updateInfo(Info info,RedirectAttributes attr){
        result = infoService.updateInfo(info);
        if (result){
            attr.addAttribute("msg","修改成功");
        }else {
            attr.addAttribute("msg","修改失败");
        }
        return "redirect:findAllInfo.do";
    }

    @RequestMapping("/addInfo")
    public ModelAndView addInfo(Info info) {
        mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        info.setDate(time);
        System.out.println(info);
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
