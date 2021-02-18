<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header id="top">
    <div id="header">
        <div class="header_top">
            <div class="hlogo">
                <a href="#" class="logo_linked_home">
                    <img alt="로고" width="170px" height="30px" src="./img/base/javapressologo.png" class="header_logo" />
                </a>
                <!-- 헤더 로고 -->
            </div>
            <div class="header_customer">
                <div class="header_login">
                    <button id="hloginbtn" class="LoginDropdownButton">
                        로그인 하기
                    </button>
                </div>
                <div class="header_join">
                    <button id="hjoinbtn" class="JoinDropdownButton">
                        회원가입은 여기에서
                    </button>
                </div>
            </div>
            <!-- 헤더 커스텀(로그인, 회원가입) -->
        </div>
        <nav class="header_navbar">
            <ul class="nav_menu">
                <li class="navbar_Item">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">소개</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 소개 열기
              </button>
            </span>
                </li>
                <li class="navbar_Item">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">원두추천</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 원두추천 열기
              </button>
            </span>
                </li>
                <li class="navbar_Item">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">머신추천</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 머신추천 열기
              </button>
            </span>
                </li>
                <li class="navbar_Item">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">게시판</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 게시판 열기
              </button>
            </span>
                </li>
                <li class="navbar_Item">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">매장찾기</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 마장찾기 열기
              </button>
            </span>
                </li>
                <li class="navbar_Item" id="nav_e-shop">
                    <a href="#" class="navbar_anchor">
                        <div class="navbar_element">
                <span class="navbar_icon" style="width: 30px; height: 20px;">
                </span>
                            <div class="navbar_title">e-shop</div>
                        </div>
                    </a>
                    <span class="VisuallyHidden">
              <button tabindex="-1" aria-expanded="false" type="button" class="navbar_button">
                서브 메뉴 e-shop 열기
              </button>
            </span>
                </li>
            </ul>
        </nav>
    </div>
</header>