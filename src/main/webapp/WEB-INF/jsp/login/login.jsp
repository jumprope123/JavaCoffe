<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .center_login1 {
        margin: 0 auto;
    }
    .center_login2 {
        margin-top: 9%;
        margin-left: 45%;
    }
    .total_size_login {
        width: 20rem;
        height: 22rem;
    }

    .login_icon {
        position: relative;
        right: 5px;
        bottom: 2px;
    }

    .login_button {
        position:relative;
        left: 2.85rem;
        bottom: 3px;
    }

    .p_login_font {
        margin-bottom: 5px;
        font-size: 16px;
        font-weight: bold;
    }

    .input_login_bar {
        width: 13rem;
        height: 2rem;
        border: 2px solid #5a6268;
        border-radius: 3px;
    }
</style>
<div id="main margin30 container">
    <div class="margin30 container center_login1 center_login2 total_size_login ">
        <form onsubmit="submitLoginForm(this); return false;"
                action="/login/login" method="post">
            <p class="p_login_font"><i class="bi bi-person-square login_icon"></i>로그인 페이지</p>
            <div class="form-group row">
                <label for="userid"></label>
                <input type="text" name="userid" id="userID" class="input_login_bar" placeholder="아이디" style="margin-top: 5px;">
            </div>
            <div class="form-group row">
                <%--@declare id="passwd"--%><label for="passwd"></label>
                <input type="password" name="passwd" id="userPW" class="input_login_bar" placeholder="비밀번호">
            </div>
            <div class="form-group">
                <div class="form-group row">
                    <label>
                    <input type="checkbox" style="position: relative; top: 1px;">&nbsp;로그인유지
                        <input type="submit" class="btn btn-primary login_button" value="로그인"/>
                    </label>
                </div>
            </div>
            <div class="form-group row">
                <a href="#" style="border-right: 1px solid #000000; padding-right: 5px;">비밀번호 찾기</a>
                <a href="/join/agree" class="text-center" style="margin-left: 5px">회원가입</a>
            </div>
        </form>
    </div>
</div>
<script>
$('#userID').on('blur', function () { checkLogin(); })

    function checkLogin() {
        $.ajax({ url: 'login/checkLogin',
        type: 'GET',
        data : { uid: $('#userID').val() }
        })
            .done()
            .fail();
    }



   function submitLoginForm(form) {
       form.userID.value = form.userID.value.trim();
       if (form.userID.value.length == 0) {
           alert('아이디를 입력해주세요.');
           form.userID.focus();
           return false;
       }

       form.userPW.value = form.userPW.value.trim();
       if (form.userPW.value.length == 0) {
           alert('비밀번호를 입력해주세요.');
           form.userPW.focus();
           return false;
       }
       form.submit();
   }
</script>
<!-- main -->