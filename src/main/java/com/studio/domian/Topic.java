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

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uid=" + uid +
                '}';
    }
}
