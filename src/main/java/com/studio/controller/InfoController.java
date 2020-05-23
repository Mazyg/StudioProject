package com.studio.controller;

import com.studio.domian.*;
import com.studio.service.DiscussService;
import com.studio.service.InfoService;
import com.studio.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @Autowired
    private DiscussService discussService;

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

    //全局模糊查询
    @RequestMapping("/findAll")
    public String findAll(Model model,HttpServletRequest request){
        String search=request.getParameter("search");
        String keyword="%"+search+"%";
        int total=infoService.countAll(keyword);//模糊查询查到的文章数目
        int start = Integer.parseInt(request.getParameter("start"));//起始位置
        int length= Integer.parseInt(request.getParameter("length"));//实际显示条数
        int page = Integer.parseInt(request.getParameter("page"));//当前页数
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));//设置每页显示条数
        int rest=total-(start+length);//剩余条数
        int totalPage = total/numberPerPage;//总页数
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info>  infos=infoService.showAll(keyword,start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        System.out.println("输入："+search);
        System.out.println("模糊查询结果："+total);
        System.out.println("开始的位置："+start);
        System.out.println("当前页数："+page);
        System.out.println("设置每页显示条数 ："+numberPerPage);
        System.out.println("实际显示条数："+length);
        System.out.println("剩余："+rest);
        System.out.println("总页数："+totalPage);

        model.addAttribute("search",search);
        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("infos",infos);
        model.addAttribute("rest",rest);
        model.addAttribute("pageList",pageArr);

        return "user/main/search";
    }


    //首页显示
    @RequestMapping("/findInfoBytype")
    public String findInfoBytype(Model model,HttpServletRequest request){
        List<Info> rolemodeltop= infoService.findInfoBytype("榜样力量",0,1);
        List<Info> rolemodel= infoService.findInfoBytype("榜样力量",1,2);
        List<Info> chinese= infoService.findInfoBytype("最美%",0,3);
        List<Info> event= infoService.findInfoBytype("热点时事",0,5);
        request.getSession().setAttribute("hotInfo",event);
        List<Info> videoList = infoService.findInfoBytype("视频", 0, 4);
        request.getSession().setAttribute("videoInfo",videoList);
        List<Info> event2= infoService.findInfoBytype("热点时事",5,3);
        model.addAttribute("rolemodeltop",rolemodeltop);
        model.addAttribute("rolemodel",rolemodel);
        model.addAttribute("chinese",chinese);
        model.addAttribute("event",event);
        model.addAttribute("event2",event2);
        List<Info> movies1= infoService.findInfoBytype("电影",0,2);
        model.addAttribute("movies1",movies1);
        List<Info> movies2= infoService.findInfoBytype("电影",2,2);
        model.addAttribute("movies2",movies2);
        List<Info> movies3= infoService.findInfoBytype("电影",4,2);
        model.addAttribute("movies3",movies3);
        List<Info> books1= infoService.findInfoBytype("书籍",0,2);
        model.addAttribute("books1",books1);
        List<Info> books2= infoService.findInfoBytype("书籍",2,2);
        model.addAttribute("books2",books2);
        List<Info> books3= infoService.findInfoBytype("书籍",4,2);
        model.addAttribute("books3",books3);
        return  "user/main/main";
    }
    //全球抗疫页面信息显示
    @RequestMapping("/epidemic")
    public String epidemic(Model model,HttpServletRequest request){
        int total=infoService.countBytype("全球战疫");
        int start = Integer.parseInt(request.getParameter("start"));
        int length= Integer.parseInt(request.getParameter("length"));
        int page = Integer.parseInt(request.getParameter("page"));
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        int rest=total-(start+length);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info> eventTop= infoService.findInfoBytype("全球战疫",0,1);
        List<Info> eventList= infoService.findInfoBytype("全球战疫",start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("eventList",eventList);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("rest",rest);
        model.addAttribute("pageList",pageArr);
        model.addAttribute("eventTop",eventTop);

        return  "user/main/epidemic";
    }

    //热点资讯页面信息显示
    @RequestMapping("/findEvent")
    public String findEvent(Model model,HttpServletRequest request){
        int total=infoService.countBytype("热点时事");
        int start = Integer.parseInt(request.getParameter("start"));
        int length= Integer.parseInt(request.getParameter("length"));
        int page = Integer.parseInt(request.getParameter("page"));
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        int rest=total-(start+length);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info> eventTop= infoService.findInfoBytype("热点时事",0,1);
        List<Info> eventList= infoService.findInfoBytype("热点时事",start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("eventList",eventList);
        model.addAttribute("rest",rest);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("pageList",pageArr);
        model.addAttribute("eventTop",eventTop);

        return  "user/main/news";
    }

    //爱我中华页面信息显示
    @RequestMapping("/findChinese")
    public String findChinese(Model model,HttpServletRequest request) {
        int total=infoService.countBytype("最美%");
        int start = Integer.parseInt(request.getParameter("start"));
        int length= Integer.parseInt(request.getParameter("length"));
        int page = Integer.parseInt(request.getParameter("page"));
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        int rest=total-(start+length);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info> chineseScenery = infoService.findInfoBytype("最美中国景", 0, 4);
        List<Info> chinesePeople = infoService.findInfoBytype("最美中国人", 0, 5);
        List<Info> chineseEvent = infoService.findInfoBytype("最美中国事", 0, 5);
        List<Info> chineseAll= infoService.findInfoBytype("最美%",start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("rest",rest);
        model.addAttribute("chineseScenery", chineseScenery);
        model.addAttribute("chinesePeople", chinesePeople);
        model.addAttribute("chineseEvent", chineseEvent);
        model.addAttribute("chineseAll",chineseAll);
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
    public String findMovie(Model model,HttpServletRequest request){
        int total=infoService.countBytype("电影");
        int start = Integer.parseInt(request.getParameter("start"));
        int length= Integer.parseInt(request.getParameter("length"));
        int page = Integer.parseInt(request.getParameter("page"));
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        int rest=total-(start+length);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info> movies= infoService.findInfoBytype("电影",start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("rest",rest);
        model.addAttribute("pageList",pageArr);
        model.addAttribute("movies",movies);

        return "user/main/movies";
    }

    /**
     * 显示书籍信息
     * @param model
     * @return
     */
    @RequestMapping("/findBooks")
    public String findBook(Model model,HttpServletRequest request) {
        int total=infoService.countBytype("书籍");
        int start = Integer.parseInt(request.getParameter("start"));
        int length= Integer.parseInt(request.getParameter("length"));
        int page = Integer.parseInt(request.getParameter("page"));
        int numberPerPage= Integer.parseInt(request.getParameter("numberPerPage"));
        int rest=total-(start+length);
        int totalPage = total/numberPerPage;
        if(total % numberPerPage != 0){
            totalPage += 1;
        }

        List<Info> books= infoService.findInfoBytype("书籍",start,length);
        PageUtil pageutil=new PageUtil();
        Vector<Integer> pageArr=pageutil.paging(total,totalPage,numberPerPage,page);

        model.addAttribute("total", total);
        model.addAttribute("start",start);
        model.addAttribute("page",page);
        model.addAttribute("numberPerPage",numberPerPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("rest",rest);
        model.addAttribute("books",books);
        model.addAttribute("pageList",pageArr);

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
    public @ResponseBody String deleteInfo(String info_id,RedirectAttributes attr){
        result = infoService.deleteInfo(info_id);
        if (result){
           return "success";
        }
        return "false";
    }

    @RequestMapping("/updateInfo")
    public @ResponseBody String updateInfo(@RequestBody Info info){
        result = infoService.updateInfo(info);
        System.out.println("info="+info);
        System.out.println("修改结果"+result);
        if (result){
            System.out.println("返回success");
           return "success";
        }
        return "false";
    }

    @RequestMapping("/addInfo")
    public @ResponseBody String addInfo(@RequestBody Info info) {
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = ft.format(now);
        info.setDate(time);
        System.out.println("info="+info);
        result =infoService.addInfo(info);
        System.out.println("插入结果"+result);
        if (result){
           return "success";
        }
        return "false";
    }

    @RequestMapping("/findInfoByTitle")
    public String findInfoByTitle(String title,Model model){
         Info info = infoService.findByTitle(title);
         model.addAttribute("infos",info);
         return "user/main/details";
    }

    /**
     * 保存留言信息
     */
    @RequestMapping(value="/saveWords")
    public String saveWords(Words words,HttpServletRequest request){
        if(words != null){
            String info_id = words.getLw_for_article_id();
            infoService.saveWords(words);
            User users= (User) request.getSession().getAttribute("users");
            return "redirect:findByIdInfo.do?infoId="+info_id+"&uid="+users.getUid();
        }else{
            return null;
        }
    }
    /**
     * 保存回复信息
     */
    @RequestMapping(value="/saveReply")
    public String saveReply(Reply reply,HttpServletRequest request){
        if(reply != null){
//            System.out.println(reply);
            infoService.saveReply(reply);
            String info_id = reply.getLr_for_article_id();
            User users= (User) request.getSession().getAttribute("users");
            return "redirect:findByIdInfo.do?infoId="+info_id+"&uid="+users.getUid();
        }else{
            return null;
        }

    }
//
//    @RequestMapping("/findByIdInfo")
//    public String findByIdInfo(Model model,HttpServletRequest request){
//
//        String info_id = request.getParameter("infoId");
//        String uid=request.getParameter("uid");
//        String content= request.getParameter("content");
//        model.addAttribute("info_id",info_id);
//        model.addAttribute("uid",uid);
//        if(uid!="" && content!=null) {
//            Boolean i = discussService.saveDynamic(uid, content,info_id);
//        }
//        Info info = infoService.findById(info_id);
//        model.addAttribute("infos", info);
//        List<Discuss> discuss=discussService.findByInfo_id(info_id);
//        model.addAttribute("discuss",discuss);
//        if("视频".equals(info.getInfo_type())){
//            return "user/main/video";
//        }
//        return "user/main/details";
//    }
    /**
     * 跳转到查看文章内容页面
     */
    //声明用于存放留言回复信息的List集合
    private List<Words> lw_list;
    private List<Reply> lr_list;
    @RequestMapping(value="/findByIdInfo")
    public String toArticleView(Model model,HttpServletRequest request){
        String infoId = request.getParameter("infoId");
        request.getSession().setAttribute("infoId",infoId);
        User user= (User) request.getSession().getAttribute("users");
        String uid;
        if(user==null){uid=null;}
      else{ uid=Integer.toString(user.getUid());}
        //根据id找到文章
        Info info = infoService.findById(infoId);
        NiceDetail niceDetail=infoService.findNiceDetail(uid,infoId);
        if (niceDetail!=null){
            request.getSession().setAttribute("color","like");
        }else{
            request.getSession().setAttribute("color","unlike");
        }
        int result=info.getNice();
        model.addAttribute("result",result);
        model.addAttribute("infos", info);
        model.addAttribute("uid",uid);
        request.getSession().setAttribute("uid",uid);
        //封装留言信息(查出所有)
        lw_list = infoService.findByWords();
        model.addAttribute("lw_list",lw_list);
        //封装回复信息（查出所有）
        lr_list = infoService.findByReply();
        model.addAttribute("lr_list",lr_list);
        //查询文章信息
//        Info article = infoService.findById(infoId);
//        System.out.println("查询到当前文章的ID值："+article.getInfo_id());
        if (info != null) {
            model.addAttribute("article", info);
            if("视频".equals(info.getInfo_type())){
            return "user/main/video";
            }
            else{
                return "user/main/details";
            }
        } else {
            return null;
        }
    }

    /***
     * 实现点赞服务
     */
//    @RequestMapping("/niceDetail")
//    public String niceDetail(Model model,HttpServletRequest request){
//        String infoId = (String) request.getSession().getAttribute("infoId");
//        System.out.println("文章Id："+infoId);
//        User user= (User) request.getSession().getAttribute("users");
//        String uid=Integer.toString(user.getUid());
//        System.out.println("用户Id："+uid);
//        //查询是否有该用户的点赞记录
//        NiceDetail niceDetail=infoService.findNiceDetail(uid,infoId);
//        System.out.println("点赞记录："+niceDetail);
//        //根据点赞id找到文章
//        Info info=infoService.findById(infoId);
//        if (niceDetail!=null){
//            //如果找到这条记录，删除该记录，同时文章的点赞数减一
//            //删除记录
//            infoService.deleteNiceDetail(niceDetail.getId());
//            //文章点赞数减一
//            info.setNice(info.getNice()-1);
//           request.getSession().setAttribute("color","like");
//        }else{
//            //如果没有找到这条记录，则添加这条记录，同时文章数加一；
//            //添加记录
//            infoService.insertNiceDetail(uid,infoId);
//            //文章点赞数加一
//            info.setNice(info.getNice()+1);
//            request.getSession().setAttribute("color","unlike");
//            System.out.println("11111111111111111111111");
//        }
//        infoService.updateInfo(info);
//        return "redirect:findByIdInfo.do?infoId="+infoId +"&uid="+uid;
//    }
}
