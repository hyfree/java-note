package com.hjli.model;

public class Typeinfo {
    private Integer id;

    private String tName;

    private String tPid;

    private String tUserid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }

    public String gettPid() {
        return tPid;
    }

    public void settPid(String tPid) {
        this.tPid = tPid == null ? null : tPid.trim();
    }

    public String gettUserid() {
        return tUserid;
    }

    public void settUserid(String tUserid) {
        this.tUserid = tUserid == null ? null : tUserid.trim();
    }
}