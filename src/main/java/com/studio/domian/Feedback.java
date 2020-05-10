package com.studio.domian;

public class Feedback {
    private Integer fid;
    private Integer uid;
    private String content;
    private String address;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "fid=" + fid +
                ", uid=" + uid +
                ", content='" + content + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
