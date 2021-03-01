<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%--페이지당 게시물 수 20개로 설정--%>
<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="20"/>
<fmt:parseNumber var="bigGenreCnt" value="${bigGenreCnt}"/>

<fmt:parseNumber var="sp" value="${((cp-1) / 10)}" integerOnly="true"/>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${bigGenreCnt/pp}" integerOnly="true"/>
<c:if test="${(bigGenreCnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<fmt:parseNumber var="snum" value="${bigGenreCnt - (cp - 1) * pp}" integerOnly="true"/>

<c:set var="navlnk" value="/eshop/list?bigGenre=${param.bigGenre}&cp="/>

<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/eshop"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

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
                        <h3 class="h3 font-weight-bold"><i class="bi bi-cup-straw bidragup"></i>&nbsp;E-shop(회원전용)</h3>
                    </div>
                    <div class="row d-flex mt-3">
                        <button id="eshop1btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'coffe'}">btn-success</c:if>" style="border: 1px solid black;">원두|커피믹스|스틱</button>
                        <button id="eshop2btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'tea'}">btn-success</c:if>" style="border: 1px solid black;">차류[티백/아이스티]</button>
                        <button id="eshop3btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'syrup'}">btn-success</c:if>" style="border: 1px solid black;">시럽|소스|파우더</button>
                        <button id="eshop4btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'vending'}">btn-success</c:if>" style="border: 1px solid black;">자판기|제빙기</button>
                        <button id="eshop5btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'takeoutcup'}">btn-success</c:if>" style="border: 1px solid black;">테이크아웃컵|페트컵</button>
                    </div>
                    <div class="row d-flex mt-1">
                        <button id="eshop6btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'drink'}">btn-success</c:if>" style="border: 1px solid black;">음료수[캔/페트/병]</button>
                        <button id="eshop7btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'disposable'}">btn-success</c:if>" style="border: 1px solid black;">종이컵|일회용품</button>
                        <button id="eshop8btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'food1'}">btn-success</c:if>" style="border: 1px solid black;">볶음밥|만두|핫바</button>
                        <button id="eshop9btn" class="btn flex-fill mr-1 <c:if test="${param.bigGenre eq 'food2'}">btn-success</c:if>" style="border: 1px solid black;">돈까스|감튀|어묵</button>
                    </div>
                    <div class="row" style="margin-top: 50px;">
                        <div class="col-12">
                            <div class="row">
                                <p class="h5">상품 ${bigGenreCnt}개</p>
                            </div>
                            <div class="row mt-2" style="border-bottom: 1px solid black"></div> <%--선 구현--%>
                            <div class="row mt-1">
                                <div class="col-10">
                                <ul class="list-unstyled mt-1" style="display: block">
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listByThumbs?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">추천순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listBySalesVolumn?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">판매인기순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listByCheap?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">낮은가격순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listByExpensive?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">높은가격순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listByComment?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">상품평순</a></li>
                                    <li class="list-inline-item font-weight-bold pd5 mr-4"><a href="/eshop/listByRegdate?bigGenre=${param.bigGenre}&smallGenre=${param.smallGenre}&cp=1">등록일순</a></li>
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

                                    <c:forEach var="b" items="${bigGenres}">
                                    <li class="list-inline-item" style="margin-bottom: 10px;">
                                        <div class="card" style="width: 230px; border: none;">
                                            <div class="text-center center" style="width: 230px; height: 150px; border: 1px solid #E0E0E0;">
                                                <img src="${thumbURL}${b.eno}_${fn:split(b.fnames,"[/]")[0]}" class="card-img-top" style="width: 150px; height: 145px; margin-top: 1px;">
                                            </div>
                                            <div class="card-body text-center" style="margin-top: -10px;">
                                                <p class="card-text font-weight-bold" style="color: #717188">${b.title}</p>
                                                <p class="card-text" style="margin-top: 15px; color: #717188">[${b.brand}]</p>
                                                <p class="card-text" style="margin-top: 5px; color: #999999; text-decoration-line: line-through">${b.ogprice}원</p>
                                                <p class="card-text h5 font-weight-bold">${b.dcprice}원</p>
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

                                <%--'이전'이 표시되어야 할 때는 cp > 10 --%>
                                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                                    <a href="${navlnk}${sp - 10}" class="page-link">이전</a></li>

                                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                                    <c:if test="${i le tp}">
                                        <c:if test="${i ne cp}">
                                            <li class="page-item"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                                        </c:if>
                                        <c:if test="${i eq cp}">
                                            <li class="page-item active"><a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                                <%--'다음'이 표시되어야 할 때는 ?--%>
                                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                                    <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
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

<%--
데이터베이스 내용
데이터베이스 내용
string	eno	alternate key	autoincrement
string	title	제품이름
string	brand	제조사
int	ogprice	할인전 가격
int	dcprice	할인후가격
int	thumbs	추천수
int	salesVolume	판매수
int	comment	상품평수
String	regdate	등록일	timestamp
string	biggenre	대분류
string	smallgenre	소분류
string	code	상품코드	primary
string	explain	간략설명
String	shippay	배송비
int	stuck	재고

--%>