package com.studio.controller;

import com.studio.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @RequestMapping("/saveTopic")
    public String saveTopic(){
        return "";
    }

    @RequestMapping("/deleTopic")
    public String deleTopic(){
        return "";
    }

    @RequestMapping("/findAll")
    public String findAll(){
        return "";
    }

    @RequestMapping("/findByUid")
    public String findByUid(){
        return "";
    }

    @RequestMapping("/findByContent")
    public String findByContent(){
        return "";
    }
}
