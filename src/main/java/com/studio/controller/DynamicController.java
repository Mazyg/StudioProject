package com.studio.controller;

import com.studio.domian.Dynamic;
import com.studio.domian.Topic;
import com.studio.service.DynamicService;
import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    ModelAndView mv;
    boolean result;
    String msg;
    Dynamic dynamic;

    @Autowired
    private TopicService topicService;

    @RequestMapping("/findByTid")
    public String findByTid(){
        return "";
    }

    @RequestMapping("/findByUid")
    public String findByUid(){
        return "";
    }

    @RequestMapping("/saveDynamic")
    public ModelAndView saveDynamic(Dynamic dynamic, HttpServletRequest request){
        System.out.println("进入controller");
        System.out.println("输入的内容"+ request.getParameter("textarea"));
//        mv = new ModelAndView();
////        Date now = new Date();
////        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
////        String time = ft.format(now);
////        dynamic.setDate(time);
////        result =dynamicService.saveDynamic(dynamic);
////        if (result){
////            msg = "发布成功";
////        }else {
////            msg = "发布失败";
////        }
////        mv.addObject("msg",msg);
////        mv.setViewName("user/main/dynamic");
////        return mv;
        return  null;
    }

    @RequestMapping("/deleDynamic")
    public String deleDynamic(){
        return "";
    }
    /**
     * 用户发动态页面显示
     */
    @RequestMapping("/myDynamic")
    public String findEvent(Model model){
        List<Topic> topic=topicService.findTopic(0,5);
        model.addAttribute("topic",topic);
        return  "user/main/dynamic";
    }
}
