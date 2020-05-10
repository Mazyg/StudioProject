package com.studio.domian;

public class Notify {
    private String content;
    private Integer receiver;

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
