package com.studio.controller;

import com.studio.utils.ImageUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/load")
public class ImageUploadController {



    @RequestMapping("/imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String DirectoryName = "upload/";
        System.out.println("进入imageUpload方法。。。。");
        try {
            ImageUploadUtil.ckeditor(request, response, DirectoryName);

        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
