package com.studio.domian;

import java.io.Serializable;


/**
 * 话题
 */
public class Topic implements Serializable {

    private Integer tid;
    private String date;
    private String content;
    private Integer uid;
    private String t_tatus;
    private String t_title;


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

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uid=" + uid +
                ", t_tatus='" + t_tatus + '\'' +
                ", t_title='" + t_title + '\'' +
                '}';
    }
}
