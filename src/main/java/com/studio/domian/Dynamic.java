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
    private Integer uid;
    private Integer tid;
    List<Comment> comments;

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

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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
                ", uid=" + uid +
                ", tid=" + tid +
                ", comments=" + comments +
                '}';
    }
}
