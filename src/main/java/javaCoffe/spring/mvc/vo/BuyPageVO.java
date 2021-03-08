package javaCoffe.spring.mvc.vo;

public class BuyPageVO {
    private int buyno;
    private String fnames;
    private String brand;
    private String title;
    private int shipPay;
    private int purchase;
    private int discount;
    private int totalOgprice;
    private int totalDcprice;
    private String deliveryZipcode;
    private String deliveryUserAddr1;
    private String deliveryUserAddr2;
    private String deliveryUserAddr3;
    private String userid;
    private String orderUsername;
    private String orderUserphone;
    private String orderUseremail;
    private String orderRequest;
    private String receiveName;
    private String receivePhone;
    private String receiveEmail;
    private int beforePoint;
    private int buyPageUsePoints;
    private int plusPoint;
    private int afterFinalPrice;
    private int eno;
    private String process;

    public BuyPageVO() {
    }

    public BuyPageVO(int buyno, String fnames, String brand, String title, int shipPay, int purchase, int discount, int totalOgprice, int totalDcprice, String deliveryZipcode, String deliveryUserAddr1, String deliveryUserAddr2, String deliveryUserAddr3, String userid, String orderUsername, String orderUserphone, String orderUseremail, String orderRequest, String receiveName, String receivePhone, String receiveEmail, int beforePoint, int buyPageUsePoints, int plusPoint, int afterFinalPrice, int eno, String process) {
        this.buyno = buyno;
        this.fnames = fnames;
        this.brand = brand;
        this.title = title;
        this.shipPay = shipPay;
        this.purchase = purchase;
        this.discount = discount;
        this.totalOgprice = totalOgprice;
        this.totalDcprice = totalDcprice;
        this.deliveryZipcode = deliveryZipcode;
        this.deliveryUserAddr1 = deliveryUserAddr1;
        this.deliveryUserAddr2 = deliveryUserAddr2;
        this.deliveryUserAddr3 = deliveryUserAddr3;
        this.userid = userid;
        this.orderUsername = orderUsername;
        this.orderUserphone = orderUserphone;
        this.orderUseremail = orderUseremail;
        this.orderRequest = orderRequest;
        this.receiveName = receiveName;
        this.receivePhone = receivePhone;
        this.receiveEmail = receiveEmail;
        this.beforePoint = beforePoint;
        this.buyPageUsePoints = buyPageUsePoints;
        this.plusPoint = plusPoint;
        this.afterFinalPrice = afterFinalPrice;
        this.eno = eno;
        this.process = process;
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

    public int getShipPay() {
        return shipPay;
    }

    public void setShipPay(int shipPay) {
        this.shipPay = shipPay;
    }

    public int getPurchase() {
        return purchase;
    }

    public void setPurchase(int purchase) {
        this.purchase = purchase;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getTotalOgprice() {
        return totalOgprice;
    }

    public void setTotalOgprice(int totalOgprice) {
        this.totalOgprice = totalOgprice;
    }

    public int getTotalDcprice() {
        return totalDcprice;
    }

    public void setTotalDcprice(int totalDcprice) {
        this.totalDcprice = totalDcprice;
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

    public String getOrderUsername() {
        return orderUsername;
    }

    public void setOrderUsername(String orderUsername) {
        this.orderUsername = orderUsername;
    }

    public String getOrderUserphone() {
        return orderUserphone;
    }

    public void setOrderUserphone(String orderUserphone) {
        this.orderUserphone = orderUserphone;
    }

    public String getOrderUseremail() {
        return orderUseremail;
    }

    public void setOrderUseremail(String orderUseremail) {
        this.orderUseremail = orderUseremail;
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

    public int getBuyPageUsePoints() {
        return buyPageUsePoints;
    }

    public void setBuyPageUsePoints(int buyPageUsePoints) {
        this.buyPageUsePoints = buyPageUsePoints;
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

    public int getEno() {
        return eno;
    }

    public void setEno(int eno) {
        this.eno = eno;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }
}

/*
* buypage db

buyno 프라이머리키

fnames 사진
<input type="hidden" name="fnames" value="${evo.fnames}">

eno 사진번호
<input type="hidden" name="eno" value="${evo.eno}">

brand 판매자
<input type="hidden" name="brand" value="${evo.brand}">

title  상품이름
<input type="hidden" name="title" value="${evo.title}">

shipPay 배송비
<input type="hidden" name="shipPay" value="${evo.shipPay}">

purchase 수량
<input type="hidden" name="purchase" value="${salesCnt}">

discount 할인(원래가격 - 할인가격)
<input type="hidden" name="discount" value="${(evo.ogprice * salesCnt) - (evo.dcprice * salesCnt)}">

totalOgprice 원래가격
<input type="hidden" name="TotalOgprice" value="${evo.ogprice * salesCnt}">

totalDcprice 할인가격
<input type="hidden" name="totalDcprice" value="${evo.dcprice * salesCnt}">

deliveryZipcode 우편번호
<input type="text" id="sample6_postcode" class="form-control col-2" name="deliveryZipcode" placeholder="우편번호" value="${mvo.zipcode}" readonly >

deliveryUserAddr1
<input type="text" class="input_text zipsize col-4 form-control" name="deliveryUserAddr1" style="height: 2.5rem;" id="sample6_address" placeholder="주소" value="${mvo.userAddr1}" readonly><br>

deliveryUserAddr2
<input type="text" class="input_text zipsize col-3 form-control" name="deliveryUserAddr2" id="sample6_detailAddress"  value="${mvo.userAddr2}" placeholder="상세주소">

deliveryUserAddr3
<input type="text" class="input_text zipsize col-3 form-control" name="deliveryUserAddr3" id="sample6_extraAddress"  value="${mvo.userAddr3}" placeholder="추가주소">

userid 유저아이디
<input type="hidden" name="userid" value="testUserId">

orderUsername 주문자이름
<input class="form-control col-5" name="orderUsername" value="${mvo.name}" readonly>

orderUserphone 주문자전번
<input class="form-control col-5" name="orderUserphone" value="${mvo.phone}" readonly>

orderUseremail 주문자이메일
<input class="form-control col-5" name="orderUseremail" value="${mvo.email}" readonly>

orderRequest요청사항
<input type="text" class="form-control col-8" name="orderRequest" placeholder="20자이내로 간단하게 작성하세요.">

receiveName 받는분 이름
<input class="form-control col-5" name="receiveName" value="${mvo.name}">

receivePhone 받는분 전번
<input class="form-control col-5" name="receivePhone" value="${mvo.phone}">

receiveEmail 받는분 이메일
<input class="form-control col-5" name="receiveEmail" value="${mvo.email}">

beforePoint 원래 포인트
<input type="hidden" id="buyPagePoints" name="beforePoint" value="${mvo.points}">

buyPageUsePoints 사용포인트 (이거 나중에 포인트에서 빼야함)
<input type="number" class="col-3 form-control" id="buyPageUsePoints" name="buyPageUsePoints" value="0">

plusPoint 적립포인트 (이거 나중에 포인트에 더해줘야함)
<input type="hidden" name="plusPoint" value="${(evo.dcprice * salesCnt)/10}">

afterFinalPrice 최종결재금액
 <input type="hidden" id="afterFinalPrice" name="afterFinalPrice" value="${(evo.dcprice * salesCnt) + evo.shipPay}">

process 배송상황
//받는분 주소는 배송지주소와 동일*/