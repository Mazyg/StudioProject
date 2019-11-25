package com.studio.controller;


import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;

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
}
