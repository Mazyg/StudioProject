package com.studio.domian;

import java.io.Serializable;

/**
 * 信息类别表
 */
public class Info_type implements Serializable {

    private Integer sid;
    private String sname;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "Info_type{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                '}';
    }
}
