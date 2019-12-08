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
    private String t_status;
    private String t_title;
    private String t_type;


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

    public String getT_status() {
        return t_status;
    }

    public void setT_status(String t_status) {
        this.t_status = t_status;
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
                ", uid=" + uid +
                ", t_status='" + t_status + '\'' +
                ", t_title='" + t_title + '\'' +
                ", t_type='" + t_type + '\'' +
                '}';
    }
}
