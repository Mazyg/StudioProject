package com.studio.controller;


import com.studio.domian.Info;
import com.studio.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;
    ModelAndView mv;
    boolean result;
    String msg;
    Info info;

    @RequestMapping("/findAllInfo")
    public ModelAndView findAllInfo(HttpServletRequest request){
        msg = request.getParameter("msg");
        mv = new ModelAndView();
        List<Info> infos = infoService.findAllInfo();
        mv.addObject("infos",infos);
        mv.addObject("msg",msg);
        mv.setViewName("manage/pages/forms/infoManage");
        return mv;
    }

    //首页显示
    @RequestMapping("/findInfoBytype")
    public String findInfoBytype(Model model){
        List<Info> rolemodeltop= infoService.findInfoBytype("榜样力量",0,1);
        model.addAttribute("rolemodeltop",rolemodeltop);
        List<Info> rolemodel= infoService.findInfoBytype("榜样力量",1,2);
        model.addAttribute("rolemodel",rolemodel);
        List<Info> chinese= infoService.findInfoBytype("最美%",0,3);
        model.addAttribute("chinese",chinese);
        List<Info> event= infoService.findInfoBytype("热点时事",0,5);
        model.addAttribute("event",event);
        List<Info> event2= infoService.findInfoBytype("热点时事",2,3);
        model.addAttribute("event2",event2);
        List<Info> movies1= infoService.findInfoBytype("电影",0,2);
        model.addAttribute("movies1",movies1);
        List<Info> movies2= infoService.findInfoBytype("电影",2,2);
        model.addAttribute("movies2",movies2);
        List<Info> movies3= infoService.findInfoBytype("电影",4,2);
        model.addAttribute("movies3",movies3);
        return  "user/main/main";
    }

 
    //热点资讯页面信息显示
    @RequestMapping("/findEvent")
    public String findEvent(Model model,HttpServletRequest request){
        List<Info> eventTop= infoService.findInfoBytype("热点时事",0,1);
        model.addAttribute("eventTop",eventTop);
        int total=infoService.countBytype("热点时事");
        model.addAttribute("total", total);
        int page = Integer.parseInt(request.getParameter("page"));
        model.addAttribute("page",page);
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        model.addAttribute("numberPerPage",numberPerPage);
        List<Info> eventList= infoService.findInfoBytype("热点时事",page,numberPerPage);
        model.addAttribute("eventList",eventList);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }
        model.addAttribute("totalPage",totalPage);
        Vector<Integer> pageArr = new Vector<Integer>();
        int start = 1;
        if((page+1) >=5){
            start = (page+1)/5 *5;
        }
        int num = start;
        while(!(num > totalPage || num > start +4)){
            pageArr.add(new Integer(num));
            ++num;
        }
        model.addAttribute("pageList",pageArr);
        return  "user/main/news";
    }

    //爱我中华页面信息显示
    @RequestMapping("/findChinese")
    public String findChinese(Model model,HttpServletRequest request) {
        List<Info> chineseScenery = infoService.findInfoBytype("最美中国景", 0, 4);
        model.addAttribute("chineseScenery", chineseScenery);
        List<Info> chinesePeople = infoService.findInfoBytype("最美中国人", 0, 5);
        model.addAttribute("chinesePeople", chinesePeople);
        List<Info> chineseEvent = infoService.findInfoBytype("最美中国事", 0, 5);
        model.addAttribute("chineseEvent", chineseEvent);
        int total=infoService.countBytype("最美%");
        model.addAttribute("total", total);
        int page = Integer.parseInt(request.getParameter("page"));
        model.addAttribute("page",page);
//        int numberPerPage=1;
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        model.addAttribute("numberPerPage",numberPerPage);
        List<Info> chineseAll = infoService.findInfoBytype("最美%",page,numberPerPage);
        model.addAttribute("chineseAll", chineseAll);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }
        model.addAttribute("totalPage",totalPage);
        Vector<Integer> pageArr = new Vector<Integer>();
        int start = 1;
        if((page+1) >=5){
            start = (page+1)/5 *5;
        }
        int num = start;
        while(!(num > totalPage || num > start + 4)){
            pageArr.add(new Integer(num));
            ++num;
        }
        model.addAttribute("pageList",pageArr);
        return "user/main/chinese";

    }
    /**
     * 榜样页面信息
     * @param model
     * @return
     */
    @RequestMapping("/findPersonInfo")
    public String findPersonInfo(Model model){
        List<Info> person = infoService.findInfoBytype("身边榜样", 0, 2);
        model.addAttribute("person", person);
        List<Info> rolemodeltop= infoService.findInfoBytype("榜样力量",0,3);
        model.addAttribute("rolemodeltop",rolemodeltop);
        List<Info> persontip= infoService.findInfoBytype("新时代楷模",0,2);
        model.addAttribute("persontip",persontip);
        List<Info> personOne= infoService.findInfoBytype("人物",0,1);
        model.addAttribute("personone",personOne);
        return "user/main/personal";
    }

    /**

     * 显示电影信息
     * @param model
     * @return
     */
    @RequestMapping("/findMovies")
    public String findMovie(Model model){
        List<Info> movies = infoService.findMovies();
        model.addAttribute("movies",movies);
        return "user/main/movies";
    }

    /**
     * 显示书籍信息
     * @param model
     * @return
     */
    @RequestMapping("/findBooks")
    public String findBook(Model model) {
        List<Info> books = infoService.findBooks();
        model.addAttribute("books", books);
        return "user/main/books";
    }

   /**个人首页政策信息显示
   /*  * 个人首页政策信息显示
    }
     /* 个人首页政策信息显示
     * @param model
     * @return*/

     @RequestMapping("/findPersonalMainInfo")
      public String findPersonalMainInfo(Model model){
        List<Info> personal = infoService.findInfoBytype("近期政策", 0, 3);
        model.addAttribute("personalMainInfo", personal);
        return "user/main/person";

    }

    @RequestMapping("/findById")
    public ModelAndView findById(String info_id){
        mv = new ModelAndView();
        info = infoService.findById(info_id);
        if(info == null){
            msg = "查找信息错误";
            mv.addObject("msg",msg);
        }else {
            mv.addObject("info",info);
        }
        mv.setViewName("manage/pages/forms/showInfo");
        return mv;
    }



    @RequestMapping("/findByIdInfo")
    public String findByIdInfo(Model model,HttpServletRequest request){
        String info_id = request.getParameter("person");
        System.out.println("id"+info_id);
        Info info = infoService.findById(info_id);
        System.out.println("info"+info);
        model.addAttribute("infos", info);
        return "user/main/details";
    }

    @RequestMapping("/findByTitle")
    public String findByTitle(Model model,String title){
        Info info = infoService.findByTitle(title);
        model.addAttribute("movie",info);
        return "user/main/movie";
    }

    @RequestMapping("/saveInfo")
    public String saveInfo(){
        return "";
    }

    @RequestMapping("/deleteInfo")
    public String deleteInfo(String info_id,RedirectAttributes attr){
        result = infoService.deleteInfo(info_id);
        if (result){
            attr.addAttribute("msg","删除成功");
        }else {
            attr.addAttribute("msg","删除失败");
        }
        return "redirect:findAllInfo.do";
    }

    @RequestMapping("/updateInfo")
    public String updateInfo(Info info,RedirectAttributes attr){
        result = infoService.updateInfo(info);
        if (result){
            attr.addAttribute("msg","修改成功");
        }else {
            attr.addAttribute("msg","修改失败");
        }
        return "redirect:findAllInfo.do";
    }

    @RequestMapping("/addInfo")
    public ModelAndView addInfo(Info info) {
        mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        info.setDate(time);
        result =infoService.addInfo(info);
        if (result){
            msg = "添加成功";
        }else {
            msg = "添加失败";
        }
        mv.addObject("msg",msg);
        mv.setViewName("manage/pages/forms/basic_elements");
        return mv;
    }
}
