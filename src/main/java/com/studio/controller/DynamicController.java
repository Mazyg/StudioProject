package com.studio.controller;

import com.studio.domian.Comment;
import com.studio.domian.Dynamic;
import com.studio.domian.Topic;
import com.studio.service.CommentService;
import com.studio.service.DynamicService;
import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
 
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
=======
import org.springframework.web.bind.annotation.ResponseBody;
 
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

    @Autowired
    private CommentService commentService;


    @RequestMapping("/saveDynamic")
    public @ResponseBody Dynamic saveDynamic(@RequestBody Dynamic dynamic){
        System.out.println("收到的dynamic="+dynamic);
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        dynamic.setDate(time);
        boolean result = dynamicService.saveDynamic(dynamic);
        if (result){
            return dynamic;
        }else {
            return null;
        }
    }

    @RequestMapping("/deleteDynamic")
    public @ResponseBody String deleteDynamic(Integer wid){
        boolean result = dynamicService.deleteDynamic(wid);
        if (result){
            return "success";
        }
        return "false";
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

    @RequestMapping("/findAllTopic")
    public String findAllTopic(Model model){
        List<Topic> topics = topicService.findAllTopic();
        model.addAttribute("topics",topics);
        return  "manage/pages/charts/topic";
    }

    @RequestMapping("/findAllDynamicByTid")
    public String findAllDynamicByTid(String tid,Model model){
        List<Dynamic> dynamics = dynamicService.findByTid(tid);
        model.addAttribute("dynamics",dynamics);
        return "manage/pages/charts/dynamic";
    }

    @RequestMapping("/findAllReplyByWid")
    public String findAllReplyByWid(Integer wid,Model model){
        List<Comment> comments = commentService.findByWid(wid);
        model.addAttribute("comments",comments);
        return "manage/pages/charts/reply";
    }

}
