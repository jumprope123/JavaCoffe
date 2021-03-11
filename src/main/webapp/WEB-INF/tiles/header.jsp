<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>   <%--<<<<< 이건 나중에 생각해보기--%>

<header id="top">
    <div id="header">
        <div class="top_wrapper">
            <div class="header_top">
                <div class="hlogo">
                    <a class="logo_linked_home" href="/index">
                        <img alt="로고" class="header_logo" height="30px" src="../img/base/javapressologo.png" width="170px" />
                    </a>
                    <!-- 헤더 로고 -->
                </div>
                <div class="header_customer">
                    <div class="header_login">
                        <c:if test="${empty sessionScope.UID}">
                            <button data-toggle="dropdown" class="LoginDropdownButton dropdown-toggle" class="LoginDropdownButton" id="hloginbtn" aria-expanded="false">
                                로그인 하기
                                <!--aria-expanded="false"-->
                            </button>
                            <div>

                            </div>
                            <ul class="dropdown-menu">
                                <li>
                                    <form class="form-inline login-form" action="/login/login" method="post">
                                        <div class="input-group" style="width: 225px; margin-left: 2px">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input type="text" name="userid" id="userID" class="form-control bidragup"  placeholder="Username" required>
                                        </div>
                                        <div class="input-group" style="width: 225px; margin-left: 2px" >
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" name="passwd" id="userPW" class="form-control bidragup"  placeholder="Password" required>
                                        </div>
                                        <button id="s_hloginbtn" type="submit" class="btn btn-primary bidragdown2" style="margin-left: 2px">Login</button>
                                        <p id="joinorbindP">${joinorbind}</p>
                                        <a href="https://kauth.kakao.com/oauth/authorize?client_id=9c38cdfacc89f99ac0fe0615bba90cd9&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code" class="kakao_login_btn_position"><img
                                                src="../img/login/kakao_login_medium.png" class="bidragdown2" width="66.09px" height="38px" style="margin-left: 3px"></a>
                                    </form>
                                </li>
                            </ul>
                        </c:if>
                        <c:if test="${!empty sessionScope.UID}">
                            <%-- 스크립트 함수 추가 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
                                <button data-toggle="dropdown" class="LoginDropdownButton dropdown-toggle" class="LoginDropdownButton"  id="hloginbtn1" aria-expanded="false" onclick="logout()">
                                   로그아웃
                                    <!--aria-expanded="false"-->
                                </button>
                        </c:if>
                    </div>
                    <c:if test="${empty sessionScope.UID}">
                    <div class="header_join">
                        <button class="JoinDropdownButton" id="hjoinbtn">
                            회원가입은 여기에서
                            <!--aria-expanded="false"-->
                        </button>
                    </div>
                    </c:if>
                    <c:if test="${!empty sessionScope.UID}">
                    <div class="header_join">
                        <button class="JoinDropdownButton" id="h_mybasket">
                            장바구니로 이동
                            <!--aria-expanded="false"-->
                        </button>
                    </div>
                    </c:if>
                    <c:if test="${!empty sessionScope.UID}">
                        <div class="header_memberInfo">
                            <button class="JoinDropdownButton" id="h_mymemberinfo">
                                ${UID}님 정보 보기
                                <!--aria-expanded="false"-->
                            </button>
                        </div>
                        <%--   여기에 추가함 -> session값이 있는데, 카카오아이디값이 없을때--%>
                        <c:if test="${sessionScope.AboutKakao eq 0}">
                            <div style="margin-left: 20px">
                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=9c38cdfacc89f99ac0fe0615bba90cd9&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code" id="kakao_login_btn_" class="kakao_login_btn_position">
                                    <img src="../img/login/kakao_connec_login.png"  width="208px;" height="40px"></a>
                            </div>
                        </c:if>
                        <%--                여기에 추가함--%>
                    </c:if>

                </div>
                <!-- 헤더 커스텀(로그인, 회원가입) -->
            </div>
        </div>
        <nav class="header_navbar">
            <div class="nav_wrap">
                <ul class="nav_menu">
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="/index">
                            <div class="navbar_element">
                                <div class="navbar_title">소개</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 소개 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="/CoffeeAndMachine/navi">
                            <div class="navbar_element">
                    <span class="navbar_icon" style="width: 30px; height: 20px;">
                    </span>
                                <div class="navbar_title">원두추천</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 원두추천 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="#">
                            <div class="navbar_element">
                    <span class="navbar_icon" style="width: 30px; height: 20px;">
                    </span>
                                <div class="navbar_title">머신추천</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 머신추천 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="/board/list?cp=1">
                            <div class="navbar_element">
                    <span class="navbar_icon" style="width: 30px; height: 20px;">
                    </span>
                                <div class="navbar_title">고객센터</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 게시판 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="/review/list?cp=1">
                            <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                                <div class="navbar_title">후기</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
              <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                후기 게시판 열기
              </button>
            </span>
                    </li>
                    <li class="navbar_Item">
                        <a class="navbar_anchor" href="/findshop/first">
                            <div class="navbar_element">
                    <span class="navbar_icon" style="width: 30px; height: 20px;">
                    </span>
                                <div class="navbar_title">매장찾기</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 매장찾기 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item" id="nav_e-shop">
                        <a class="navbar_anchor" href="/eshop/list?bigGenre=coffe&cp=1">
                            <div class="navbar_element">
                    <span class="navbar_icon" style="width: 30px; height: 20px;">
                    </span>
                                <div class="navbar_title">e-shop</div>
                            </div>
                        </a>
                        <span class="VisuallyHidden">
                  <button aria-expanded="false" class="navbar_button" tabindex="-1" type="button">
                    서브 메뉴 e-shop 열기
                  </button>
                </span>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>