package com.studio.domian;

public class CommentDTO {
    private String uname;
    private Integer tid;
    private String content;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "CommentDTO{" +
                "uname='" + uname + '\'' +
                ", tid=" + tid +
                ", content='" + content + '\'' +
                '}';
    }
}
