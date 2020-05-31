package com.studio.controller;

import com.studio.domian.Collect;
import com.studio.domian.Info;
import com.studio.domian.NiceDetail;
import com.studio.domian.User;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController // 标识为控制器(接收前台请求的)
// rest返回json格式数据
@RequestMapping("/nice")
public class niceDetailController {
    @Autowired
    private InfoService infoService;
    /***
     * 实现点赞服务
     */
    @RequestMapping("/niceDetail")
    public String niceDetail(Model model, HttpServletRequest request){
        String infoId = (String) request.getSession().getAttribute("infoId");
        System.out.println("文章Id："+infoId);
        User user= (User) request.getSession().getAttribute("users");
        String uid=Integer.toString(user.getUid());
        System.out.println("用户Id："+uid);
        //查询是否有该用户的点赞记录
        NiceDetail niceDetail=infoService.findNiceDetail(uid,infoId);
        System.out.println("点赞记录："+niceDetail);
        //根据点赞id找到文章
        Info info=infoService.findById(infoId);
        if (niceDetail!=null){
            //如果找到这条记录，删除该记录，同时文章的点赞数减一
            //删除记录
            infoService.deleteNiceDetail(niceDetail.getId());
            //文章点赞数减一
            info.setNice(info.getNice()-1);
            infoService.updateInfo(info);
            return "down";
        }else{
            //如果没有找到这条记录，则添加这条记录，同时文章数加一；
            //添加记录
            infoService.insertNiceDetail(uid,infoId);
            //文章点赞数加一
            info.setNice(info.getNice()+1);
            infoService.updateInfo(info);
            return "up";
        }
//        return "redirect:findByIdInfo.do?infoId="+infoId +"&uid="+uid;
    }
    /***
     * 实现收藏服务
     */
    @RequestMapping("/collect")
    public String collect(HttpServletRequest request){
        System.out.println("111111111111111111111111111");
        String infoId = (String) request.getSession().getAttribute("infoId");
        System.out.println("文章Id："+infoId);
        User user= (User) request.getSession().getAttribute("users");
        String uid=Integer.toString(user.getUid());
        System.out.println("用户Id："+uid);
        //查询是否有该用户的收藏记录
        Collect collect=infoService.findCollect(uid,infoId);
        System.out.println("收藏记录：");
        if (collect!=null){
            //如果找到这条记录，删除该记录
            infoService.deleteCollect(collect.getCid());
            return "del";
        }else{
            //如果没有找到这条记录，则添加这条记录
            infoService.insertCollect(uid,infoId);
            return "insert";
        }
    }
}
