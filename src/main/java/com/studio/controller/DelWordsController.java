package com.studio.controller;

import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController // 标识为控制器(接收前台请求的)
// rest返回json格式数据
@RequestMapping("/del")
public class DelWordsController {
    @Autowired
    private InfoService infoService;

    @RequestMapping("/delWords")
    public String delWords(HttpServletRequest request){
        String lw_id=request.getParameter("lw_id");
        boolean r1=infoService.delReply(lw_id);
        boolean r2=infoService.delWords(lw_id);
        System.out.println(r1);
        System.out.println(r2);
        return r2+"";
    }
    @RequestMapping("/delReply")
    public String delReply(HttpServletRequest request){
        String lr_id=request.getParameter("lr_id");
        boolean r=infoService.delReply2(lr_id);
        System.out.println(r);
        return r+"";
    }
}
