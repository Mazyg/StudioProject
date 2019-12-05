package com.studio.controller;

import com.studio.domian.Topic;
import com.studio.service.DynamicService;
import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

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
    public String saveDynamic(){
        return "";
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
        System.out.println("topic");
        return  "user/main/dynamic";
    }
}
