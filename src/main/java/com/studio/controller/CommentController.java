package com.studio.controller;

import com.studio.domian.Comment;
import com.studio.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/saveComment")
    public @ResponseBody Comment saveComment(@RequestBody Comment comment){
        System.out.println(comment);
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        comment.setDate(time);
        boolean result = commentService.saveComment(comment);
        if (result){
            return comment;
        }else {
            return null;
        }
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
