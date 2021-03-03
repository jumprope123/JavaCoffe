package javaCoffe.spring.mvc.vo;

public class ReviewVO {
    private String rno;
    private String title;
    private String userid;
    private String regdate;
    private String views;
    private String thumbs;
    private String contents;
    private String fnames;
    private String fsizes;
    private String uuid;

    public ReviewVO() {
    }

    public ReviewVO(String rno, String title, String userid, String regdate, String views, String thumbs, String contents, String fnames, String fsizes, String uuid) {
        this.rno = rno;
        this.title = title;
        this.userid = userid;
        this.regdate = regdate;
        this.views = views;
        this.thumbs = thumbs;
        this.contents = contents;
        this.fnames = fnames;
        this.fsizes = fsizes;
        this.uuid = uuid;
    }

    public String getRno() {
        return rno;
    }

    public void setRno(String rno) {
        this.rno = rno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getThumbs() {
        return thumbs;
    }

    public void setThumbs(String thumbs) {
        this.thumbs = thumbs;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getFnames() {
        return fnames;
    }

    public void setFnames(String fnames) {
        this.fnames = fnames;
    }

    public String getFsizes() {
        return fsizes;
    }

    public void setFsizes(String fsizes) {
        this.fsizes = fsizes;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}