package com.studio.domian;

import java.io.Serializable;


/**
 * 信息表
 */
public class Info  implements Serializable {

    private Integer info_id;
    private String title;
    private String content;
    private String date;
    private String info_type;
    private String photo;
    private String introduce;

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Integer getInfo_id() {
        return info_id;
    }

    public void setInfo_id(Integer info_id) {
        this.info_id = info_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getInfo_type() {
        return info_type;
    }

    public void setInfo_type(String info_type) {
        this.info_type = info_type;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Info{" +
                "info_id=" + info_id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                ", info_type='" + info_type + '\'' +
                ", photo='" + photo + '\'' +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
