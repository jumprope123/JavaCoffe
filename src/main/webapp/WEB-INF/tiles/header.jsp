<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header id="top">
    <div id="header">
        <div class="top_wrapper">
            <div class="header_top">
                <div class="hlogo">
                    <a class="logo_linked_home" href="#">
                        <img alt="로고" class="header_logo" height="30px" src="../img/base/javapressologo.png" width="170px" />
                    </a>
                    <!-- 헤더 로고 -->
                </div>
                <div class="header_customer">
                    <div class="header_login">
                        <button data-toggle="dropdown" class="LoginDropdownButton dropdown-toggle" class="LoginDropdownButton" id="hloginbtn" aria-expanded="false">
                            로그인 하기
                            <!--aria-expanded="false"-->
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <form class="form-inline login-form" action="/examples/actions/confirmation.php" method="post">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="text" class="form-control" placeholder="Password" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <div class="header_join">
                        <button class="JoinDropdownButton" id="hjoinbtn">
                            회원가입은 여기에서
                            <!--aria-expanded="false"-->
                        </button>
                    </div>
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
                        <a class="navbar_anchor" href="#">
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
                                <div class="navbar_title">게시판</div>
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
                    서브 메뉴 마장찾기 열기
                  </button>
                </span>
                    </li>
                    <li class="navbar_Item" id="nav_e-shop">
                        <a class="navbar_anchor" href="/eshop/list">
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