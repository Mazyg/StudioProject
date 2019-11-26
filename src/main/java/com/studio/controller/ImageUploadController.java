package com.studio.controller;

import com.studio.utils.ImageUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/load")
public class ImageUploadController {

    String DirectoryName = "upload/";


    @RequestMapping("/imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入imageUpload方法。。。。");
        try {
            ImageUploadUtil.ckeditor(request, response, DirectoryName);

        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("getImageUrl")
    public void getImageUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String DirectoryName = "upload/";
        String url = ImageUploadUtil.ImageUrl(request,response,DirectoryName);
        System.out.println("controller:"+url);
        response.getWriter().write(url);
    }

}
