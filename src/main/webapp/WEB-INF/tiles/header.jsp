<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="row">
    <div class="col-6">
        <h1><a href="/index" class="colblack">Lorem Ipsum</a></h1>
    </div>
    <div class="col-6 text-right">
            <%-- 세션변수 UID의 값이 존재하지 않는다면 (즉, 로그인을 하지 않았다면) --%>
            <c:if test="${empty UID}">
        <h1>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginmodal">로그인</button>
            <button type="button" class="btn btn-primary" id="join2btn">회원가입</button>
        </h1>
            </c:if>
                <%-- 세션변수 UID의 값이 존재한다면 (즉, 로그인 했다면) --%>
            <c:if test="${not empty UID}">
        <h1>
            <button type="button" class="btn btn-dark" id="logoutbtn">로그아웃</button>
        </h1>
            </c:if>
    </div>
</header>

<nav class="nav navbar-expand navbar-dark bg-dark">
    <ul class="nav navbar-nav nav-fill w-100">
        <li class="nav-item"><a class="nav-link" href="#">소개</a></li>
        <li class="nav-item"><a class="nav-link" href="#">원두&머신추천</a></li>
        <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/review/list?cp=1">후기</a></li>
        <li class="nav-item"><a class="nav-link" href="#">매장찾기</a></li>
        <li class="nav-item"><a class="nav-link" href="#">E-shop</a></li>
    </ul>
</nav>