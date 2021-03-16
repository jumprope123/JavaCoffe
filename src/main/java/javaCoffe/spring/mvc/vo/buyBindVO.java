package javaCoffe.spring.mvc.vo;

public class buyBindVO {
    private String eno; // 사진을 위한 eno
    private String fnames; // 사진을 위한 fnames
    private String brand; //브랜드
    private String title; //제목
    private String shipPay; // 배송비(묶음이지만 각각 적어주기)
    private String purchase; // 개별 구매 수량
    private String discount; // 개별 할인액
    private String dcPrice ; // 개별 할인 후 금액
    private String ogPrice; //개별 할인전 금액
    private String mycode; // 상품 코드

    public buyBindVO() {
    }

    public buyBindVO(String eno, String fnames, String title, String shipPay, String purchase) {
        this.eno = eno;
        this.fnames = fnames;
        this.title = title;
        this.shipPay = shipPay;
        this.purchase = purchase;
    }

    public buyBindVO(String eno, String fnames, String brand, String title, String shipPay, String purchase, String discount, String dcPrice, String ogPrice, String mycode) {
        this.eno = eno;
        this.fnames = fnames;
        this.brand = brand;
        this.title = title;
        this.shipPay = shipPay;
        this.purchase = purchase;
        this.discount = discount;
        this.dcPrice = dcPrice;
        this.ogPrice = ogPrice;
        this.mycode = mycode;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getFnames() {
        return fnames;
    }

    public void setFnames(String fnames) {
        this.fnames = fnames;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShipPay() {
        return shipPay;
    }

    public void setShipPay(String shipPay) {
        this.shipPay = shipPay;
    }

    public String getPurchase() {
        return purchase;
    }

    public void setPurchase(String purchase) {
        this.purchase = purchase;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getDcPrice() {
        return dcPrice;
    }

    public void setDcPrice(String dcPrice) {
        this.dcPrice = dcPrice;
    }

    public String getOgPrice() {
        return ogPrice;
    }

    public void setOgPrice(String ogPrice) {
        this.ogPrice = ogPrice;
    }

    public String getMycode() {
        return mycode;
    }

    public void setMycode(String mycode) {
        this.mycode = mycode;
    }
}
