package com.studio.controller;

import com.studio.domian.Dynamic;
import com.studio.domian.Topic;
import com.studio.service.DynamicService;
import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    @Autowired
    private TopicService topicService;


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
        System.out.println("topic");
        return  "user/main/dynamic";
    }
}
