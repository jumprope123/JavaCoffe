
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>





<div id="main margin30 container">
    <div class="margin30 container">
        <h3 class="main_join"><img src="/img/login/GLYPHICONS/glyphicons_043_group.png">회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item">
            <button type="button" class="btn btn-success btn-sm" disabled>
                이용약관</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                실명확인</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                정보입력</button></li>
        <li class="breadcrumb-item active ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                가입완료</button></li>
    </ul>

    <div class="container margin100">
        <h2 class="site_agree">회원가입 완료</h2>
        <small class="text-muted site_agree_gray">
            안전하고 편리한 홈페이지 이용을 위해 회원님의 아이디와
            비밀번호 관리에 주의해 주시기 바랍니다.
        </small>
        <hr>
    </div>

    <div class="jumbotron margin1050 bg-info text-white">
        <h1 class="site_agree">회원가입을 축하합니다</h1>
        <p class="margin30 site_agreefont">게시판 글작성, 쇼핑몰 등을 <br>
            자유롭게 이용하세요
            실명확인 후에도 가입하신 아이디는 변경할 수 없습니다.</p>
        <hr class="bg-white">
        <p class="site_agreefont">회원가입 이후 아이디와 비밀번호는 안전하게 보호하도록 약속드리겠습니다 <br>
            Javapresso에서 즐거운 시간 되십시오</p>
        <p>이름 :${userid}</p>
        <p>이메일 : ${email}</p>
        <p>가입일시 : ${regdate}</p>
    </div>

    <div class="text-center">
        <button type="button" id="go2index"
                class="btn btn-success">
            <i class="bi bi-house-fill"
               style="position: relative; top: -2px;"></i> 메인으로 이동</button>
    </div>
</div><!-- main -->
<div class="all_agree_bottom"></div>
