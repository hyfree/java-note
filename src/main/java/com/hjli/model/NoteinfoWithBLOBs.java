package com.hjli.model;

public class NoteinfoWithBLOBs extends Noteinfo {
    private String nMdtext;

    private String nContent;

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
}