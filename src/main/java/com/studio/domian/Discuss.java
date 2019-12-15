package com.studio.domian;

import java.util.List;

/**
 * 文章评论表
 */
public class Discuss {
    private Integer did;
    private String date;
    private String content;
    private String uname;
    private Integer info_id;
    private Integer uid;
    private String photo;

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
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

    public Integer getInfo_id() {
        return info_id;
    }

    public void setInfo_id(Integer info_id) {
        this.info_id = info_id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Discuss{" +
                "did=" + did +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", uname='" + uname + '\'' +
                ", info_id=" + info_id +
                ", uid=" + uid +
                ", photo='" + photo + '\'' +
                '}';
    }
}
