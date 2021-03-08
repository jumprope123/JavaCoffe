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
<main id="middle">
    <div id="mb_wrap">
        <div class="cart_header">
            <a href="#"><img src="./img/javapressologo.png" alt="로고입니다"></a>
        </div>
        <div id="mb_body">
            <div class="mb_body_header">
                <div class="cart_title">
                    <img src="./img/cart.png" alt="carticon">
                    <h1>장바구니</h1>
                </div>
                <div class="mb_list_header">
                    <ul class="mb_list_ul">
                        <li class="mb_list_item"><h3>01</h3><h2> 옵션선택 &nbsp;</h2></li>
                        <li class="mb_list_item"><h4>&nbsp;02</h4><h5> 장바구니</h5>
                            <img src="./img/arow.png" alt="화살표"></li>
                        <li class="mb_list_item"><h3>&nbsp;03</h3><h2> 주문/결제 &nbsp;</h2></li>
                        <li class="mb_list_item"><h3>&nbsp;04</h3><h2> 주문완료 &nbsp;</h2></li>
                    </ul>
                </div>
            </div>
            <div style=" margin: 20px; background: #eee; height: 30px; border-top: #000 solid 1px; border-bottom: #000 solid 1px">
                <ul>
                    <li style="float:left; margin-top: 4px; margin-left: 20px;"><input type="checkbox"><h5 style="margin-left: 10px; font-weight: bold; font-size: 13px; display: inline">전체선택</h5></li>
                    <li style="float:left; margin-top: 4px; margin-left: 350px;"><h5 style=" font-weight: bold; font-size: 13px; display: inline">상품정보</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 40px;"><h5 style=" font-weight: bold; font-size: 13px; display: inline">배송비</h5></li>
                    <li style="float:right; margin-top: 4px; margin-right: 60px;"><h5 style=" font-weight: bold; font-size: 13px; display: inline">상품금액</h5></li>
                </ul>
            </div>
        </div>
        <div style="height: 120px; border-top: #95999c solid 1px; border-bottom: #95999c solid 1px; margin: 20px;" class="mb_product_list">
            <div class="mb_product_info">
                <input class="mb_product_cb" style="float:left;" type="checkbox">
                <div class="mb_product_img" style="float:left; width: 120px; height: 120px;">
                    <a class="mb_product_link" href="#">
                        <img style="margin: 21px; width: 78px; height: 78px;" src="./img/cart.png" alt="상품입니다.">
                    </a>
                </div>
                <ul class="mb_product_ul" style="float:left; width: 588px; height: 120px;">
                    <li class="mb_product_item_info" style="float:left; padding-top: 20px; border-bottom: #95999c solid 1px; border-right: #95999c solid 1px; width: 588px; height: 40px;"><a href="#" style="display: inline"><h3 id="mb_product_name" style="display: inline; font-weight: bold; font-size: 16px;">브리타 막스트라플러스 카트리지 정수기 필터, 3개</h3></a></li>
                    <li class="mb_product_item_info" style="float: left; padding-top: 10px; width: 588px; border-right: #95999c solid 1px;  height: 50px;">
                        <h5 id="mb_product_arrival_date" style="display: inline; float:left; margin-right: 100px;">금요일 3/25 도착 예정</h5>
                        <button style="float:right; margin-right: 10px;">x&nbsp;</button>
                        <h6 id="mb_product_total_price" style="display: inline; float:right;">&nbsp;19,000원&nbsp;</h6>
                        <select id="mb_item_amount" style="width: 52px; display: inline-block; float:right; margin-right: 50px; ">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <h6 id="mb_product_price" style="display: inline; float:right;">&nbsp;19,000원&nbsp;</h6>
                    </li>
                </ul>
                <ul>
                    <li class="mb_product_item_info" style="width: 90px; height: 120px; float:right;">
                        <h5 id="mb_product_shipment_price">0원</h5>
                        <h5>묶음배송추가</h5><img src="./img/arow.png" alt="화살표">
                    </li>

                    <li class="mb_product_item_info" style="width: 90px; height: 120px; float:right; border-right: #95999c solid 1px;">
                        <h5 class="mb_product_total_price">0원</h5>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <div>
                <h4>총 상품가격 </h4><h3> 0&nbsp;원 </h3> <h3> + </h3>
                <h4> 총 배송비 </h4><h3> 0&nbsp;원 </h3> <h3> = </h3>
                <h4> 총 주문금액</h4><h2> 0&nbsp;원 </h2>
            </div>
        </div>
        <div>
            <button>계속 쇼핑하기</button>
            <button>구매하기</button>
        </div>
    </div>
</main>