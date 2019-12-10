package com.studio.controller;

import com.studio.domian.Comment;
import com.studio.domian.Dynamic;
import com.studio.domian.Topic;
import com.studio.domian.User;
import com.studio.service.CommentService;
import com.studio.service.DynamicService;
import com.studio.service.TopicService;
import com.studio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    private ModelAndView mv;

    @RequestMapping("/saveTopic")
    public ModelAndView saveTopic(Topic topic, HttpServletRequest request){
        mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        topic.setDate(time);
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("users");
        topic.setUname(user.getUname());
        if("admin".equals(user.getU_type())){
            boolean top = topicService.saveTopicA(topic);
            mv.addObject("top", top);
            mv.setViewName("manage/pages/ui-features/topicput");
            return mv;
        }
        boolean top =topicService.saveTopic(topic);
        mv.addObject("top", top);
        mv.setViewName("manage/pages/ui-features/topicput");
        return mv;
    }

    /**
     * 用户界面发布话题
     * @param topic
     * @param request
     * @return
     */
    @RequestMapping("/saveTopicUser")
    public ModelAndView saveTopicUser(Topic topic,HttpServletRequest request){
        mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        topic.setDate(time);
        System.out.println("top"+topic);
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("users");
        System.out.println("user"+user);
        if(user == null){
            System.out.println("false");
            mv.addObject("top", false);
            mv.setViewName("user/main/write");
        }else{
        topic.setUname(user.getUname());
        boolean top =topicService.saveTopic(topic);
            System.out.println("top"+top);
        mv.addObject("top",top);
        mv.setViewName("user/main/write");
        }
        return mv;
    }

    /*删除话题*/
    @RequestMapping("/deleTopic")
    public String deleTopic(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicdel = topicService.deleTopic(tid);
        return "redirect:/topic/findAllTopicByStatus.do?topicdel="+topicdel;
    }

    /*全部话题界面删除*/
    @RequestMapping("/deleTopic1")
    public String deleTopic1(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicdel = topicService.deleTopic(tid);
        return "redirect:/topic/findAll.do?topicdel="+topicdel;
    }

    @RequestMapping("/deleTopic2")
    public String deleTopic2(HttpServletRequest request,Model model){
       String tid = request.getParameter("tid");
        boolean topicDele = topicService.deleTopic(tid);
        model.addAttribute("topicDel", topicDele);
        return "user/main/personInfoTopic";
    }

    /*未审核审核*/
    @RequestMapping("/updateStatus")
    public String updateStatus(HttpServletRequest request){
        String tid = request.getParameter("tid");
        boolean topicStatus = topicService.updateStatus(tid);
        return "redirect:/topic/findAllTopicByStatus.do?topicdel="+topicStatus;
    }

    /*全部话题审核功能*/
    @RequestMapping("/updateStatus1")
    public String updateStatus1(HttpServletRequest request){
        String tid = request.getParameter("tid");
        Topic topics = topicService.findTopicById(tid);
        if("已审核".equals(topics.getT_tatus())){
            boolean topicStatus = false;
            return "redirect:/topic/findAll.do?topicdel="+topicStatus;
        }
        boolean topicStatus = topicService.updateStatus(tid);
        return "redirect:/topic/findAll.do?topicdel="+topicStatus;
    }


    @RequestMapping("/findAll")
    public ModelAndView  findAll(HttpServletRequest request){
        mv = new ModelAndView();
        String topicdel = request.getParameter("topicdel");
        List<Topic> topic =  topicService.findAllTopic();
        System.out.println("top"+topic);
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
        System.out.println("topic"+topicList);
        User usersTopic = userService.findByNameAll(topicList.getUname());
        System.out.println("usert"+usersTopic);

        model.addAttribute("usersTopic", usersTopic);
        model.addAttribute("topics", topicList);
        return "manage/pages/ui-features/topic_show";
    }

    /*跳转到话题页面*/
    @RequestMapping("/showTopic")
    public ModelAndView showTopic(){
        mv = new ModelAndView();
        List<Topic> topic =  topicService.findAllTopic();
        mv.addObject("topics", topic);
        mv.setViewName("user/main/topic");
        return mv;
    }

    /*通过id进入话题回复评论页面*/
    @RequestMapping("/findTopicById")
    public String findTopicById(String tid,Model model){
        Topic topic = topicService.findTopicById(tid);
        List<Dynamic> dynamics = dynamicService.findByTid(tid);
        for (Dynamic dynamic: dynamics){
            dynamic.setComments(commentService.findByWid(dynamic.getWid()));
        }
        model.addAttribute("dynamics", dynamics);
        model.addAttribute("topic", topic);
        return "user/main/tiezi";
    }
}
