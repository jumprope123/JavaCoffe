<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
    ul.nav li.dropdown:hover > ul.dropdown-menu{display:block; margin:0;}
    .pd5 {padding: 5px}
</style>
<div id="main">
    <div class="row">
        <div class="col-2" style="margin-top: 150px;">
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
                        <div class="col-12">
                            <div class="row">
                                <p class="h5">상품 20개</p>
                            </div>
                            <div class="row mt-2" style="border-bottom: 1px solid black"></div> <%--선 구현--%>
                            <div class="row mt-1">
                                <div class="col-10">
                                <ul class="list-unstyled mt-1" style="display: block">
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">추천순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">판매인기순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">낮은가격순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">높은가격순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">상품평순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="#">등록일순</a></li>
                                </ul>
                                </div>
                                <div class="col-2">
                                    <select class="form-control">
                                        <option>20개씩 보기</option>
                                        <option>30개씩 보기</option>
                                        <option>40개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-1" style="border-bottom: 1px solid black"></div> <%--선 구현--%>
                            <div class="row mt-3">
                                <ul class="list-inline text-center">

                                    <c:forEach begin="0" end="19" step="1">
                                    <li class="list-inline-item" style="margin-bottom: 10px;">
                                        <div class="card" style="width: 230px; border: none;">
                                            <div class="text-center center" style="width: 230px; height: 150px; border: 1px solid #E0E0E0;">
                                                <img src="/img/eshop/list_maxwellMild.jpg" class="card-img-top" style="width: 150px; height: 145px; margin-top: 1px;">
                                            </div>
                                            <div class="card-body text-center" style="margin-top: -10px;">
                                                <p class="card-text font-weight-bold" style="color: #717188">맥스웰 마일드 커피믹스 900g</p>
                                                <p class="card-text" style="margin-top: 15px; color: #717188">[동서식품]</p>
                                                <p class="card-text" style="margin-top: 5px; color: #999999; text-decoration-line: line-through">4,000원</p>
                                                <p class="card-text h5 font-weight-bold">3,800원</p>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div> <%--콘텐츠 내용물 제작--%>
                        </div>
                    </div>
                    <div class="row mb-2"> <%--페이지네이션 시작--%>
                        <div class="col-12">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a href="#" class="page-link">이전</a>
                                </li>
                                <c:forEach var="i" begin="1" end="10" step="1">
                                <li class="page-item">
                                    <a href="#" class="page-link">${i}</a>
                                </li>
                                </c:forEach>
                                <li class="page-item">
                                    <a href="#" class="page-link">다음</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div> <%--section--%>
        <div class="col-2"></div><%--여기에는 장바구니나 방금본 목록같은거 둥둥띄워서 따라다니게 하기--%>
    </div>
</div>

