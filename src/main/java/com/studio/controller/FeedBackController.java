package com.studio.controller;

import com.studio.domian.Feedback;
import com.studio.domian.Notify;
import com.studio.domian.Topic;
import com.studio.domian.User;
import com.studio.service.FeedbackService;
import com.studio.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/feedback")
public class FeedBackController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private NotifyService notifyService;

    /**
     * 新增用户反馈
     * @param feedback
     * @param request
     * @return
     */
    @RequestMapping("/addFeed")
    @ResponseBody
    public String saveTopic(Feedback feedback, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("users");
        feedback.setUid(user.getUid());
        boolean result = feedbackService.addFeedback(feedback);
        if(result == true){
            return "success";
        }else{
                return "false";
            }
        }


    /**
     * 管理员获取所有用户反馈
     * @param model
     * @return
     */
    @RequestMapping("/findAllFeedback")
    public String findAllReplyByWid(Model model){
        List<Feedback> feedbacks = feedbackService.getAllFeedback();
        model.addAttribute("feedbacks",feedbacks);
        return "manage/pages/icons/userFeed";
    }

    /**
     * 管理员给用户反馈
     * @param notify
     * @return
     */
    @RequestMapping("/addNotify")
    @ResponseBody
    public String addNotify(Notify notify){
        System.out.println(notify);
        boolean result = notifyService.addNotify(notify);
        if(result == true){
            return "success";
        }else{
            return "false";
        }
    }

    /**
     * 用户获取系统消息
     * @param model
     * @return
     */
    @RequestMapping("/findUserNotify")
    public String findUserNotify(Model model , HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("users");
        List<Notify> notifies = notifyService.getUserNotify(user.getUid());
        model.addAttribute("notifies", notifies);
        return "user/main/systemInfo";
    }





}
