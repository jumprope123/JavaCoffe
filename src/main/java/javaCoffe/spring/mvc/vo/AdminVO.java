package javaCoffe.spring.mvc.vo;

public class AdminVO {
    private int eno;
    private String title;
    private String brand;
    private int ogprice;
    private int dcprice;
    private int thumbs;
    private int salesVolume;
    private int comment;
    private String regdate;
    private String biggenre;
    private String smallgenre;
    private String code;
    private String explain;
    private String shippay;
    private int stuck;

    public AdminVO() {
    }

    public AdminVO(int eno, String title, String brand, int ogprice, int dcprice, int thumbs, int salesVolume, int comment, String regdate, String biggenre, String smallgenre, String code, String explain, String shippay, int stuck) {
        this.eno = eno;
        this.title = title;
        this.brand = brand;
        this.ogprice = ogprice;
        this.dcprice = dcprice;
        this.thumbs = thumbs;
        this.salesVolume = salesVolume;
        this.comment = comment;
        this.regdate = regdate;
        this.biggenre = biggenre;
        this.smallgenre = smallgenre;
        this.code = code;
        this.explain = explain;
        this.shippay = shippay;
        this.stuck = stuck;
    }

    public int getEno() {
        return eno;
    }

    public void setEno(int eno) {
        this.eno = eno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getOgprice() {
        return ogprice;
    }

    public void setOgprice(int ogprice) {
        this.ogprice = ogprice;
    }

    public int getDcprice() {
        return dcprice;
    }

    public void setDcprice(int dcprice) {
        this.dcprice = dcprice;
    }

    public int getThumbs() {
        return thumbs;
    }

    public void setThumbs(int thumbs) {
        this.thumbs = thumbs;
    }

    public int getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(int salesVolume) {
        this.salesVolume = salesVolume;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getBiggenre() {
        return biggenre;
    }

    public void setBiggenre(String biggenre) {
        this.biggenre = biggenre;
    }

    public String getSmallgenre() {
        return smallgenre;
    }

    public void setSmallgenre(String smallgenre) {
        this.smallgenre = smallgenre;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public String getShippay() {
        return shippay;
    }

    public void setShippay(String shippay) {
        this.shippay = shippay;
    }

    public int getStuck() {
        return stuck;
    }

    public void setStuck(int stuck) {
        this.stuck = stuck;
    }
}
