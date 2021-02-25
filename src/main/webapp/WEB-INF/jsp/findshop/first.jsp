<%@ page pageEncoding="UTF-8" %>
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
        <video autoplay loop muted>
            <source src="../../video/mapbgv1.mp4" type="video/mp4">
            <strong>Your browser does not support the video tag.</strong>
        </video>
        <div class="map_title">
            <p>매장 찾기</p>
            <h2>이용 목적에 맞는 매장 찾기</h2>
        </div>
        <div class="adress_input_box">
            <div class="box_wrap">
                <div class="tabs">
                    <ul id="shops" role="tablist">
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="캡슐 구매" src="../../img/find/capsulecoffee.png">
                                    </span>
                                    <span class="label">캡슐 구매</span>
                                </a>
                            </h2>
                        </li>
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="머신 구매" src="../../img/find/coffeemaker.png">
                                    </span>
                                    <span class="label">머신 구매</span>
                                </a>
                            </h2>
                        </li>
                        <li class="box_list">
                            <h2>
                                <a tabindex="-1">
                                    <span class="icon">
                                        <img alt="캡슐 재활용" src="../../img/find/recycle.png">
                                    </span>
                                    <span class="label">캡슐 재활용</span>
                                </a>
                            </h2>
                        </li>
                    </ul>
                </div>
                <div id="search" class="form_search">
                    <form id="locationForm" role="search" action="." method="get" accept-charset="UTF-8">
                        <div class="location">
                            <label for="location" class="a11y-hidden"></label>
                            <input id="location" class="form_text" type="text" value="" tabindex="1" placeholder="주소, 우편번호, 시/도" aria-describedby="locationExplanation" autocomplete="off">
                            <button class="geoloc-btn activated" tabindex="2" type="button" aria-label="내 위치에서 가까운 매장 찾기"></button>
                            <button class="clear-btn" tabindex="-1" type="button" aria-hidden="true"></button>
                        </div>
                        <button type="submit" class="form-submit" id="btnSearch" tabindex="4"><span>검색</span></button>
                    </form>
                </div>
                <div id="map" style="width:100%; height: 100vh;"></div>
                <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1CCvsEeWN2zyvgcL8RGZ67905NDrwOgM&callback=initMap&region=kr"></script>
                <script>
                    function initMap() {
                        var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
                        var map = new google.maps.Map(
                            document.getElementById('map'), {
                                zoom: 12,
                                center: seoul
                            });
                        new google.maps.Marker({
                            position: seoul,
                            map: map,
                            label: "서울 중심 좌표"
                        });
                    }
                </script>
            </div>
        </div>
    </div>
</main>

