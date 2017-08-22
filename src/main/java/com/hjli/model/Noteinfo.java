package com.hjli.model;

public class Noteinfo {
    private Integer id;

    private String nTitle;

    private String nAddress;

    private String nMdtext;

    private String nContent;

    private String nNoteid;

    private String nTypeid;

    private String nDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getnTitle() {
        return nTitle;
    }

    public void setnTitle(String nTitle) {
        this.nTitle = nTitle == null ? null : nTitle.trim();
    }

    public String getnAddress() {
        return nAddress;
    }

    public void setnAddress(String nAddress) {
        this.nAddress = nAddress == null ? null : nAddress.trim();
    }

    public String getnMdtext() {
        return nMdtext;
    }

    public void setnMdtext(String nMdtext) {
        this.nMdtext = nMdtext == null ? null : nMdtext.trim();
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent == null ? null : nContent.trim();
    }

    public String getnNoteid() {
        return nNoteid;
    }

    public void setnNoteid(String nNoteid) {
        this.nNoteid = nNoteid == null ? null : nNoteid.trim();
    }

    public String getnTypeid() {
        return nTypeid;
    }

    public void setnTypeid(String nTypeid) {
        this.nTypeid = nTypeid == null ? null : nTypeid.trim();
    }

    public String getnDate() {
        return nDate;
    }

    public void setnDate(String nDate) {
        this.nDate = nDate == null ? null : nDate.trim();
    }
}