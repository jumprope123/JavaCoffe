package javaCoffe.spring.mvc.vo;

public class EshopVO {
    private int eno;
    private String title;
    private String brand;
    private int ogprice;
    private int dcprice;
    private int thumbs;
    private int salesVolumn;
    private int comment;
    private String regdate;
    private String bigGenre;
    private String smallGenre;
    private String code;
    private String simpleExplain;
    private String shipPay;
    private int stuck;
    private String fsizes;
    private String fnames;
    private String uuid;

    public EshopVO() {
    }

    public EshopVO(int eno, String title, String brand, int ogprice, int dcprice, int thumbs, int salesVolumn, int comment, String regdate, String bigGenre, String smallGenre, String code, String simpleExplain, String shipPay, int stuck, String fsizes, String fnames, String uuid) {
        this.eno = eno;
        this.title = title;
        this.brand = brand;
        this.ogprice = ogprice;
        this.dcprice = dcprice;
        this.thumbs = thumbs;
        this.salesVolumn = salesVolumn;
        this.comment = comment;
        this.regdate = regdate;
        this.bigGenre = bigGenre;
        this.smallGenre = smallGenre;
        this.code = code;
        this.simpleExplain = simpleExplain;
        this.shipPay = shipPay;
        this.stuck = stuck;
        this.fsizes = fsizes;
        this.fnames = fnames;
        this.uuid = uuid;
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

    public int getSalesVolumn() {
        return salesVolumn;
    }

    public void setSalesVolumn(int salesVolumn) {
        this.salesVolumn = salesVolumn;
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

    public String getBigGenre() {
        return bigGenre;
    }

    public void setBigGenre(String bigGenre) {
        this.bigGenre = bigGenre;
    }

    public String getSmallGenre() {
        return smallGenre;
    }

    public void setSmallGenre(String smallGenre) {
        this.smallGenre = smallGenre;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSimpleExplain() {
        return simpleExplain;
    }

    public void setSimpleExplain(String simpleExplain) {
        this.simpleExplain = simpleExplain;
    }

    public String getShipPay() {
        return shipPay;
    }

    public void setShipPay(String shipPay) {
        this.shipPay = shipPay;
    }

    public int getStuck() {
        return stuck;
    }

    public void setStuck(int stuck) {
        this.stuck = stuck;
    }

    public String getFsizes() {
        return fsizes;
    }

    public void setFsizes(String fsizes) {
        this.fsizes = fsizes;
    }

    public String getFnames() {
        return fnames;
    }

    public void setFnames(String fnames) {
        this.fnames = fnames;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
