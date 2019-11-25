package com.studio.domian;


/**
 * 评论表
 * cid 评论编号，date 评论时间，content 评论内容
 * uid 评论者id，wid 动态话题id；
 */
public class Comment {

    private Integer cid;
    private String date;
    private String content;
    private Integer uid;
    private Integer wid;

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

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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
                ", uid=" + uid +
                ", wid=" + wid +
                '}';
    }
}
