package com.studio.domian;


/**
 * 评论表
 * cid 评论编号，date 评论时间，content 评论内容
 * uid 评论者id，rid 被评论者id，wid 动态话题id；
 */
public class Comment {

    private Integer cid;
    private String date;
    private String content;
    private String uname;
    private String rname;
    private Integer wid;


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
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



    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uname='" + uname + '\'' +
                ", rname='" + rname + '\'' +
                ", wid=" + wid +
                '}';
    }
}
