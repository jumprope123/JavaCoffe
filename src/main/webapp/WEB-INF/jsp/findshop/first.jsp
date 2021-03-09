<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
    <link rel="stylesheet" href="/css/find.css">
    <style>
        * {
            box-sizing: content-box !important;
        }
    </style>
</head>

<main id="middle">
    <div class="map_wrapper">
        <div id="video_area">
            <video autoplay="autoplay" id="background_video" loop="loop" muted="muted" preload="auto" src="../video/mapbgv1.mp4" volume="0"></video>
        </div>
        <div class="map_title">
            <p>매장 찾기</p>
            <h2>이용 목적에 맞는 매장 찾기</h2>
        </div>
        <div class="adress_input_box" id="adress_input_box">
            <div class="box_wrap">
                <div class="tabs">
                    <ul id="shops" role="tablist">
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="캡슐 구매" src="../img/find/capsulecoffee.png">
                                    </span>
                                    <span class="label">캡슐 구매</span>
                                </a>
                            </h2>
                        </li>
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="머신 구매" src="../img/find/coffeemaker.png">
                                    </span>
                                    <span class="label">머신 구매</span>
                                </a>
                            </h2>
                        </li>
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="캡슐 재활용" src="../img/find/recycle.png">
                                    </span>
                                    <span class="label">캡슐 재활용</span>
                                </a>
                            </h2>
                        </li>
                    </ul>
                </div>
                <div class="form_search" id="search">
                    <form accept-charset="UTF-8" action="." id="locationForm" method="get" role="search">
                        <div class="location">
                            <label class="a11y-hidden" for="pac-input"></label>
                            <input aria-describedby="locationExplanation" autocomplete="off" class="form_text controls" id="pac-input" placeholder="주소, 우편번호, 시/도" tabindex="1" type="text" value="">
                            <button aria-hidden="true" class="cancel-btn" tabindex="-1" type="button"></button>
                            <button aria-label="내 위치에서 가까운 매장 찾기" class="geoloc-btn activated" tabindex="2" type="button"></button>
                        </div>
                        <button class="form-submit" id="btnSearch" onclick="" tabindex="4" type="button"><span>검색</span></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="map" style="width:100%; height: 100vh;"></div>
    <div class="open closed" id="results">
        <div aria-hidden="true" class="results-header nb-shops hidden" id="storeResultsHeader" style="padding-bottom: 10px">
            <span id="results_number">19</span> 검색 결과                            </div>
        <div class="results-empty loading" style="display: none;">
            <img alt="" src="img/loader.gif">
        </div>
        <div class="results-ctn vscroll hidden" style="padding-top: 10px">
            <ul aria-labelledby="storeResultsHeader storeResultDesc" id="store-locator-results">
                <c:forEach var="f" items="${fsinfo}">
                    <li id="f_info_list${f.sno}" style="border-top: solid 1px black">
                        <button id="shop-item${f.sno}" class="shop-item" type="button">
                            <div class="StoreResult-content">
                                <p id="shop_sno_p${f.sno}" style="display: none">${f.sno}</p>
                                <div class="shop-name">
                                    <strong>${f.sname}</strong>
                                </div>
                                <div class="shop-address" style="text-align: left;">
                                    ${f.address}<br>
                                    ${f.jibeon}<br>
                                    <div class="phone" aria-label="전화번호 :  080-734-1111&nbsp;">
                                        Tel. ${f.phone}
                                    </div>
                                </div>
                                <div class="Capabilities shop-attributes">
                                    <ul>
                                        <li id="c_m_street${f.sno}" style="width: 50px; float: left; font-size: 5px; background-color: #F3F3F3; color: #6E6E6E; margin-right: 5px">0 km&nbsp;</li>
                                        <li style="width: 20px; float: left; font-size: 5px; background: #F3F3F3; margin-right: 10px"><img src="../img/find/recyclesmall.png"></li>
                                        <li style="width: 80px; float: left; font-size: 5px; background: #F3F3F3; color: #6E6E6E;" >무료 커피 시음</li>
                                    </ul>
                                </div>
                            </div>
                        </button>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="holder">
            <a></a>
        </div>
        <fmt:parseNumber var="lsno" value="0"/>
<c:forEach var="l" items="${location}">
    <p id="lsname${l.sno}" style="display: none">${l.sname}</p>
    <p id="llat${l.sno}" style="display: none">${l.lat}</p>
    <p id="llng${l.sno}" style="display: none">${l.lng}</p>
    <c:set var="lsno" value="${lsno + 1}" />
</c:forEach>
        <p style="display: none" id="lsno">${lsno}</p>
    </div>
    <div id="shop_info_window">
    </div>
</main>

