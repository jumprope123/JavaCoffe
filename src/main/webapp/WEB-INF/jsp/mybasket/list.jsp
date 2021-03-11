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
                    <li style="float:left; margin-top: 4px; margin-left: 20px;"><input id="total_list_select_check" type="checkbox"><h5 class="fs-13a" style="margin-left: 10px;">전체선택</h5></li>
                    <li id="all_product_remove_li" style="display: none; float:left; margin-top: 4px; margin-left: 20px;"><button style="background:#fff; width: 60px; height: 20px; border: #5a6268 1px solid; border-radius: 3px; :hover {background:#e4606d; color:#fff;}" id="all_product_remove_btn">전체삭제</button></li>
                    <li id="small_move_mb_center" style="float:left; margin-top: 4px; margin-left: 295px;"><h5 class="fs-13a">상품정보</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 40px;"><h5 class="fs-13a">배송비</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 60px;"><h5 class="fs-13a">상품금액</h5></li>
                </ul>
            </div>
        </div>
        <div class="list_mb_wrap">
        <c:if test="${!empty sessionScope.UID}">
            <fmt:parseNumber var="mbnum" value="0"/>
            <fmt:parseNumber var="mbtotalprice" value="0"/>
            <fmt:parseNumber var="mbtotalshipPay" value="0"/>
            <fmt:parseNumber var="totalstatic_product" value="0"/>
            <fmt:parseNumber var="totaltemp_product" value="0"/>
            <fmt:parseNumber var="totalstatic_shipPay" value="0"/>
            <fmt:parseNumber var="totaltemp_shipPay" value="0"/>
            <c:forEach var="mb" items="${mbvo}">
                <c:set var="mbnum" value="${mbnum+1}" />
                <c:set var="mbtotalprice" value="${mbtotalprice + mb.myprice}" />
                <c:set var="mbtotalshipPay" value="${mbtotalshipPay + mb.myshipPay}" />
                <div class="mb_product_list">
                    <div class="mb_product_info">
                        <input name="mb_product_cb" id="mb_product_cb${mbnum}" class="mb_product_cb mt50" style="float:left;" type="checkbox">
                        <div class="mb_product_img" style="float:left; width: 120px; height: 120px;">
                            <a class="mb_product_link" href="#">
                                <img style="margin: 21px; width: 78px; height: 78px;" src="/img/mybasket/cart.png" alt="상품입니다.">
                            </a>
                        </div>
                        <ul class="mb_product_ul" style="float:left; width: 588px; height: 120px;">
                            <li class="mb_product_item_info mb_product_item_info_one1">
                                <a href="#" class="b-inline">
                                    <p style="display: none" id="mb_product_mbno${mbnum}">${mb.mbno}</p>
                                    <h3 class="mb_product_name" id="mb_product_name${mbnum}">${mb.mypname}</h3></a></li>
                            <li class="mb_product_item_info mb_product_item_info_one2">
                                <h5 style="font-size: 12px; color: #34ce57" class="mb_product_arrival_date" id="mb_product_arrival_date${mbnum}"></h5>
                                <button id="mb_cancel_btn${mbnum}" class="mb_cancel_btn">&nbsp;X&nbsp;</button>
                                <h6 class="mb_product_total_price" id="mb_product_total_price${mbnum}">&nbsp;${mb.myprice * mb.myamount}원&nbsp;</h6>
                                <select class="mb_item_amount" id="mb_item_amount${mbnum}">
                                    <fmt:parseNumber var="mbinit" value="${mb.mystuck}"/>
                                    <c:if test="${mb.mystuck gt 11}">
                                        <fmt:parseNumber var="mbinit" value="10"/>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${mb.myamount-1}" step="1">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                    <option value="${mb.myamount}" selected>${mb.myamount}</option>
                                    <c:forEach var="i" begin="${mb.myamount + 1}" end="${mbinit}" step="1">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                                <h6 class="mb_product_price" id="mb_product_price${mbnum}" style="display: inline; float:right;">&nbsp;${mb.myprice}원&nbsp;</h6>
                            </li>
                        </ul>
                        <ul>
                            <li class="mb_product_item_info" style="width: 90px; height: 120px; float:right;">
                                <div style="text-align: center; margin-top: 50px;">
                                    <h5 class="mb_product_shipment_price" id="mb_product_shipment_price${mbnum}">${mb.myshipPay}원</h5>
                                    <a href="#"><h5>묶음배송추가</h5><img style="width: 16px; height: 16px;" src="/img/mybasket/arow.png" alt="화살표"></a>
                                </div>
                            </li>

                            <li class="mb_product_item_info mb_product_item_info_two">
                                <div class="mt50">
                                    <h5 id="mb_product_total_price${mbnum}" class="mb_product_total_price">${mb.myprice * mb.myamount}원</h5>
                                </div>
                            </li>
                        </ul>
                        <div class="mb_small_price_info">
                            <div style="margin-top: 10px; margin-right: 20px">
                                <c:set var="totaltemp_product" value="${mb.myprice * mb.myamount}" />
                                <c:set var="totaltemp_shipPay" value="${mb.myshipPay}" />
                                <h4 class="b-inline fs-14">상품가격 </h4><h2 class="b-inline fs-16" id="mb_product_info_price${mbnum}" style="font-weight: 700;">${mb.myprice * mb.myamount}</h2><h3 class="b-inline fs-14">&nbsp;원 </h3> <h3 class="b-inline fs-16" style="font-weight: 700;"> + </h3>
                                <h4  class="b-inline fs-14"> 배송비 </h4><h2 class="b-inline fs-16" id="mb_product_info_shipPay${mbnum}" style="font-weight: 700;">${mb.myshipPay}</h2><h3 class="b-inline fs-14">&nbsp;원 </h3> <h3 class="b-inline fs-16" style="font-weight: 700;"> = </h3>
                                <h4 class="b-inline fs-14"> 주문금액 </h4><h2 class="b-inline fs-16" id="mb_product_info_totalprice${mbnum}" style="font-weight: 700;">${totaltemp_product + totaltemp_shipPay}</h2><h2 class="b-inline fs-14">&nbsp;원 </h2>
                                <c:set var="totalstatic_product" value="${totalstatic_product + totaltemp_product}" />
                                <c:set var="totalstatic_shipPay" value="${totalstatic_shipPay + totaltemp_shipPay}" />
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </c:if>
        <c:if test="${!empty sessionScope.UID}">
            <div>
                <div class="mb_total_price_info">
                    <div style="margin-top: 10px; ">
                        <h4 class="b-inline fs-16">총 상품가격 </h4><h2 id="total_mb_product_price" class="b-inline fs-20"> ${totalstatic_product}</h2><h3 class="b-inline fs-16">&nbsp;원 </h3> <h3 class="b-inline fs-20"> + </h3>
                        <h4 class="b-inline fs-16"> 총 배송비 </h4><h2 id="total_mb_shipPay_price" class="b-inline fs-20"> ${totalstatic_shipPay}</h2><h3 class="b-inline fs-16">&nbsp;원 </h3> <h3 class="b-inline fs-20"> = </h3>
                        <h4 class="b-inline fs-16"> 총 주문금액</h4><h2 id="total_mb_order_price"  class="b-inline fs-20" style="color: red"> ${totalstatic_shipPay + totalstatic_product}</h2><h2 class="b-inline fs-16">&nbsp;원 </h2>
                    </div>
                </div>
            </div>
            <div class="mb_bottom_box">
                <button class="mb_bottom_button" id ="going_shopping">계속 쇼핑하기</button>
                <button class="mb_bottom_button" id ="going_buying">구매하기</button>
            </div>
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
            <p style="display: none" id="mbnum_result">${mbnum}</p>
        </div>
    </div>
</main>