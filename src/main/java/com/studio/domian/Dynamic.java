package com.studio.domian;

import java.io.Serializable;
import java.util.List;

/**
 * dynamic 动态表
 * date 动态发布时间，content 动态内容；
 * wid 动态id，uid 用户id ， tid 话题id；
 */
public class Dynamic implements Serializable {

    private Integer wid;
    private String date;
    private String content;
    private String uname;
    private Integer tid;
    List<Comment> comments;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
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

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    @Override
    public String toString() {
        return "Dynamic{" +
                "wid=" + wid +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uname=" + uname +
                ", tid=" + tid +
                ", comments=" + comments +
                '}';
    }
}
