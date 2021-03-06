
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<div class="form-group row">
    <label class="col-2 col-form-label text-right" for="newpwd">비밀번호</label>
    <input type="password" name="passwd" id="newpwd"
           class="form-control col-2 border-info">
    <span id="pwmsg" class="col-form-label text-danger">
                           &nbsp;&nbsp;7~16 자의 영문자,숫자,특수문자를 입력하세요.
                        </span>
</div><!--비밀번호-->--%>
<div id="main margin30 container " class="total_size_login center_login1 center_login2" >
    <div class="margin30 container">

    <form action="/join/login" method="post">
        <p class="p_login_font"><i class="bi bi-person-square login_icon"></i>로그인 페이지</p>
        <div class="form-group row">
            <label for="userID"></label>
            <input type="text" name="userID" id="userID" class="input_login_bar" placeholder="아이디" style="margin-top: 5px;">
        </div>
        <div class="form-group row">
            <label for="userPW"></label>
            <input type="text" name="userPW" id="userPW" class="input_login_bar" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <div class="form-group row">
            <label>
                <input type="checkbox" style="position: relative; top: 1px;">&nbsp;로그인유지
                <button type="submit" id="Login_Index" class="btn btn-primary login_button">로그인</button>
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
        $('#Login_Index').on('click',function (){
            //$('#Login_Index').attr('action', '/index'); //
            //$('#Login_Index').attr('method', 'post');
            $('#Login_Index').submit();
            location.href = '/index';
        });
</script>

</body>
</html>
<!-- main -->