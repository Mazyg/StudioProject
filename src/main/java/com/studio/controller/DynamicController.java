package com.studio.controller;

import com.studio.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

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
}
