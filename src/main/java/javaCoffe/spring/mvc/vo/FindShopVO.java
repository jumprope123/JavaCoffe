package javaCoffe.spring.mvc.vo;

public class FindShopVO {
    private String sno;
    private String sname;
    private String address;
    private String jibeon;
    private String phone;
    private String lat;
    private String lng;

    public FindShopVO() {
    }

    public FindShopVO(String sname, String address, String jibeon, String phone) {
        this.sname = sname;
        this.address = address;
        this.jibeon = jibeon;
        this.phone = phone;
    }

    public FindShopVO(String lat, String lng) {
        this.lat = lat;
        this.lng = lng;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJibeon() {
        return jibeon;
    }

    public void setJibeon(String jibeon) {
        this.jibeon = jibeon;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }
}
