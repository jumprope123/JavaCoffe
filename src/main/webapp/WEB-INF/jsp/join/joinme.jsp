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

        <form name="joinfrm" id="joinfrm" action="/join/joinok.jsp" method="post">
            <div class="row margin30">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="name">이름</label>
                        <input type="text" name="name" id="name"
                               class="form-control col-2 border-info" readonly value="${name2}">
                    </div><!--이름-->          <%--param 쿼리문을 받아서 넘어온값을 value값으로.ID값을 넣어주면 적용됨--%>

                    <div class="form-group row">
                        <label class="col-2 col-form-label  text-right"
                               for="jumin1">주민등록번호</label>
                        <input type="text" name="jumin1" id="jumin1"
                               class="form-control col-2 border-info" readonly value="${jumin1}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="password" name="jumin2" id="jumin2"
                               class="form-control col-2 border-info" readonly value="${jumin2}">
                    </div><!--주민번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="newid">아이디</label>
                        <input type="text" name="userid" id="newid"
                               class="form-control col-2 border-info"
                               value="${mvo.userid}">
                        <button type="button" id="checkuidbtn" class="btn btn-secondary" onclick="checkuid()" style="margin-left: 8px;">중복확인</button>
                    </div><!--아이디-->
                    <%--<p id="idmsg">영문 4자리이상 대,소문자 및 숫자만 입력가능합니다.</p>--%>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="newpwd">비밀번호</label>
                        <input type="password" name="passwd" id="newpwd"
                               class="form-control col-2 border-info">
                        <span id="pwmsg" class="col-form-label text-danger">
                           &nbsp;&nbsp;7~16 자의 영문자,숫자,특수문자를 입력하세요.
                        </span>
                    </div><!--비밀번호-->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right"
                               for="repwd">비밀번호 확인</label>
                        <input type="password" name="repwd" id="repwd"
                               class="form-control col-2 border-info">
                        <span class="col-form-label text-danger">
                           &nbsp;&nbsp;비밀번호를 한번 더 입력하세요.
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
                                <input type="text" class="input_text zipsize" name="userAddr1" style="height: 2.5rem;" id="sample6_address" placeholder="주소"><br>
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
                               class="form-control col-2 border-info igborder" style="margin-left: 3px;"
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

                   <div class="form-group row">
                        <label class="col-2 text-right" style="padding-top: 1.8rem;">자동가입방지</label>
                        <div class="g-recaptcha" data-sitekey="6LfA1joaAAAAAOU9f2VaZdKu9Z4C_tWErqdpFnqf"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                        <span style="color: red">${checkCaptchaforJoin}</span>
                   </div><!--자동가입방지-->

                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" id="joinbtn" onclick="checkPWReg()||checkEmailReg()||checkPhoneReg()||checkIDReg()"
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
    <script>
        function checkIDReg() { //아이디 유효성 검사 구문
            var IDExp = /^[A-za-z0-9]{4,16}$/g;
            var ID = document.getElementById("newid");

            if (IDExp.test(ID.value) === false) {
                alert("아이디형식이 맞지 않습니다.");
                $("#newid").val("");
                $("#newid").focus();
                return false;
            }
        }
        function checkPWReg() { // 비밀번호 유효성 검사 구문
            var PWExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{7,16}$/
            var PW = document.getElementById("newpwd");
           // var REPW = document.getElementById("repwd");

            if(PWExp.test(PW.value) === false ){
                alert("비밀번호형식이 맞지 않습니다.");
                $("#newpwd").val("")
                $("#repwd").val("")
                return false;
            }
        }
        //function checkZIPReg() { // 우편번호 유효성 검사 구문 필요없는듯
        //    var ZIPExp = /^[0-9]{3,4}-[0-9]{3,4}$/
        //    var ZIP = document.getElementById("sample6_detailAddress");

            //if (ZIPExp.test(ZIP.value) === false) {
             //   alert("주소형식이 맞지 않습니다.");
             //   $("#sample6_detailAddress").val("")
             //   $("#sample6_detailAddress").focus();
             //   return false
           // }
       // }
        function checkEmailReg(){ // 이메일 유효성 검사 구문
            var EmailExp = /^[a-zA-Z0-9]+$/;
            var EMAIL = document.getElementById("email1");

            if (EmailExp.test(EMAIL.value) === false) {
                alert("이메일형식이 맞지 않습니다.");
                $("#email1").val("")
                return false
            }
        }

        function checkPhoneReg() {
            var PhoneExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/
            var PHONE1 = document.getElementById("hp1");
            var PHONE2 = document.getElementById("hp2");
            var PHONE3 = document.getElementById("hp3");

            if (PhoneExp.test(PHONE1.value) && (PHONE2.value) && (PHONE3.value) === false) {
                alert("전화번호형식이 맞지 않습니다.");
                $('#hp1').val("")
                $('#hp2').val("")
                $('#hp3').val("")
                return false
            }
        }
    </script>
<div class="all_agree_bottom"></div>

<!-- main -->