<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
    <link rel="stylesheet" href="/css/mybasket.css">
    <style>
        * {
            box-sizing: content-box !important;
        }
    </style>
</head>
<main id="middle" style="border-bottom: #5a6268 5px solid;">
    <div id="mb_wrap">
        <div class="cart_header">
            <a href="#"><img src="/img/mybasket/javapressologo.png" alt="로고입니다"></a>
        </div>
        <div id="mb_body">
            <div class="mb_body_header">
                <div class="cart_title">
                    <img style="vertical-align: top !important;" src="/img/mybasket/cart.png" alt="carticon">
                    <h1>장바구니</h1>
                </div>
                <div class="mb_list_header">
                    <ul class="mb_list_ul">
                        <li class="mb_list_item"><h3>01</h3><h2> 옵션선택 &nbsp;</h2></li>
                        <li class="mb_list_item"><h4>&nbsp;02</h4><h5> 장바구니</h5>
                            <img style="vertical-align: baseline !important;"  src="/img/mybasket/arow.png" alt="화살표"></li>
                        <li class="mb_list_item"><h3>&nbsp;03</h3><h2> 주문/결제 &nbsp;</h2></li>
                        <li class="mb_list_item"><h3>&nbsp;04</h3><h2> 주문완료 &nbsp;</h2></li>
                    </ul>
                </div>
            </div>
            <div class="mb_thead_wrap">
                <ul>
                    <li style="float:left; margin-top: 4px; margin-left: 20px;"><input type="checkbox"><h5 class="fs-13a" style="margin-left: 10px;">전체선택</h5></li>
                    <li style="float:left; margin-top: 4px; margin-left: 350px;"><h5 class="fs-13a">상품정보</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 40px;"><h5 class="fs-13a">배송비</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 60px;"><h5 class="fs-13a">상품금액</h5></li>
                </ul>
            </div>
        </div>
        <c:if test="${!empty sessionScope.UID}">
            <c:forEach var="mb" items="${mbvo}">
                <div class="mb_product_list">
                    <div class="mb_product_info">
                        <input class="mb_product_cb mt50" style="float:left;" type="checkbox">
                        <div class="mb_product_img" style="float:left; width: 120px; height: 120px;">
                            <a class="mb_product_link" href="#">
                                <img style="margin: 21px; width: 78px; height: 78px;" src="/img/mybasket/cart.png" alt="상품입니다.">
                            </a>
                        </div>
                        <ul class="mb_product_ul" style="float:left; width: 588px; height: 120px;">
                            <li class="mb_product_item_info mb_product_item_info_one1">
                                <a href="#" class="b-inline">
                                    <h3 id="mb_product_name">${mb.mypname}</h3></a></li>
                            <li class="mb_product_item_info mb_product_item_info_one2">
                                <h5 id="mb_product_arrival_date">금요일 3/25 도착 예정</h5>
                                <button class="mb_cancel_btn">&nbsp;X&nbsp;</button>
                                <h6 id="mb_product_total_price">&nbsp;${mb.myprice * mbamount}원&nbsp;</h6>
                                <select id="mb_item_amount">
                                    <fmt:parseNumber var="mbinit" value="${mb.mystuck}"/>
                                    <c:if test="${mb.mystuck gt 11}">
                                        <fmt:parseNumber var="mbinit" value="10"/>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${mbinit}" step="1">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                                <h6 id="mb_product_price" style="display: inline; float:right;">&nbsp;${mb.myprice}원&nbsp;</h6>
                            </li>
                        </ul>
                        <ul>
                            <li class="mb_product_item_info" style="width: 90px; height: 120px; float:right;">
                                <div style="text-align: center; margin-top: 50px;">
                                    <h5 id="mb_product_shipment_price">${mb.myshipPay}원</h5>
                                    <a href="#"><h5>묶음배송추가</h5><img style="width: 16px; height: 16px;" src="/img/mybasket/arow.png" alt="화살표"></a>
                                </div>
                            </li>

                            <li class="mb_product_item_info mb_product_item_info_two">
                                <div class="mt50">
                                    <h5 class="mb_product_total_price">${mb.myprice * mbamount}원</h5>
                                </div>
                            </li>
                        </ul>
                        <div class="mb_small_price_info">
                            <div style="margin-top: 10px; margin-right: 20px">
                                <h4 class="b-inline fs-14">상품가격 </h4><h2 class="b-inline fs-16" style="font-weight: 700;">${mb.myprice * mbamount}</h2><h3 class="b-inline fs-14">&nbsp;원 </h3> <h3 class="b-inline fs-16" style="font-weight: 700;"> + </h3>
                                <h4  class="b-inline fs-14"> 배송비 </h4><h2 class="b-inline fs-16"  style="font-weight: 700;">${mb.myshipPay}</h2><h3 class="b-inline fs-14">&nbsp;원 </h3> <h3 class="b-inline fs-16" style="font-weight: 700;"> = </h3>
                                <h4 class="b-inline fs-14"> 주문금액 </h4><h2 class="b-inline fs-16"  style="font-weight: 700;">${mb.myprice * mbamount + mb.myshipPay}</h2><h2 class="b-inline fs-14">&nbsp;원 </h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="mb_total_price_info">
                        <div style="margin-top: 10px; ">
                            <h4 class="b-inline fs-16">총 상품가격 </h4><h2 class="b-inline fs-20"> 0</h2><h3 class="b-inline fs-16">&nbsp;원 </h3> <h3 class="b-inline fs-20"> + </h3>
                            <h4 class="b-inline fs-16"> 총 배송비 </h4><h2 class="b-inline fs-20"> 0</h2><h3 class="b-inline fs-16">&nbsp;원 </h3> <h3 class="b-inline fs-20"> = </h3>
                            <h4 class="b-inline fs-16"> 총 주문금액</h4><h2 class="b-inline fs-20" style="color: red"> 0</h2><h2 class="b-inline fs-16">&nbsp;원 </h2>
                        </div>
                    </div>
                </div>
                <div class="mb_bottom_box">
                    <button class="mb_bottom_button" id ="going_shopping">계속 쇼핑하기</button>
                    <button class="mb_bottom_button" id ="going_buying">구매하기</button>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${empty sessionScope.UID}">
        <div class="mb_login_none_box">
            <div>
                <ul>
                    <li>
                        <img style="vertical-align: top !important;" class="b-inline" src="/img/mybasket/warning.png" alt="경고">
                        <h3 class="fs-20 b-inline" style="margin-bottom: 20px">장바구니에 담은 상품이 없습니다.</h3>
                    </li>
                    <li class="mt10">
                        <h4 class="fs-16 b-inline">로그인을 하시면, 장바구니에 보관된 상품을 확인하실 수 있습니다.</h4>&nbsp;&nbsp;
                        <button id="mb_login_btn" class="mb_login_btn">로그인 하기</button>
                    </li>
                </ul>
            </div>
        </div>
    </c:if>
</main>