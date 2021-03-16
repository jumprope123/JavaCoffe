package javaCoffe.spring.mvc.vo;

public class BuyPageBind {
    private int buyno;
    private String fnames;
    private String brand;
    private String title;
    private String shipPay;
    private String purchase;
    private String discount;
    private String totalOgPrice;
    private String totalDcPrice;
    private String eno;
    private String deliveryZipcode;
    private String deliveryUserAddr1;
    private String deliveryUserAddr2;
    private String deliveryUserAddr3;
    private String userid;
    private String orderUserName;
    private String orderUserPhone;
    private String orderUserEmail;
    private String orderRequest;
    private String receiveName;
    private String receivePhone;
    private String receiveEmail;
    private int beforePoint;
    private int buyPageUserPoints;
    private int plusPoint;
    private int afterFinalPrice;
    private String process;

    public BuyPageBind() {
    }

    public BuyPageBind(String fnames, String brand, String title, String shipPay, String purchase, String discount, String totalOgPrice, String totalDcPrice, String eno, String deliveryZipcode, String deliveryUserAddr1, String deliveryUserAddr2, String deliveryUserAddr3, String userid, String orderUserName, String orderUserPhone, String orderUserEmail, String orderRequest, String receiveName, String receivePhone, String receiveEmail, int beforePoint, int buyPageUserPoints, int plusPoint, int afterFinalPrice) {
        this.fnames = fnames;
        this.brand = brand;
        this.title = title;
        this.shipPay = shipPay;
        this.purchase = purchase;
        this.discount = discount;
        this.totalOgPrice = totalOgPrice;
        this.totalDcPrice = totalDcPrice;
        this.eno = eno;
        this.deliveryZipcode = deliveryZipcode;
        this.deliveryUserAddr1 = deliveryUserAddr1;
        this.deliveryUserAddr2 = deliveryUserAddr2;
        this.deliveryUserAddr3 = deliveryUserAddr3;
        this.userid = userid;
        this.orderUserName = orderUserName;
        this.orderUserPhone = orderUserPhone;
        this.orderUserEmail = orderUserEmail;
        this.orderRequest = orderRequest;
        this.receiveName = receiveName;
        this.receivePhone = receivePhone;
        this.receiveEmail = receiveEmail;
        this.beforePoint = beforePoint;
        this.buyPageUserPoints = buyPageUserPoints;
        this.plusPoint = plusPoint;
        this.afterFinalPrice = afterFinalPrice;
    }

    public int getBuyno() {
        return buyno;
    }

    public void setBuyno(int buyno) {
        this.buyno = buyno;
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

    public String getTotalOgPrice() {
        return totalOgPrice;
    }

    public void setTotalOgPrice(String totalOgPrice) {
        this.totalOgPrice = totalOgPrice;
    }

    public String getTotalDcPrice() {
        return totalDcPrice;
    }

    public void setTotalDcPrice(String totalDcPrice) {
        this.totalDcPrice = totalDcPrice;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getDeliveryZipcode() {
        return deliveryZipcode;
    }

    public void setDeliveryZipcode(String deliveryZipcode) {
        this.deliveryZipcode = deliveryZipcode;
    }

    public String getDeliveryUserAddr1() {
        return deliveryUserAddr1;
    }

    public void setDeliveryUserAddr1(String deliveryUserAddr1) {
        this.deliveryUserAddr1 = deliveryUserAddr1;
    }

    public String getDeliveryUserAddr2() {
        return deliveryUserAddr2;
    }

    public void setDeliveryUserAddr2(String deliveryUserAddr2) {
        this.deliveryUserAddr2 = deliveryUserAddr2;
    }

    public String getDeliveryUserAddr3() {
        return deliveryUserAddr3;
    }

    public void setDeliveryUserAddr3(String deliveryUserAddr3) {
        this.deliveryUserAddr3 = deliveryUserAddr3;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getOrderUserName() {
        return orderUserName;
    }

    public void setOrderUserName(String orderUserName) {
        this.orderUserName = orderUserName;
    }

    public String getOrderUserPhone() {
        return orderUserPhone;
    }

    public void setOrderUserPhone(String orderUserPhone) {
        this.orderUserPhone = orderUserPhone;
    }

    public String getOrderUserEmail() {
        return orderUserEmail;
    }

    public void setOrderUserEmail(String orderUserEmail) {
        this.orderUserEmail = orderUserEmail;
    }

    public String getOrderRequest() {
        return orderRequest;
    }

    public void setOrderRequest(String orderRequest) {
        this.orderRequest = orderRequest;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public String getReceivePhone() {
        return receivePhone;
    }

    public void setReceivePhone(String receivePhone) {
        this.receivePhone = receivePhone;
    }

    public String getReceiveEmail() {
        return receiveEmail;
    }

    public void setReceiveEmail(String receiveEmail) {
        this.receiveEmail = receiveEmail;
    }

    public int getBeforePoint() {
        return beforePoint;
    }

    public void setBeforePoint(int beforePoint) {
        this.beforePoint = beforePoint;
    }

    public int getBuyPageUserPoints() {
        return buyPageUserPoints;
    }

    public void setBuyPageUserPoints(int buyPageUserPoints) {
        this.buyPageUserPoints = buyPageUserPoints;
    }

    public int getPlusPoint() {
        return plusPoint;
    }

    public void setPlusPoint(int plusPoint) {
        this.plusPoint = plusPoint;
    }

    public int getAfterFinalPrice() {
        return afterFinalPrice;
    }

    public void setAfterFinalPrice(int afterFinalPrice) {
        this.afterFinalPrice = afterFinalPrice;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }
}
