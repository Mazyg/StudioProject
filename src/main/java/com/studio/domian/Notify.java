package com.studio.domian;

public class Notify {
    private String content;
    private Integer receiver;
    private Integer fid;
    private Feedback feedback;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getReceiver() {
        return receiver;
    }

    public void setReceiver(Integer receiver) {
        this.receiver = receiver;
    }

    @Override
    public String toString() {
        return "Notify{" +
                "content='" + content + '\'' +
                ", receiver=" + receiver +
                '}';
    }
}
