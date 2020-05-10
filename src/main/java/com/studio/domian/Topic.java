package com.studio.domian;

import java.io.Serializable;


/**
 * 话题
 */
public class Topic implements Serializable {

    private Integer tid;
    private String date;
    private String content;
    private String uname;
    private String t_tatus;
    private String t_title;
    private String t_type;
    private Integer view_count;
    private String t_result;
    private User user;


    public String getT_result() {
        return t_result;
    }

    public void setT_result(String t_result) {
        this.t_result = t_result;
    }

    public Integer getView_count() {
        return view_count;
    }

    public void setView_count(Integer view_count) {
        this.view_count = view_count;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getT_tatus() {
        return t_tatus;
    }

    public void setT_tatus(String t_tatus) {
        this.t_tatus = t_tatus;
    }

    public String getT_title() {
        return t_title;
    }

    public void setT_title(String t_title) {
        this.t_title = t_title;
    }

    public String getT_type() {
        return t_type;
    }

    public void setT_type(String t_type) {
        this.t_type = t_type;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uname='" + uname + '\'' +
                ", t_tatus='" + t_tatus + '\'' +
                ", t_title='" + t_title + '\'' +
                ", t_type='" + t_type + '\'' +
                ", view_count=" + view_count +
                ", t_result='" + t_result + '\'' +
                ", user=" + user +
                '}';
    }
}
