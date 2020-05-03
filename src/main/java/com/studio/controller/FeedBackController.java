package com.studio.controller;

import com.studio.domian.Feedback;
import com.studio.domian.Topic;
import com.studio.domian.User;
import com.studio.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/feedback")
public class FeedBackController {

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/addFeed")
    @ResponseBody
    public String saveTopic(Feedback feedback, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("users");
        feedback.setUid(user.getUid());
        System.out.println("feedback"+feedback);
        boolean result = feedbackService.addFeedback(feedback);
        System.out.println("结果"+result);
        if(result == true){
            return "success";
        }else{
                return "false";
            }
        }


    @RequestMapping("/findAllFeedback")
    public String findAllReplyByWid(Model model){
        List<Feedback> feedbacks = feedbackService.getAllFeedback();
        model.addAttribute("feedbacks",feedbacks);
        return "manage/pages/icons/userFeed";
    }


}
