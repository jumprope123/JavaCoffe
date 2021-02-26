<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    ul.nav li.dropdown:hover > ul.dropdown-menu{display:block; margin:0;}
</style>
<div id="main">
    <div class="row">
        <div class="col-2 mt-4">
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em;">6만원이상 무료배송</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black" style="min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white " data-toggle="dropdown" style="font-size: 1.2em;">원두 | 커피믹스 | 스틱</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">원두</a></li>
                        <li><a class="dropdown-item" href="#">커피믹스</a></li>
                        <li><a class="dropdown-item" href="#">스틱</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">차류[티백/아이스티]</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">티백</a></li>
                        <li><a class="dropdown-item" href="#">아이스티</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">시럽 | 소스 | 파우더</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">시럽</a></li>
                        <li><a class="dropdown-item" href="#">소스</a></li>
                        <li><a class="dropdown-item" href="#">파우더</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">자판기 | 제빙기</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">자판기</a></li>
                        <li><a class="dropdown-item" href="#">제빙기</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">테이크아웃컵 | 페트컵</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">테이크아웃컵</a></li>
                        <li><a class="dropdown-item" href="#">페트컵</a></li>
                    </ul>
                </li>
            </ul>
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em">수량별 묶음 배송</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black" s style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">음료수 [캔/페트/병]</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">뚱캔</a></li>
                        <li><a class="dropdown-item" href="#">슬림캔</a></li>
                        <li><a class="dropdown-item" href="#">페트</a></li>
                        <li><a class="dropdown-item" href="#">병음료</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">종이컵 | 일회용품</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">페트컵</a></li>
                        <li><a class="dropdown-item" href="#">종이컵</a></li>
                        <li><a class="dropdown-item" href="#">화장지 | 냅킨</a></li>
                        <li><a class="dropdown-item" href="#">일회용품</a></li>
                    </ul>
                </li>
            </ul>
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em">냉동 식품</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">볶음밥 | 만두 | 핫바</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">볶음밥</a></li>
                        <li><a class="dropdown-item" href="#">면 | 떡</a></li>
                        <li><a class="dropdown-item" href="#">만두</a></li>
                        <li><a class="dropdown-item" href="#">핫바 | 핫도그 | 치즈스틱</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">돈까스 | 감튀 | 어묵</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">돈까스</a></li>
                        <li><a class="dropdown-item" href="#">감튀</a></li>
                        <li><a class="dropdown-item" href="#">어묵</a></li>
                    </ul>
                </li>
            </ul>

            <div class="mt-2">
                <a href="#" style="margin-left: 40px;"><img src="/img/eshop/kanu.jpg" alt="카누" title="카누광고 기다립니다^^"></a>
            </div>
            <div class="mt-2">
                <a href="#" style="margin-left: 40px"><img src="/img/eshop/coca.jpg" alt="콜라" title="콜라광고 기다립니다^^"></a>
            </div>
        </div> <%--aside--%>
        <div class="col-8">
            <div class="row" style="max-width: 1300px">
                <div class="col-12">
                    <div class="row mt-4">
                        <h3 class="h3"><i class="bi bi-cup-straw bidragup"></i>&nbsp;로스팅원두 | 드립백</h3>
                    </div>
                    <div class="row d-flex mt-3">
                        <button id="eshop1btn" class="btn flex-fill mr-1" style="border: 1px solid black;">로스팅원두 | 드립백</button>
                        <button id="eshop2btn" class="btn flex-fill mr-1" style="border: 1px solid black;">자판기믹스</button>
                        <button id="eshop3btn" class="btn flex-fill mr-1" style="border: 1px solid black;">설탕커피</button>
                        <button id="eshop4btn" class="btn flex-fill mr-1" style="border: 1px solid black;">일회용커피</button>
                        <button id="eshop5btn" class="btn flex-fill mr-1" style="border: 1px solid black;">프림설탕</button>
                    </div>
                    <div class="row" style="margin-top: 50px;">

                        <p>상품 3개</p>

                        <ul class="list-unstyled">
                            <li class="list-inline-item">추천순</li>
                            <li class="list-inline-item">판매인기순</li>
                            <li class="list-inline-item">낮은가격순</li>
                            <li class="list-inline-item">높은가격순</li>
                            <li class="list-inline-item">상품평순</li>
                            <li class="list-inline-item">등록일순</li>
                        </ul>


                    </div>
                </div>
            </div>
            <div class="row"></div>
        </div> <%--section--%>
        <div class="col-2"></div><%--여기에는 장바구니나 방금본 목록같은거 둥둥띄워서 따라다니게 하기--%>
    </div>
</div>

