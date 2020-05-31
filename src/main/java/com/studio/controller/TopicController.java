package com.studio.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.studio.domian.Dynamic;
import com.studio.domian.Info;
import com.studio.domian.Topic;
import com.studio.domian.User;
import com.studio.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired
    private DynamicService dynamicService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private InfoService infoService;

    private ModelAndView mv;

    @RequestMapping("/saveTopic")
    @ResponseBody
    public String saveTopic(Topic topic, HttpServletRequest request){
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        topic.setDate(time);
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("users");
        topic.setUname(user.getUname());
        if("admin".equals(user.getU_type())){
            boolean result = topicService.saveTopicA(topic);
          /*  mv.addObject("top", top);
            mv.setViewName("manage/pages/ui-features/topicput");
            return mv;*/
          if(result == true){
              return "success";
          }else{
              return "false";
          }
        }
        boolean top =topicService.saveTopic(topic);
       /* mv.addObject("top", top);
        mv.setViewName("manage/pages/ui-features/topicput");
        return mv;*/
        if(top == true){
            return "success";
        }else{
            return "false";
        }
    }

    /**
     * 用户界面发布话题
     * @param topic
     * @param request
     * @return
     */
    @RequestMapping("/saveTopicUser")
    public @ResponseBody String saveTopicUser(Topic topic,HttpServletRequest request){
        /*mv = new ModelAndView();*/
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        topic.setDate(time);
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("users");
        System.out.println("user"+user);
       /* if(user == null){
           *//* System.out.println("false");
            mv.addObject("top", false);
            mv.setViewName("user/main/write");*//*
           return "false";*/
       /* }else{*/
        topic.setUname(user.getUname());
        boolean top =topicService.saveTopic(topic);
          /*  System.out.println("top"+top);
        mv.addObject("top",top);
        mv.setViewName("user/main/write");*/
          if(top == true){
              return "success";
          }else{
              return "false";
          }

    }

    /*删除话题*/
    @RequestMapping("/deleTopic")
    public @ResponseBody String deleTopic(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicdel = topicService.deleTopic(tid);
       /* return "redirect:/topic/findAllTopicByStatus.do?topicdel="+topicdel;*/
        if(topicdel == true){
            return "success";
        }else{
         return "false";
        }
    }

    /*全部话题界面删除*/
    @RequestMapping("/deleTopic1")
    public @ResponseBody String deleTopic1(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicdel = topicService.deleTopic(tid);
       /* return "redirect:/topic/findAll.do?topicdel="+topicdel;*/
        if(topicdel == true){
            return "success";
        }else{
            return "false";
        }
    }

    /**
     * 用户界面删除个人话题
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/deleTopic2")
    public @ResponseBody String deleTopic2(HttpServletRequest request,Model model){
       String tid = request.getParameter("tid");
        System.out.println("tt"+tid);
        boolean topicDele = topicService.deleTopic(tid);
        System.out.println("t"+topicDele);
        if(topicDele==true){
            return "success";
        }else {
            return "false";
        }
    }

    /*未审核审核*/
    @RequestMapping("/updateStatus")
    public @ResponseBody String updateStatus(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicStatus = topicService.updateStatus(tid);
      /*  return "redirect:/topic/findAllTopicByStatus.do?topicdel="+topicStatus;*/
        if(topicStatus == true){
            return "success";
        }else{
            return "false";
        }
    }

    /*全部话题审核功能*/
    @RequestMapping("/updateStatus1")
    public @ResponseBody String updateStatus1(HttpServletRequest request){
        String tid = request.getParameter("tid");
        Topic topics = topicService.findTopicById(tid);
        if("已审核".equals(topics.getT_tatus())){
            /*boolean topicStatus = false;*/
           /* return "redirect:/topic/findAll.do?topicdel="+topicStatus;*/
            return "false";
        }
        boolean topicStatus = topicService.updateStatus(tid);
       /* return "redirect:/topic/findAll.do?topicdel="+topicStatus;*/
        if(topicStatus == true){
            return "success";
        }else{
            return "false";
        }
    }


    /**
     * 全部话题页面不通过审核
     * @param request
     * @return
     */
    @RequestMapping("/updateStatusNot")
    public @ResponseBody String updateStatusNot(HttpServletRequest request){
        String tid = request.getParameter("tid");
        String t_reason = request.getParameter("t_reason");
        Topic topics = topicService.findTopicById(tid);
        topics.setT_reason(t_reason);
        if("已审核".equals(topics.getT_tatus())){
            /*boolean topicStatus = false;*/
            /* return "redirect:/topic/findAll.do?topicdel="+topicStatus;*/
            return "false";
        }
        boolean topicStatus = topicService.updateStatusNot(topics);
        System.out.println("tid"+topicStatus);
        /* return "redirect:/topic/findAll.do?topicdel="+topicStatus;*/
        if(topicStatus == true){
            return "success";
        }else{
            return "false";
        }
    }

    /**
     * 未审核界面审核但不通过
     * @param request
     * @return
     */
    @RequestMapping("/updateStatusNot1")
    public @ResponseBody String updateStatusNot1(HttpServletRequest request){
        String tid = request.getParameter("tid");
        String t_reason = request.getParameter("t_reason");
        Topic topics = topicService.findTopicById(tid);
        topics.setT_reason(t_reason);
        boolean topicStatus = topicService.updateStatusNot(topics);
        /*  return "redirect:/topic/findAllTopicByStatus.do?topicdel="+topicStatus;*/
        if(topicStatus == true){
            return "success";
        }else{
            return "false";
        }
    }

    /**
     * 为模态框返回json数据
     * @param request
     * @return topic
     */
    @RequestMapping("/showResult")
    public @ResponseBody Topic  showResult(HttpServletRequest request){
        String tid = request.getParameter("tid");
        Topic topicResult = topicService.findTopicById(tid);
        return topicResult;
    }



    @RequestMapping("/findAll")
    public ModelAndView  findAll(HttpServletRequest request){
        mv = new ModelAndView();
        String topicdel = request.getParameter("topicdel");
        List<Topic> topic =  topicService.findAllTopic();
        mv.addObject("topicdel", topicdel);
        mv.addObject("topics", topic);
        mv.setViewName("manage/pages/ui-features/topic-table");
        return mv;
    }

    @RequestMapping("/findAllTopicByStatus")
    public ModelAndView  findAllByStatus(HttpServletRequest request){
        mv = new ModelAndView();
        String topicdel = request.getParameter("topicdel");
        List<Topic> topic =  topicService.findAllByStatus();
        mv.addObject("topics", topic);
        mv.addObject("topicdel", topicdel);
        mv.setViewName("manage/pages/ui-features/topic-bystatus");
        return mv;
    }

    /**
     * 通过用户id查找话题
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/findByUid")
    public String findByUid(HttpServletRequest request,Model model){
       User user = (User) request.getSession().getAttribute("users");
       if(user==null){
           return "user/main/personInfoTopic";
       }
       String uname = user.getUname();
        List<Topic> topicInfo = topicService.findAllByUname(uname);
        model.addAttribute("topicInfo", topicInfo);
        return "user/main/personInfoTopic";
    }

    /**
     * 通过标题查找所有话题
     * @return
     */
    @RequestMapping("/findByTitle")
    public String findByTitle(HttpServletRequest request, Model model){
        String title = request.getParameter("title");
        List<Topic> topicList = topicService.findByTitle(title);
        System.out.println("tl"+topicList);
        model.addAttribute("topics", topicList);
        return "manage/pages/ui-features/topic-table";
    }

    /**
     * 通过标题查询未审核话题
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/findByTitleNot")
    public String findByTitleNot(HttpServletRequest request,Model model){
        String title = request.getParameter("title");
        List<Topic> topicList = topicService.findByTitleNot(title);
        model.addAttribute("topics", topicList);
        return "manage/pages/ui-features/topic-bystatus";
    }

    /*通过id查找话题*/
    @RequestMapping("/findById")
    public String findById(Model model,HttpServletRequest request){
        String tid = request.getParameter("tid");
        Topic topicList = topicService.findTopicById(tid);
        User usersTopic = userService.findByNameAll(topicList.getUname());
        model.addAttribute("usersTopic", usersTopic);
        model.addAttribute("topics", topicList);
        return "manage/pages/ui-features/topic_show";
    }

    /*跳转到话题页面*/
    @RequestMapping("/showTopic")
    public String showTopic(Model model,HttpServletRequest request,
                                  @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum){
        User user = (User) request.getSession().getAttribute("users");
        if(user != null){
            int topicCount = topicService.countUserTopic(user.getUname());
            int commentCount = topicService.countUserReply(user.getUname());
            commentCount = commentCount + commentService.countUserReply(user.getUname());
            model.addAttribute("topicCount",topicCount);
            model.addAttribute("commentCount",commentCount);
        }

        List<Topic> topTopics = topicService.findTopic(0,3);
        model.addAttribute("topTopics",topTopics);

        PageHelper.startPage(pageNum,3);
        List<Topic> topics = topicService.findCheckTopic();
        for (Topic topic : topics){
            topic.setUser(userService.findByNameAll(topic.getUname()));
        }
        PageInfo<Topic> pageInfo = new PageInfo<Topic>(topics,3);
        model.addAttribute("pageInfo",pageInfo);
        return "user/main/topic";
    }

    /*通过id进入话题回复评论页面*/
    @RequestMapping("/findTopicById")
    public String findTopicById(String tid,String type,Model model){
        Topic topic = topicService.findTopicById(tid);
        topic.setUser(userService.findByNameAll(topic.getUname()));
        topic.setView_count(topic.getView_count()+1);
        topicService.updateCount(topic);
        List<Dynamic> dynamics = dynamicService.findByTid(tid);
        for (Dynamic dynamic: dynamics){
            dynamic.setComments(commentService.findByWid(dynamic.getWid()));
            dynamic.setUser(userService.findByNameAll(dynamic.getUname()));
        }
        List<Info> infos = infoService.findInfoBytype(type,0,5);
        model.addAttribute("infos",infos);
        model.addAttribute("dynamics", dynamics);
        model.addAttribute("topic", topic);
        return "user/main/tiezi";
    }

}
