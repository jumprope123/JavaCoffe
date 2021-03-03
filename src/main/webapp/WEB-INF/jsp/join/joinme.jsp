<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<script src="https://www.google.com/recaptcha/api.js"></script>
<style>
    .zipsize {
       width: 20%;
       margin-top: 10px;
    }
</style>
<div id="main margin30 container">
    <div class="margin30 container">
        <h3 class="main_join"><img src="/img/login/GLYPHICONS/glyphicons_043_group.png">회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                이용약관</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-success btn-sm" disabled>
                실명확인</button></li>
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-success btn-sm" disabled>
                정보입력</button></li>
        <li class="breadcrumb-item ">
            <button type="button" class="btn btn-light btn-sm" disabled>
                가입완료</button></li>
    </ul>

    <div class="container margin100">
        <h2 class="site_agree">회원정보 입력</h2>
        <small class="text-muted site_agree_gray">
            회원정보는 개인정보 취급방침에 따라 안전하게 보호되며,
            회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.
        </small>
        <hr>
    </div><!-- 제목 -->

    <div class="card card-body bg-light margin1050">
        <h3 class="font-weight-bold normal_join">일반회원</h3>

        <form name="joinfrm" id="joinfrm">
            <div class="row margin30">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="name">이름</label>
                        <input type="text" name="name" id="name"
                               class="form-control col-2 border-info" readonly value="${param.name}">
                    </div><!--이름-->          <%--param 쿼리문을 받아서 넘어온값을 value값으로.ID값을 넣어주면 적용됨--%>

                    <div class="form-group row">
                        <label class="col-2 col-form-label  text-right"
                               for="jumin1">주민등록번호</label>
                        <input type="text" name="jumin1" id="jumin1"
                               class="form-control col-2 border-info" readonly value="${param.jumin1}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="password" name="jumin2" id="jumin2"
                               class="form-control col-2 border-info" readonly value="${param.jumin2}">
                    </div><!--주민번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="newid">아이디</label>
                        <input type="text" name="userid" id="newid"
                               class="form-control col-2 border-info"
                               value="${mvo.userid}">
                        <span id="uidmsg" class="col-form-label text-danger">
                           &nbsp;&nbsp;7~16 자의 영문 소문자, 숫자와 특수기호(_)만
                           사용할 수 있습니다.
                        </span>
                    </div><!--아이디-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="newpwd">비밀번호</label>
                        <input type="password" name="passwd" id="newpwd"
                               class="form-control col-2 border-info">
                        <span class="col-form-label text-danger">
                           &nbsp;&nbsp;7~16 자의 영문 소문자, 숫자와 특수문자
                           사용할 수 있습니다.
                        </span>
                    </div><!--비밀번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="repwd">비밀번호 확인</label>
                        <input type="password" name="repwd" id="repwd"
                               class="form-control col-2 border-info">
                        <span class="col-form-label text-danger">
                           &nbsp;&nbsp;이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.
                        </span>
                    </div><!--비밀번호 확인-->

                    <div class="form-group row">
                        <div class="col-12">
                            <div class="row">
                        <label class="col-2 col-form-label text-right">우편번호</label>
                        <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            </div>
                        <div class="row">
                                <label class="col-2 col-form-label text-right"></label>
                                <input type="text" class="input_text zipsize" name="userAddr1" style="height: 2rem;" id="sample6_address" placeholder="주소"><br>
                                <input type="text" class="input_text zipsize" name="userAddr2" id="sample6_detailAddress" placeholder="상세주소">
                                <input type="text" class="input_text zipsize" name="userAddr3" id="sample6_extraAddress" placeholder="추가주소">
                        </div>
                    </div>
                </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="email1">이메일</label>

                        <input type="text" name="email1" id="email1"
                               class="form-control col-2 border-info igborder"
                               value="${mvo.email}">&nbsp;

                        <div class="input-group-append">
                            <span class="input-group-text igborder">@</span>
                        </div>
                        <input type="text" name="email2" id="email2" readonly
                               class="form-control col-2 border-info igborder"
                               value="${mvo.email}">&nbsp;
                        <select id="email3" class="form-control col-2 border-info igborder">
                            <option>선택</option>
                            <option value="naver.com">naver.com</option>
                            <option>gmail.com</option>
                            <option>daum.net</option>
                            <option>nate.com</option>
                            <option>직접 입력하기</option>
                        </select>
                    </div><!--이메일-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="hp1">개인 연락처</label>
                        <select id="hp1" name="hp1" style="width: 85px;" class="form-control border-info">
                            <option>선택</option>
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                        </select>
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" name="hp2" id="hp2"
                               class="form-control col-1 border-info"
                               value="${mvo.phone}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" name="hp3" id="hp3"
                               class="form-control col-1 border-info"
                               value="${mvo.phone}">
                    </div><!--전화번호-->
<%--
                    <div class="form-group row">
                        <label class="col-2 text-info text-right">자동가입방지</label>
                        <div class="g-recaptcha"
                             data-sitekey="6Le81joaAAAAAJt1AUAXPyoaNPoS0XkPFWvF3tp8"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                        <span style="color: red">${checkCaptcha}</span>

                    </div><!--자동가입방지-->--%>

                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" id="joinbtn"
                            class="btn btn-primary">
                        <i class="bi bi-check"></i> 입력완료</button>
                    <button type="button" id="canclebtn"
                            class="btn btn-danger">
                        <i class="bi bi-x"></i><a href="/index" class="text-white" style="text-underline: none; text-decoration: none">취소하기</a></button>
                </div>
            </div><!--버튼들-->

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="sample6_postcode1" id="sample6_postcode1">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="phone" id="phone">

        </form>
    </div><!-- 정보입력 -->

</div><!-- main -->


<div class="all_agree_bottom"></div>

