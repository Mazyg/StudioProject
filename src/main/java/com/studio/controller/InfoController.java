package com.studio.controller;


import com.studio.domian.Info;
import com.studio.domian.Topic;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        mv.setViewName("manage/pages/forms/infoManage");
        return mv;
    }

    //首页榜样力量显示
    @RequestMapping("/findInfoBytype")
    public String findInfoBytype(Model model){
        List<Info> rolemodeltop= infoService.findInfoBytype("榜样力量",0,1);
        model.addAttribute("rolemodeltop",rolemodeltop);
        List<Info> rolemodel= infoService.findInfoBytype("榜样力量",1,2);
        model.addAttribute("rolemodel",rolemodel);
        List<Info> chinese= infoService.findInfoBytype("最美%",0,3);
        model.addAttribute("chinese",chinese);
        List<Info> event= infoService.findInfoBytype("热点时事",0,5);
        model.addAttribute("event",event);
        List<Info> movies1= infoService.findInfoBytype("电影",0,2);
        model.addAttribute("movies1",movies1);
        List<Info> movies2= infoService.findInfoBytype("电影",2,2);
        model.addAttribute("movies2",movies2);
        List<Info> movies3= infoService.findInfoBytype("电影",4,2);
        model.addAttribute("movies3",movies3);
        return  "user/main/main";
    }


    /**
     * 榜样页面信息
     * @param model
     * @return
     */
    @RequestMapping("/findPersonInfo")
    public String findPersonInfo(Model model){
        List<Info> person = infoService.findInfoBytype("身边榜样", 0, 2);
        model.addAttribute("person", person);
        List<Info> rolemodeltop= infoService.findInfoBytype("榜样力量",0,3);
        model.addAttribute("rolemodeltop",rolemodeltop);
        List<Info> persontip= infoService.findInfoBytype("新时代楷模",0,2);
        model.addAttribute("persontip",persontip);
        List<Info> personOne= infoService.findInfoBytype("人物",0,1);
        model.addAttribute("personone",personOne);
        return "user/main/personal";
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
        mv.setViewName("manage/pages/forms/showInfo");
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
        mv.setViewName("manage/pages/forms/basic_elements");
        return mv;
    }
}
