<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/eshop/_thumb/small_글번호_파일명 --%>
<c:set var="baseImgURL" value="http://localhost/eshop"/>
<%--<c:set var="baseImgURL" value="http://13.125.205.40:8447/eshop" />--%>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<style>
    ul.nav li.dropdown:hover > ul.dropdown-menu{display:block; margin:0;}
    .aHover:hover {box-shadow: 0 2px 0 0 red inset;}
</style>
<div id="main">
    <div class="row">
        <div class="col-2" style="margin-top: 150px;">
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em;">6만원이상 무료배송</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black" style="min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white " data-toggle="dropdown" style="font-size: 1.2em;">원두 | 커피믹스 | 스틱</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=coffe&smallGenre=bean&cp=1">원두</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=coffe&smallGenre=coffemix&cp=1">커피믹스</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=coffe&smallGenre=coffestick&cp=1">스틱</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">차류[티백/아이스티]</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=tea&smallGenre=teabag&cp=1">티백</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=tea&smallGenre=icetea&cp=1">아이스티</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">시럽 | 소스 | 파우더</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=syrup&smallGenre=syrub&cp=1">시럽</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=syrup&smallGenre=source&cp=1">소스</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=syrup&smallGenre=powder&cp=1">파우더</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">자판기 | 제빙기</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=vending&smallGenre=vendingmc&cp=1">자판기</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=vending&smallGenre=icemc&cp=1">제빙기</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">테이크아웃컵 | 페트컵</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=takeoutcup&smallGenre=takeoutcup&cp=1">테이크아웃컵</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=takeoutcup&smallGenre=petcup&cp=1">페트컵</a></li>
                    </ul>
                </li>
            </ul>
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em">수량별 묶음 배송</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black" style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">음료수 [캔/페트/병]</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=drink&smallGenre=fatcan&cp=1">뚱캔</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=drink&smallGenre=slimcan&cp=1">슬림캔</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=drink&smallGenre=pet&cp=1">페트</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=drink&smallGenre=bottle&cp=1">병음료</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">종이컵 | 일회용품</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=disposable&smallGenre=petcup&cp=1">페트컵</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=disposable&smallGenre=papercup&cp=1">종이컵</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=disposable&smallGenre=tissue&cp=1">화장지 | 냅킨</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=disposable&smallGenre=disposable&cp=1">일회용품</a></li>
                    </ul>
                </li>
            </ul>
            <p class="text-center text-danger font-weight-bold mt-2" style="font-size: 1.2em">냉동 식품</p>
            <ul class="nav .nav-pills nav-stacked justify-content-center">
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">볶음밥 | 만두 | 핫바</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food1&smallGenre=ricefry&cp=1">볶음밥</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food1&smallGenre=nuddle&cp=1">면 | 떡</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food1&smallGenre=dimsum&cp=1">만두</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food1&smallGenre=hotbar&cp=1">핫바 | 핫도그 | 치즈스틱</a></li>
                    </ul>
                </li>
                <li class="dropdown dropright text-center bg-black"  style=" min-width: 250px; padding: 10px 40px;">
                    <a class="dropdown-toggle font-weight-bold text-white" data-toggle="dropdown" style="font-size: 1.2em;">돈까스 | 감튀 | 어묵</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food2&smallGenre=porkcutlet&cp=1">돈까스</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food2&smallGenre=friedpotato&cp=1">감튀</a></li>
                        <li><a class="dropdown-item" href="/eshop/list?bigGenre=food2&smallGenre=fishcake&cp=1">어묵</a></li>
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
            <div class="row mt-5" style="max-width: 1300px">
                <div class="col-12">
                    <div class="row">
                        <div class="col-8 offset-1">
                            <div class="row" style="border-bottom: 1px solid RGB(222,222,222);"></div>
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">인기상품</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">기획상품</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">신상품</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">특별할인</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">임박상품</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">이벤트</a></li>
                                <li class="nav-item" style="color:RGB(222,222,222); margin-top: 22px;">|</li>
                                <li class="nav-item"><a class="nav-link p-4 aHover" href="#">공지사항</a></li>
                            </ul>
                            <div class="row" style="border-top: 1px solid RGB(222,222,222);"></div>
                        </div>
                        <div class="col-3 text-right">
                            <div class="btn-group">
                                <button class="btn btn-lg btn-danger text-white rounded-0" style="height: 68px;">고객센터</button>
                                <button class="btn btn-lg btn-dark text-white rounded-0" style="height: 68px">주문조회</button>
                            </div>
                        </div>
                    </div><%--인기상품/기획상품/신상품/특별할인/임박상품/이벤트/공지사항 /고객센터/주문조회 네비바--%>
                    <div class="row mt-2">
                        <div class="col-12 text-right font-weight-bold">
                            <input type="hidden" id="hiddenBigGenre" value="${viewData.bigGenre}">
                            <input type="hidden" id="hiddenSmallGenre" value="${viewData.smallGenre}">
                            <span>홈</span>
                            <span><i class="bi bi-chevron-right"></i></span>
                            <span id="spanBig"></span>
                            <span><i class="bi bi-chevron-right"></i></span>
                            <span id="spanSamll"></span>
                        </div>
                    </div><%--홈>음료수>뚱캔 네비바--%>
                    <div class="row" style="margin-top: 60px; margin-right: 15px;">
                        <div class="col-6 text-right">
                            <img src="${baseImgURL}/${fn:split(viewData.fnames,"[/]")[0]}" style="border: 1px solid RGB(222,222,222); max-width: 500px; max-height: 500px;"/>
                        </div>
                        <div class="col-5 offset-1">
                            <div class="row">
                                <div class="col-12" style="border-top: 2px solid black;"></div>
                            </div>
                            <div class="row">
                                <span class="h3 mt-2">${viewData.title}</span>
                            </div>
                            <div class="row">
                                <div class="col-12 mt-3" style="border-top: 1px solid gray;"></div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">정가</div>
                                <div class="col-10 text-left" style="text-decoration-line: line-through; color: RGB(172,172,172)">${viewData.ogprice}원</div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">판매가</div>
                                <div class="col-10 text-left"><span class="font-weight-bold" style="font-size: 1.2rem">${viewData.dcprice}</span>원</div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">배송비</div>
                                <div class="col-10 text-left">
                                    <c:if test="${viewData.shipPay eq 0}">무료배송</c:if>
                                    <c:if test="${viewData.shipPay ne 0}"><span>${viewData.shipPay}</span>원&nbsp;&nbsp;&nbsp;</c:if>
                                    <button id="popUpBoxBtn" class="p-1" style="background-color: white; border: 1px solid grey">조건별배송<i class="bi bi-chevron-down"></i></button>
                                </div>
                            </div>
                            <div id="popUpBox" class="row align-items-center" style="display: none;">
                                <div class="col-8 offset-3"  style="border: 1px solid black; background-color: white;">
                                    <div class="row align-items-center" style="background-color: RGB(244,244,244)">
                                        <div class="col-10">${viewData.title} 금액별배송비</div>
                                        <div class="col-2" style="margin-top: -10px"><i id="eshopViewXIcon" class="bi bi-x h1" style="cursor: pointer"></i></div>
                                    </div>
                                    <c:if test="${viewData.shipPay ne 0}">
                                        <div class="row mt-3">
                                            <div class="col-8">0원 이상 ~ 60,000원 미만</div>
                                            <div class="col-3">${viewData.shipPay}원</div>
                                        </div>
                                        <div class="row mt-3"><div class="col-10 offset-1" style="border-bottom: 1px solid RGB(222,222,222);"></div></div>
                                    </c:if>
                                    <c:if test="${viewData.shipPay eq 0}">
                                        <div class="row mt-3">
                                            <div class="col-8">무료배송</div>
                                        </div>
                                    </c:if>
                                    <c:if test="${viewData.shipPay ne 0}">
                                    <div class="row mt-3">
                                        <div class="col-8">60,000원 이상~</div>
                                        <div class="col-3">0원</div>
                                    </div>
                                    </c:if>
                                    <div class="row mt-3"><div class="col-10 offset-1" style="border-bottom: 1px solid RGB(222,222,222);"></div></div>
                                    <div class="row mt-3" style="padding: 0px 10px;">
                                      <span><i class="bi bi-exclamation-circle"></i>&nbsp;배송비 계산 기준 : 판매가 + 옵션가 + 추가상품가 + 텍스트옵션가 - 상품할인가 - 상품쿠폰할인가</span>
                                    </div>
                                </div>
                                <div class="col-3" style=" position:absolute; z-index: -1"></div>
                            </div>
                            <div class="row mt-2 align-items-center">
                                <div class="col-2 text-left font-weight-bold"></div>
                                <div class="col-10 text-left">
                                    <span>주문시 결제(선결제)</span>
                                </div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">상품코드</div>
                                <div class="col-10 text-left">
                                    <span>${viewData.code}</span>
                                </div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">재고</div>
                                <div class="col-10 text-left">
                                    <span>${viewData.stuck}개</span>
                                </div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">브랜드</div>
                                <div class="col-10 text-left">
                                    <span>${viewData.brand}</span>
                                </div>
                            </div>
                            <div class="row mt-4 align-items-center">
                                <div class="col-2 text-left font-weight-bold">간략설명</div>
                                <div class="col-10 text-left">
                                    <span>${viewData.simpleExplain}</span>
                                </div>
                            </div>
                            <form id="eshopViewForm" class="row form-group mt-3">
                                <input type="hidden" id="eshopUserid" name="userid" value="${UID}">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12" style="border-top: 1px solid RGB(233,233,233);"></div>
                                    </div>
                                    <div class="row pt-3 pb-3" style="background-color: RGB(245,245,245)">
                                        <div class="col-8">
                                            <div class="row font-weight-bold h5 pl-2">${viewData.title}</div>
                                            <button type="button" id="eshopCuponBtn" class="btn btn-sm bg-dark text-white" style="border: 1px solid red;">쿠폰적용</button>
                                        </div>
                                        <input type="hidden" id="eshopViewCode" name="eshopViewCode" value="${viewData.code}">
                                        <div class="col-3">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <input type="hidden" id="eshopHiddenStock" value="${viewData.stuck}"/>
                                                            <input class="form-control" type="text" id="eshopViewNum" name="eshopViewNum" value="1">
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="row"><button type="button" id="eshopUpBtn"><span style="border: 1px solid RGB(233,233,233);">&nbsp;<i class="bi bi-chevron-up"></i>&nbsp;</span></button></div>
                                                            <div class="row"><button type="button" id="eshopDownBtn"><span style="border: 1px solid RGB(233,233,233);">&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span></button></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-1">
                                                            <input type="hidden" id="priceForResult" name="priceForResult" value="${viewData.dcprice}">
                                                            <span id="eshopResultPrice" class="text-right ml-1 font-weight-bold">${viewData.dcprice}원</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="border-top: 2px solid black;"></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12 text-right">
                                            <span class="font-weight-bold">총 합계금액</span>&nbsp;&nbsp;
                                            <span id="ehsopFinalResultPrice" class="h3 font-weight-bold">${viewData.dcprice}</span>원
                                        </div>
                                    </div><%--가격2차--%>
                                    <div class="row">
                                        <div class="col-12 mt-5 text-right">
                                            <button type="button" id="eshopToBuyPageBtn" class="btn btn-lg btn-danger text-white" style="border-radius: 0px;">바로구매하기</button><%--바로구매하기--%>
                                            <button type="button" id="eshopToMybasketBtn" class="btn btn-lg btn-dark text-white" style="border-radius: 0px; margin: 0px 10px;">장바구니</button><%--장바구니--%>
                                            <button type="button" class="btn btn-lg btn-light text-dark" style="border-radius: 0px; box-shadow: 0px 0px 0px 2px black inset">찜리스트</button><%--찜리스트--%>
                                        </div>
                                    </div><%--하단버튼(바로구매하기/장바구니/찜리스트)--%>
                                </div>
                            </form>
                        </div>
                    </div><%--사진과 정보--%>
                    <div class="row">
                        <div class="col-10 offset-1 btn-group mt-5">
                            <button type="button" class="btn btn-light" onclick="javascript:jumpToImgExplain();">상품 상세정보</button>
                            <button type="button" class="btn btn-light" onclick="javascript:jumpToImgExchange();">배송/교환 관련</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10 offset-1 mt-1 text-center">
                            <img id="eshopExplainImg" src="/img/eshop/md_explain1.jpg"/>
                        </div>
                    </div><%--상품상세정보창1--%>
                    <div class="row">
                        <div class="col-10 offset-1 mt-1 text-center">
                            <img src="/img/eshop/md_explain2.jpg"/>
                        </div>
                    </div><%--상품상세정보창2--%>
                    <div class="row">
                        <div class="col-10 offset-1 btn-group mt-5">
                            <button type="button" class="btn btn-light" onclick="javascript:jumpToImgExplain();">상품 상세정보</button>
                            <button type="button" class="btn btn-light" onclick="javascript:jumpToImgExchange();">배송/교환 관련</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10 offset-1 mt-4 text-center">
                            <img id="eshopExchangeImg" src="/img/eshop/exchange.gif"/>
                        </div>
                    </div><%--배송교환안내창--%>
                </div>
            </div>
        </div>
    </div> <%--section--%>
    <div class="col-2"></div><%--여기에는 장바구니나 방금본 목록같은거 둥둥띄워서 따라다니게 하기--%>
    </div>
</div>

