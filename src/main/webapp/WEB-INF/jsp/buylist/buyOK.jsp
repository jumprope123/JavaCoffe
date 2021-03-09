<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty UID}">
    <script>
        alert('로그인 페이지로 이동합니다.');
        location.href="/login/login";
    </script>
</c:if>

<div id="main">
    <div class="row">
        <div class="col-12 text-center mt-5">
            <img src="/img/buypage/ttabong.jpg" style="width: 300px; height: 300px;">
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-center mb-5">
            <p class="h1">결제 고마워요!</p>
        </div>
    </div>
</div>