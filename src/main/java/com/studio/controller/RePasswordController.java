package com.studio.controller;

import com.studio.utils.TelephoneUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController // 标识为控制器(接收前台请求的)
// rest返回json格式数据
@RequestMapping("/rep")
public class RePasswordController {
    @RequestMapping("/sendCode")
    public String send(HttpServletRequest request) {
        String telephone=request.getParameter("telephone");
        System.out.println(telephone);
//            return TelephoneUtil.getRequest2(telephone) + "";
        return 1234+"";
    }
}
