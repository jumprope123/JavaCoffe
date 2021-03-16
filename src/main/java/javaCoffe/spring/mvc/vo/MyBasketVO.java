package javaCoffe.spring.mvc.vo;

public class MyBasketVO {
    private String mbno;
    private String mycode;
    private String mystuck;
    private String myprice;
    private String myuuid;
    private String myshipPay;
    private String mypname;
    private String myamount;
    private String myfnames;
    private String myeno;
    private String mybrand;
    private String myogprice;
    private String mydiscount;

    public String getMydiscount() {
        return mydiscount;
    }

    public void setMydiscount(String mydiscount) {
        this.mydiscount = mydiscount;
    }

    public String getMyogprice() {
        return myogprice;
    }

    public void setMyogprice(String myogprice) {
        this.myogprice = myogprice;
    }

    public String getMybrand() {
        return mybrand;
    }

    public void setMybrand(String mybrand) {
        this.mybrand = mybrand;
    }

    public MyBasketVO(String mbno, String myamount) {
        this.mbno = mbno;
        this.myamount = myamount;
    }

    public String getMbno() {
        return mbno;
    }

    public void setMbno(String mbno) {
        this.mbno = mbno;
    }

    public String getMycode() {
        return mycode;
    }

    public void setMycode(String mycode) {
        this.mycode = mycode;
    }

    public String getMystuck() {
        return mystuck;
    }

    public void setMystuck(String mystuck) {
        this.mystuck = mystuck;
    }

    public String getMyprice() {
        return myprice;
    }

    public void setMyprice(String myprice) {
        this.myprice = myprice;
    }

    public String getMyuuid() {
        return myuuid;
    }

    public void setMyuuid(String myuuid) {
        this.myuuid = myuuid;
    }

    public String getMyshipPay() {
        return myshipPay;
    }

    public void setMyshipPay(String myshipPay) {
        this.myshipPay = myshipPay;
    }

    public String getMypname() {
        return mypname;
    }

    public void setMypname(String mypname) {
        this.mypname = mypname;
    }

    public String getMyamount() {
        return myamount;
    }

    public void setMyamount(String myamount) {
        this.myamount = myamount;
    }

    public String getMyfnames() {
        return myfnames;
    }

    public void setMyfnames(String myfnames) {
        this.myfnames = myfnames;
    }

    public String getMyeno() {
        return myeno;
    }

    public void setMyeno(String myeno) {
        this.myeno = myeno;
    }
}
