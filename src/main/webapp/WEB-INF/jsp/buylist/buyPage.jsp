<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/eshop"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<div id="main">
    <div class="row">
        <div class="col-8 offset-2">
            <div class="row mt-3">
                <div class="col-6 text-left h4 font-weight-bold">주문/결제</div>
                <div class="col-6 text-right">장바구니<i class="bi bi-chevron-right"></i><span class="font-weight-bold">주문/결제</span><i class="bi bi-chevron-right"></i>결제완료</div>
            </div>
            <div class="row"><div class="col-12" style="border-bottom: 1px solid grey;"></div></div>
            <div class="row mt-3" style="padding: 10px 0;background-color: RGB(246,246,246)">
                <div class="col-5 text-center">상품정보</div>
                <div class="col-2 text-center">브랜드</div>
                <div class="col-1 text-center">배송비</div>
                <div class="col-1 text-center">주문수량</div>
                <div class="col-1 text-center">할인액</div>
                <div class="col-2 text-center">상품금액(할인포함)</div>
            </div> <%--최상단 글정보--%>
            <div class="row align-items-center">
                <div class="col-5 text-center">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <img src="${thumbURL}54_20210304132330_DS0116.jpg" style="border-radius: 50%">
                        </div> <%--사진--%>
                        <div class="col-9 font-weight-bold text-left">여기엔 상품이름을 적습니다</div> <%--상품정보--%>
                    </div>
                </div>
                <div class="col-2 text-center">네스프레소</div>
                <div class="col-1 text-center">5000원</div>
                <div class="col-1 text-center">1개</div>
                <div class="col-1 text-center">(-) 5,500원</div>
                <div class="col-2">
                    <div class="row">
                        <div class="col-12 text-center">17000원</div> <%--할인전가격--%>
                        <div class="col-12 text-center">13700원</div> <%--할인후가격--%>
                    </div>
                </div>
            </div> <%--실제 상품정보 for each문 쓸것임--%>
            <div class="row">
                <div class="col-12" style="border-bottom: 1px dotted green;"></div>
            </div>

        </div>
    </div>
</div>