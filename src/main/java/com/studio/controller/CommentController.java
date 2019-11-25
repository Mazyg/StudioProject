package com.studio.controller;

import com.studio.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/saveComment")
    public String saveComment(){
        return "";
    }

    @RequestMapping("/deleComment")
    public String deleComment(){
        return "";
    }

    @RequestMapping("/findByEid")
    public String findByWid(){
        return "";
    }
}
